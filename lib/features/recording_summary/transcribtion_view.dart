import 'package:flutter/material.dart';
import 'package:fyp_application/core/constants/transcribtion_const.dart';


class Transcribtion extends StatelessWidget{
  const Transcribtion({super.key});

  @override
  Widget build(BuildContext context) {

    return Wrap(

      children: [
        Transcribe(),
      ],
    );
  }

}