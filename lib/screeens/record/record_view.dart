import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class RecordView extends StatelessWidget {
  const RecordView({super.key});
  static const routeName = '/record_audio';
  @override
  Widget build(BuildContext context) {
    const Duration length = Duration(seconds: 5, minutes: 15);
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
        elevation: 2,
        leadingWidth: 95,
        leading: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          )),
          onPressed: () => Navigator.of(context).pop(),
          child: const Row(
            children: [
              Icon(Icons.arrow_back, color: Color.fromRGBO(0, 122, 255, 1)),
              SizedBox(width: 8),
              Text(
                style: TextStyle(
                  color: Color.fromRGBO(0, 122, 255, 1),
                  fontSize: 17,
                ),
                'Back',
              ),
            ],
          ),
        ),
        centerTitle: true,
        title: const Text(
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          'Record Audio',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/wave.svg'),
            const SizedBox(height: 32),
            GradientText(
              [length.inHours, length.inMinutes, length.inSeconds]
                  .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
                  .join(':'),
              style: const TextStyle(
                fontSize: 42,
              ),
              gradientType: GradientType.linear,
              gradientDirection: GradientDirection.ltr,
              radius: .4,
              colors: const [
                Color.fromRGBO(252, 138, 25, 1),
                Color.fromRGBO(253, 119, 19, 1),
                Color.fromRGBO(254, 96, 12, 1),
              ],
            ),
            const Text(
              style: TextStyle(
                fontSize: 24,
                color: Color.fromRGBO(142, 141, 157, 1),
              ),
              'Recording...',
            ),
            const SizedBox(height: 94),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: IconButton.filledTonal(
                    onPressed: () {},
                    iconSize: 32,
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(252, 138, 25, .4),
                    )),
                    padding: const EdgeInsets.all(12),
                    color: Colors.white,
                    icon: const Icon(
                      Icons.close,
                      color: Color.fromRGBO(254, 96, 12, 1),
                      shadows: <Shadow>[
                        Shadow(
                            color: Color.fromRGBO(0, 0, 0, .10),
                            blurRadius: 4,
                            offset: Offset(0, 4))
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 40),
                Material(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(252, 138, 25, 1),
                          Color.fromRGBO(253, 119, 19, 1),
                          Color.fromRGBO(254, 96, 12, 1),
                        ],
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      iconSize: 48,
                      padding: const EdgeInsets.all(16),
                      color: Colors.white,
                      icon: const Icon(
                        Icons.pause,
                        shadows: <Shadow>[
                          Shadow(
                              color: Color.fromRGBO(0, 0, 0, .25),
                              blurRadius: 4,
                              offset: Offset(0, 4))
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
                Material(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: IconButton.filledTonal(
                    onPressed: () {},
                    iconSize: 32,
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(252, 138, 25, .4),
                    )),
                    padding: const EdgeInsets.all(12),
                    color: Colors.white,
                    icon: const Icon(
                      Icons.done,
                      color: Color.fromRGBO(254, 96, 12, 1),
                      shadows: <Shadow>[
                        Shadow(
                            color: Color.fromRGBO(0, 0, 0, .10),
                            blurRadius: 4,
                            offset: Offset(0, 4))
                      ],
                    ),
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
