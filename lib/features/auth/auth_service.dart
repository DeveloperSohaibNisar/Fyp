
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

final authServiceProvider = Provider((ref) => AuthService());

class AuthService{

  final _dio = Dio();
  static const String SigninUrl = 'http://localhost:3000/api/login/';
  static const String SignupUrl = 'http://localhost:3000/api/signup/';

  Future<dynamic> postSignupData(String name, String password, String passwordConfirm, String email) async {
    try {
      final response = await _dio.post('http://localhost:3000/api/signup/',
        data: {
          'email': email,
          'password':password,
          'confirmPassword': passwordConfirm,
          'name': name,
        },
        //options: Options(contentType: Headers.formUrlEncodedContentType)

      );
      print(response.statusCode.toString());
      print(response.data.toString());
      return response;

    } catch (e) {
      print('Error adding item: $e');


    }
  }

  Future<dynamic> postLogindata(String password,String email) async {
    try {
      final response = await _dio.post(SigninUrl,
        data: {
          'email': email,
          'password': password,

        },
        //options: Options(contentType: Headers.formUrlEncodedContentType)

      );
      print(response.statusCode.toString());
      print("Token: "+ response.data.toString());
      return response;
    } catch (e) {
      print('Error adding item: $e');
    }
  }

}