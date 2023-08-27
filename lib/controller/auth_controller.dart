import 'package:dio/dio.dart';

class AuthController {
  final Dio _dio = Dio();
  Future<Response<dynamic>> login(String email, String password) async {
    try {
      Response<dynamic> response = await _dio.post(
        'https://reqres.in/api/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return response;
    } on DioException catch (e) {
      return e.response!;
    }
  }

  Future<Response<dynamic>> registerUser(String email, String password) async {
    try {
      Response response = await _dio.post(
        'https://reqres.in/api/register',
        data: {
          'email': email,
          'password': password,
        },
      );
      return response;
    } on DioException catch (e) {
      return e.response!;
    }
  }

  Future<Response> logout(int id) async {
    try {
      Response response = await _dio.get(
        'https://reqres.in/api/users/$id',
      );
      return response;
    } on DioException catch (e) {
      return e.response!;
    }
  }
}
