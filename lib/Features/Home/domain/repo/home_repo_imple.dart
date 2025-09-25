import 'package:dio/dio.dart';
import 'package:eitherx/eitherx.dart';
import 'package:stylish/Features/Home/data/models/product_model/product_response_model.dart';
import 'package:stylish/Features/Home/domain/repo/home_repo.dart';
import 'package:stylish/core/service/api_service.dart';
import 'package:stylish/core/utils/helper/error/faliure.dart';

class HomeRepoImplementations implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImplementations(this._apiService);

  @override
  Future<Either<Failures, List<ProductModel>>> fetchProducts({
    int limit = 10,
    int skip = 0,
  }) async {
    try {
      var response = await _apiService.get('products?limit=$limit&skip=$skip');
      final List<ProductModel> listProduct = [];

      for (var element in response['products']) {
        listProduct.add(ProductModel.fromJson(element));
      }

      return right(listProduct);
    } on DioException catch (e) {
      return left(ServerFailures.fromDioError(e));
    } catch (e) {
      return Left(ServerFailures('Unexpected error: $e'));
    }
  }
}
