import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyp_application/screeens/home/tabpages/pdf/pdf_filter.dart';
import 'package:fyp_application/screeens/home/tabpages/pdf/pdf_list.dart';

class PdfView extends StatelessWidget {
  const PdfView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: BottomSheet(
        backgroundColor: Colors.white,
        elevation: 0,
        enableDrag: false,
        onClosing: () {},
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/images/vector1.svg'),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(252, 138, 25, 1),
                      Color.fromRGBO(253, 119, 19, 1),
                      Color.fromRGBO(254, 96, 12, 1),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton.filledTonal(
                      onPressed: () {},
                      iconSize: 45,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.black.withOpacity(.1))),
                      padding: const EdgeInsets.all(15),
                      color: Colors.white,
                      icon: const Icon(
                        Icons.upload_file,
                        shadows: <Shadow>[
                          Shadow(
                              color: Color.fromRGBO(0, 0, 0, .25),
                              blurRadius: 4,
                              offset: Offset(0, 4))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      body: const Column(
        children: [PdfFilterContainer(), Flexible(child: PdfList())],
      ),
    );
  }
}
