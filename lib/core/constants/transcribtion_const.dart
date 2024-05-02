import 'package:flutter/material.dart';


class Transcribe extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        child: Column(
          children: [
            Text('time',
              style: TextStyle(
                color: Color(0xFF007AFF),
                fontSize: 14,
                fontFamily: 'Calibri',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            SizedBox(height: 10,),
            Text('transcribtion',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Calibri',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}