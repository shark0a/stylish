import 'package:flutter/material.dart';
import 'package:stylish/Features/Home/data/models/product_model/product_response_model.dart';
import 'package:stylish/Features/Home/domain/repo/home_repo.dart';
import 'package:stylish/Features/auth/data/models/user_response_model.dart';
import 'package:stylish/core/service/services_locator.dart';
import 'package:stylish/core/utils/helper/error/faliure.dart';
import 'package:stylish/core/utils/helper/hive_keys.dart';
import 'package:stylish/core/utils/helper/hive_service.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider({required HomeRepo homeRepo}) : _homeRepo = homeRepo {
    loadingUerLocalData();
  }
  final HomeRepo _homeRepo;
  UserModel? userData;

  void loadingUerLocalData() {
    userData = sl.get<HiveService>().getData<UserModel>(
      HiveKey.userDataBoxName,
      'userData',
    );
    notifyListeners();
  }

  int offerCardIndexIndicator = 0;
  void togglefferCardIndexIndicator(int index) {
    offerCardIndexIndicator = index;
    notifyListeners();
  }

  // bottom navigation bar index controll
  int bottomNavigationbarIndex = 0;
  void setbottomNavigationbarIndex(int index) {
    bottomNavigationbarIndex = index;
    notifyListeners();
  }

  ///item scroll button handle
  final ScrollController scrollController = ScrollController();
  int currentIndex = 0;
  final double itemWidth = 160;

  void scrollNext(int itemCount) {
    if (currentIndex < itemCount - 1) {
      currentIndex++;
    } else {
      currentIndex = 0;
    }
    _animateToIndex();
  }

  void _animateToIndex() {
    scrollController.animateTo(
      currentIndex * (itemWidth + 12),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  void scrollPrevious() {
    if (currentIndex > 0) {
      currentIndex--;
      _animateToIndex();
    }
  }
  //fetch data

  final List<ProductModel> _products = [];
  List<ProductModel> get products => List.unmodifiable(_products);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;

  bool _hasMore = true;
  bool get hasMore => _hasMore;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  int _limit = 10;
  int _skip = 0;
  bool isFirstLoadDone = false;

  Future<void> fetchProducts({int limit = 10, bool firstLoad = true}) async {
    if (isFirstLoadDone && firstLoad) return;

    _isLoading = true;
    _errorMessage = null;
    if (firstLoad) {
      _products.clear();
      _limit = limit;
      _skip = 0;
      _hasMore = true;
    }
    notifyListeners();

    final result = await _homeRepo.fetchProducts(limit: _limit, skip: _skip);

    result.fold(
      (Failures failure) {
        _errorMessage = failure.errMessage;
        _isLoading = false;
        notifyListeners();
      },
      (List<ProductModel> fetched) {
        _products.addAll(fetched);
        _skip += fetched.length;
        _hasMore = fetched.length == _limit;
        _isLoading = false;
        isFirstLoadDone = true; // ✅ تم التحميل بنجاح
        notifyListeners();
      },
    );
  }

  Future<void> loadMore() async {
    if (_isLoading || _isLoadingMore || !_hasMore) return;

    _isLoadingMore = true;
    notifyListeners();

    final result = await _homeRepo.fetchProducts(limit: _limit, skip: _skip);

    result.fold(
      (Failures failure) {
        _errorMessage = failure.errMessage;
        _isLoadingMore = false;
        notifyListeners();
      },
      (List<ProductModel> fetched) {
        if (fetched.isEmpty) {
          _hasMore = false;
        } else {
          _products.addAll(fetched);
          _skip += fetched.length;
          _hasMore = fetched.length == _limit;
        }
        _isLoadingMore = false;
        notifyListeners();
      },
    );
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
