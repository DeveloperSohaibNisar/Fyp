import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_application/features/login/signin.dart';
import 'package:fyp_application/features/auth/token_service.dart';
final signupProvider = Provider((ref) => Signup());


class Signup extends StatelessWidget {

  final Dio _dio = Dio();

  static const String apiUrl = 'http://localhost:3000/api/signup/';

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordconController = TextEditingController();
  final emailController = TextEditingController();

  Signup({super.key});
  static const routeName = '/Signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 36, vertical: 24),
                child: const Text(
                  'Create Your\nAccount',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFFFC8A19),
                    fontSize: 36,
                    fontFamily: 'Inria Sans',
                    fontWeight: FontWeight.w700,
                    //height: 0,
                    letterSpacing: 0.36,
                  ),
                )),
            Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.only(top: 56, left: 24, right: 24),
              //clipBehavior: Clip.antiAlias,
              decoration: const ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(1.00, 0.00),
                  end: Alignment(-1, 0),
                  colors: [Color(0xFFFC8A19), Color(0xFFFE600C)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: ShapeDecoration(
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            color: Color(0xFF848488),
                            fontSize: 14,
                            fontFamily: 'Inria Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                          hintText: "Username",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(Icons.person)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: ShapeDecoration(
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            color: Color(0xFF848488),
                            fontSize: 14,
                            fontFamily: 'Inria Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(Icons.email)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: ShapeDecoration(
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            color: Color(0xFF848488),
                            fontSize: 14,
                            fontFamily: 'Inria Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(Icons.password)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: ShapeDecoration(
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: TextField(
                      controller: passwordconController,
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            color: Color(0xFF848488),
                            fontSize: 14,
                            fontFamily: 'Inria Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(Icons.password_outlined)),
                    ),
                  ),
                  const SizedBox(height: 36),
                  Container(
                      constraints: const BoxConstraints(minWidth: 345),
                      height: 53,
                      padding: const EdgeInsets.only(left: 3),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          // Wait for the response from postData function
                          final res = await postData(
                            usernameController.text,
                            passwordController.text,
                            passwordconController.text,
                            emailController.text,
                          );

                          // Handle the response and store it locally
                          if (res != null) {
                            // Convert res.data to a string if necessary
                            String resultString = res.data.toString();
                            TokenService token = TokenService();
                            token.setToken(resultString);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          //padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Colors.white,
                        ),
                        child: const Text(
                          "Sign up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFFFC8A19),
                              fontFamily: 'Inria Sans',
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              height: 0),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Already a user?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 24,
                              fontFamily: 'Inria Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          height: 50,
                          width: double.infinity,
                          child: TextButton(
                              onPressed: () {
                                Navigator.restorablePushNamed(
                                    context, SignIn.routeName);
                              },
                              child: const Text(
                                'Sign in',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontFamily: 'Inria Sans',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> postData(String name, String password, String passwordConfirm, String email) async {
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

}
