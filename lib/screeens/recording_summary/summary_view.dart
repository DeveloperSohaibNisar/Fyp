import 'package:flutter/material.dart';
import 'package:fyp_application/utilities/summary_constant.dart';

class Summary extends StatelessWidget{
  const Summary({super.key});


  @override
  Widget build(BuildContext context){

    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/25x25"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
        Container(
          //width: 393,
          height: 16,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xFFF6F9FC)),
        ),
        Container(

          child:const Summarytext(summarytext: "Alexander the Great, born in 356 BCE, was a renowned ancient Macedonian king and military conqueror. Tutored by Aristotle, he ascended to the throne at the age of 20 after the assassination of his father, King Philip II. Known for his military genius, Alexander embarked on an ambitious campaign of conquest that lasted from 334 to 323 BCE, creating one of the largest empires in history.\nHis conquests extended from Greece to Egypt, Persia, and into the Indian subcontinent. Notable victories include the Battle of Issus and the Battle of Gaugamela. His military strategies and tactics, along with the loyalty of his troops known as the Macedonian phalanx, contributed to his success.\nAlexander's empire, however, faced challenges due to the vastness of its territories and the diverse cultures within. He adopted a policy of cultural fusion, encouraging the blending of Greek and local customs. Despite his achievements, Alexander's reign was short-lived."),
        ),
      ],
    );
  }
}