import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_application/features/auth/auth_service.dart';
import 'package:fyp_application/features/auth/token_service.dart';
import 'package:fyp_application/features/home/home_view.dart';
import 'package:fyp_application/features/login/signup.dart';


final signInProvider = Provider((ref) => SignIn());

class SignIn extends ConsumerWidget {

  final Dio _dio = Dio();

  static const String apiUrl = 'http://localhost:3000/api/login/';


  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  static const routeName = '/SignIn';

  SignIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(1.00, 0.00),
                    end: Alignment(-1, 0),
                    colors: [
                      Color(0xFFFC8A19),
                      Color(0xFFFD7713),
                      Color(0xFFFE600C)
                    ],
                  ),
                ),
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 36, vertical: 24),
                child: const Text(
                  'Hello\nSign In!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontFamily: 'Inria Sans',
                    fontWeight: FontWeight.w700,
                    //height: 0,
                    letterSpacing: 0.36,
                  ),
                )),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(1.00, 0.00),
                  end: Alignment(-1, 0),
                  colors: [
                    Color(0xFFFC8A19),
                    Color(0xFFFD7713),
                    Color(0xFFFE600C)
                  ],
                ),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.only(top: 56, left: 24, right: 24),
                //clipBehavior: Clip.antiAlias,
                decoration: const ShapeDecoration(
                  color: Colors.white,
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
                          side: const BorderSide(
                              width: 2, color: Color(0xFFFC8A19)),
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
                    const SizedBox(height: 30),
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
                          side: const BorderSide(
                              width: 2, color: Color(0xFFFC8A19)),
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
                    const SizedBox(height: 50),
                    Container(
                        constraints: const BoxConstraints(minWidth: 345),
                        height: 53,
                        padding: const EdgeInsets.only(top: 3, left: 3),
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(1.00, 0.00),
                            end: Alignment(-1, 0),
                            colors: [
                              Color(0xFFFC8A19),
                              Color(0xFFFD7713),
                              Color(0xFFFE600C)
                            ],
                          ),
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
                            //ref.read(authRepositoryProvider).Signin(usernameController.text, passwordController.text);
                           //var res = postLogindata(passwordController.text, emailController.text);
                            final response = await ref.read(authServiceProvider).postLogindata(passwordController.text, emailController.text);

                            await ref.read(tokenServiceProvider).setToken(response.data.toString());
                            String? t= await ref.read(tokenServiceProvider).getToken();
                            print("test token: "+t!);
                            Navigator.restorablePushNamed(context, HomeView.routeName);
                          },
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              //padding: const EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent),
                          child: const Text(
                            "Sign In",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inria Sans',
                                fontWeight: FontWeight.w400,
                                fontSize: 24,
                                height: 0),
                          ),
                        )),
                    const SizedBox(
                      height: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              'Don\'t have account?',
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
                                      context, Signup.routeName);
                                },
                                child: const Text(
                                  'Sign Up',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xFFFE640D),
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
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> postLogindata(String password,String email) async {
    try {
      final response = await _dio.post(apiUrl,
        data: {
          'email': email,
          'password':password,

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
