import 'package:eitherx/eitherx.dart';
import 'package:stylish/Features/Home/data/models/product_model/product_response_model.dart';
import 'package:stylish/core/utils/helper/error/faliure.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<ProductModel>>> fetchProducts({
    int limit,
    int skip,
  });
}
