import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/25x25"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          //width: 393,
          height: 16,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xFFF6F9FC)),
        ),

        Container(
          width: double.infinity,
          height: 461,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://via.placeholder.com/24x24"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: ShapeDecoration(
                        color: Color(0xFFF6F9FC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'How can i help you?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'Inria Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://via.placeholder.com/24x24"),
                          fit: BoxFit.fill,
                        ),
                        shape: OvalBorder(),
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
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'What was the name of the father of alexender?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: 'Inria Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://via.placeholder.com/24x24"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: ShapeDecoration(
                        color: Color(0xFFF6F9FC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 280,
                            child: Text(
                              'The name of Alexander the Great\'s father was Philip II of Macedon. He was a powerful king who unified Greece and laid the groundwork for Alexander\'s future conquests.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontFamily: 'Inria Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://via.placeholder.com/24x24"),
                          fit: BoxFit.fill,
                        ),
                        shape: OvalBorder(),
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
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 280,
                            child: Text(
                              'How successful was Alexander\'s policy of cultural fusion in unifying his diverse empire?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Inria Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                //height: 171,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://via.placeholder.com/24x24"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: ShapeDecoration(
                        color: Color(0xFFF6F9FC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 280,
                            child: Text(
                              'The success of Alexander the Great\'s policy of cultural fusion in unifying his vast and diverse empire is a complex and debated topic among historians. There is no easy answer, as the policy had both positive and negative consequences ...',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontFamily: 'Inria Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
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

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          //clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    height:40,
                    width: 260,
                    color: Color(0xFFF6F9FC),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10.0),
                    child: Text('Enter a prompt here',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Inria Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),),
                  ),
                ],
              ),
              Container(
                height:40,
                width: 40,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("data:image/png;base64,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"),
                    fit: BoxFit.fill,
                  ),
                  shape: OvalBorder(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}