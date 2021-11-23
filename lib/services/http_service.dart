import 'package:dio/dio.dart';
import 'dart:io';

enum Method { POST, GET, PUT, DELETE, PATCH }
const BASE_URL = "https://fakestoreapi.com/";

class HttpService {
  Dio _dio;

  static header() => {"Content-Type": "application/json"};

  Future<HttpService> init() async {
    _dio = Dio(BaseOptions(baseUrl: BASE_URL, headers: header()));
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          print(
              "REQUEST[${requestOptions.method}] => PATH: ${requestOptions.path}"
              "=> REQUEST VALUES: ${requestOptions.queryParameters} => HEADERS: ${requestOptions.headers}");
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          print("RESPONSE[${response.statusCode}] => DATA: ${response.data}");
          return handler.next(response);
        },
        onError: (err, handler) {
          print("Error[${err.response?.statusCode}]");
          return handler.next(err);
        },
      ),
    );
  }

  Future<dynamic> request(
      {String url, Method method, Map<String, dynamic> params}) async {
    Response response;

    try {
      if (method == Method.POST) {
        response = await _dio.post(url, data: params);
      } else if (method == Method.DELETE) {
        response = await _dio.delete(url);
      } else if (method == Method.PATCH) {
        response = await _dio.patch(url);
      } else {
        response = await _dio.get(url, queryParameters: params);
      }

      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something does wen't wrong");
      }
    } on SocketException catch (e) {
      print(e);
      throw Exception("Not Internet Connection");
    } on FormatException catch (e) {
      print(e);
      throw Exception("Bad response format");
    } on DioError catch (e) {
      print(e);
      throw Exception(e);
    } catch (e) {
      print(e);
      throw Exception("Something wen't wrong");
    }
  }
}

/*
Call Service

  HttpService httpService = HttpService();
  
  @override
  void onInit() {
    httpService.init();
    fetchProducts();
    super.onInit();
  }

 void fetchProducts() async {
    try {
      isLoading(true);
      final result =
          await httpService.request(url: "products", method: Method.GET);
      if (result != null) {
        if (result is d.Response) {
          var products = List<ProductsModel>.from(
              (result.data).map((x) => ProductsModel.fromJson(x)));
          productList.value = products;
          logger.d(products);
        } else {
          isLoading(false);
        }
      }
    } finally {
      isLoading(false);
    }
  } 
*/