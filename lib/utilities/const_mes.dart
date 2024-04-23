import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BotChat extends StatelessWidget{
  final String senderMessage;

  const BotChat({super.key, required this.senderMessage});

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
              image: NetworkImage("https://www.google.com/imgres?q=bot%20logo&imgurl=https%3A%2F%2Fcdn.dribbble.com%2Fuserupload%2F13167767%2Ffile%2Foriginal-0b388d7870eb7d98416f88bb4c723273.jpg%3Fresize%3D400x0&imgrefurl=https%3A%2F%2Fdribbble.com%2Ftags%2Fbot-logo&docid=UiPWoMTFwa6A6M&tbnid=Uyu8-eyQsJSy1M&vet=12ahUKEwj_9_q47deFAxWo7QIHHbuzMa0QM3oECH0QAA..i&w=400&h=300&hcb=2&ved=2ahUKEwj_9_q47deFAxWo7QIHHbuzMa0QM3oECH0QAA"),
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

class UserChat extends StatelessWidget{
  final String senderMessage;


  const UserChat({super.key, required this.senderMessage});

  @override
  Widget build(BuildContext context){
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
              image: NetworkImage("https://www.google.com/imgres?q=user%20logo&imgurl=https%3A%2F%2Fbanner2.cleanpng.com%2F20180329%2Fzue%2Fkisspng-computer-icons-user-profile-person-5abd85306ff7f7.0592226715223698404586.jpg&imgrefurl=https%3A%2F%2Fwww.cleanpng.com%2Fpng-computer-icons-user-profile-person-730537%2F&docid=K-78BsERAXwWhM&tbnid=04b7qoBnXRH0WM&vet=12ahUKEwiW6P6H7deFAxV83QIHHZwSDukQM3oECHwQAA..i&w=900&h=900&hcb=2&ved=2ahUKEwiW6P6H7deFAxV83QIHHZwSDukQM3oECHwQAA"),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(1.00, 0.00),
              end: Alignment(-1, 0),
              colors: [Color(0xFFFC8A19), Color(0xFFFD7713), Color(0xFFFE600C)],
            ),
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
