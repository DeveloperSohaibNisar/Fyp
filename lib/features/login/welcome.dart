import 'package:flutter/material.dart';
import '../home/home_view.dart';


class Welcome extends StatelessWidget {
  const Welcome({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(252, 138, 25, 1),
            Color.fromRGBO(253, 119, 19, 1),
            Color.fromRGBO(254, 96, 12, 1),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Icon(
              size:60,
             Icons.image,
            ),
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
            Container(
              child: Text('Welcome'),
            ),
            Container(
              child:Column(
                children: [
                  ElevatedButton(
                      onPressed: (){Navigator.restorablePushNamed(context, HomeView.routeName);},
                      child: Text('Sign In'),
                  ),
                  ElevatedButton(
                      onPressed: (){},
                      child: Text('Sign Up')
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
