import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget{
  final String senderMessage;
  final String senderImage;

  Chat({required this.senderMessage, required this.senderImage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(senderImage),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          constraints: BoxConstraints(

          ),
          decoration: ShapeDecoration(
            color: Color(0xFFF6F9FC),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 280),
            child: Text(
              senderMessage,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Inria Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          )
          ,

        )
        ,
      ]
      ,
    );
  }
}

