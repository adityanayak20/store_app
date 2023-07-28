import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://dummyjson.com/')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('carts')
  Future<dynamic> getCarts();

  @GET('products')
  Future<dynamic> getProducts();
}
