import 'package:flutter/material.dart';
import 'package:fyp_application/features/login/signin.dart';
import 'package:fyp_application/features/login/signup.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(1.00, 0.00),
            end: Alignment(-1, 0),
            colors: [Color(0xFFFC8A19), Color(0xFFFD7713), Color(0xFFFE600C)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                Icon(
                  size:60,
                 Icons.image,
                ),
                SizedBox(height: 24),
                Container(
                  child: const Center(
                    child: Text(
                      'Info-Verse',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontFamily: 'Allerta Stencil',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Column(
              children: [
                Container(
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontFamily: 'Inria Sans',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 0.36,
                    ),
                  ),
                ),

                SizedBox(height: 36,),

                Container(
                  child:Column(
                    children: [

                      Container(
                        height: 53,
                        constraints: BoxConstraints(minWidth: 321),
                        padding: const EdgeInsets.symmetric(horizontal: 20,),
                        //clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 2,
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: (){Navigator.restorablePushNamed(context, SignIn.routeName);},
                          child: Text('Sign In',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'Inria Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),),
                        ),
                      ),

                      SizedBox(height: 24,),

                      Container(
                        height: 53,
                        constraints: BoxConstraints(minWidth: 321),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),

                        child:ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            onPressed: (){Navigator.restorablePushNamed(context, Signup.routeName);},
                            child: Text('Sign Up',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFFC8A19),
                                fontSize: 24,
                                fontFamily: 'Inria Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            )
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
