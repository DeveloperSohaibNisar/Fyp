import 'dart:async';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'dart:ui' as ui;
// class RecorderView extends StatefulWidget {
//   const RecorderView({super.key});
//   static const routeName = '/record_audio';

//   @override
//   State<RecorderView> createState() => _RecorderViewState();
// }

// class _RecorderViewState extends State<RecorderView> {
//   FlutterSoundRecorder? recorder;
//   bool isRecorderReady = false;
//   Timer? timer;
//   Duration length = Duration.zero;

//   Future toogleRecord() async {
//     if (!isRecorderReady) return;
//     if (recorder!.isStopped) {
//       await record();
//     } else if (recorder!.isPaused) {
//       await resume();
//     } else {
//       await pause();
//     }
//   }

//   void startTimer() {
//     timer = Timer.periodic(
//         const Duration(seconds: 1),
//         (_) => setState(() {
//               length = Duration(seconds: length.inSeconds + 1);
//             }));
//   }

//   Future record() async {
//     if (!isRecorderReady) return;
//     await recorder!.startRecorder(toFile: 'temp_recording');
//     startTimer();
//   }

//   Future stop() async {
//     if (!isRecorderReady) return;
//     await recorder!.stopRecorder();
//     timer?.cancel();
//   }

//   Future pause() async {
//     if (!isRecorderReady) return;
//     await recorder!.pauseRecorder();
//     timer?.cancel();
//   }

//   Future cancel() async {
//     if (!isRecorderReady) return;
//     await recorder!.closeRecorder();
//     isRecorderReady = false;
//     timer?.cancel();
//     length = Duration.zero;
//     initRecorder();
//   }

//   Future resume() async {
//     if (!isRecorderReady) return;
//     await recorder!.resumeRecorder();
//     startTimer();
//   }

//   @override
//   void initState() {
//     super.initState();
//     initRecorder();
//   }

//   @override
//   void dispose() {
//     recorder!.closeRecorder();
//     recorder = null;
//     isRecorderReady = false;
//     super.dispose();
//   }

//   Future initRecorder() async {
//     recorder = FlutterSoundRecorder();
//     await recorder!.openRecorder();
//     recorder!.setSubscriptionDuration(const Duration(milliseconds: 1000));
//     isRecorderReady = true;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         systemOverlayStyle:
//             const SystemUiOverlayStyle(statusBarColor: Colors.white),
//         elevation: 2,
//         leadingWidth: 95,
//         leading: TextButton(
//           style: ButtonStyle(
//               shape: MaterialStateProperty.all(
//             RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(0),
//             ),
//           )),
//           onPressed: () => Navigator.of(context).pop(),
//           child: const Row(
//             children: [
//               Icon(Icons.arrow_back, color: Color.fromRGBO(0, 122, 255, 1)),
//               SizedBox(width: 8),
//               Text(
//                 style: TextStyle(
//                   color: Color.fromRGBO(0, 122, 255, 1),
//                   fontSize: 17,
//                 ),
//                 'Back',
//               ),
//             ],
//           ),
//         ),
//         centerTitle: true,
//         title: const Text(
//           style: TextStyle(
//             fontSize: 17,
//             fontWeight: FontWeight.bold,
//           ),
//           'Record Audio',
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SvgPicture.asset('assets/images/wave.svg'),
//             const SizedBox(height: 32),
//             GradientText(
//               [length.inHours, length.inMinutes, length.inSeconds]
//                   .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
//                   .join(':'),
//               style: const TextStyle(
//                 fontSize: 42,
//               ),
//               gradientType: GradientType.linear,
//               gradientDirection: GradientDirection.ltr,
//               radius: .4,
//               colors: const [
//                 Color.fromRGBO(252, 138, 25, 1),
//                 Color.fromRGBO(253, 119, 19, 1),
//                 Color.fromRGBO(254, 96, 12, 1),
//               ],
//             ),
//             const Text(
//               style: TextStyle(
//                 fontSize: 24,
//                 color: Color.fromRGBO(142, 141, 157, 1),
//               ),
//               'Recording...',
//             ),
//             const SizedBox(height: 94),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Material(
//                   elevation: 6,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(50)),
//                   child: IconButton.filledTonal(
//                     onPressed: () async {
//                       await cancel();
//                       setState(() {});
//                     },
//                     iconSize: 32,
//                     style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all(
//                       const Color.fromRGBO(252, 138, 25, .4),
//                     )),
//                     padding: const EdgeInsets.all(12),
//                     color: Colors.white,
//                     icon: const Icon(
//                       Icons.close,
//                       color: Color.fromRGBO(254, 96, 12, 1),
//                       shadows: <Shadow>[
//                         Shadow(
//                             color: Color.fromRGBO(0, 0, 0, .10),
//                             blurRadius: 4,
//                             offset: Offset(0, 4))
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 40),
//                 Material(
//                   elevation: 6,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(50)),
//                   child: DecoratedBox(
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       gradient: LinearGradient(
//                         colors: [
//                           Color.fromRGBO(252, 138, 25, 1),
//                           Color.fromRGBO(253, 119, 19, 1),
//                           Color.fromRGBO(254, 96, 12, 1),
//                         ],
//                       ),
//                     ),
//                     child: IconButton(
//                       onPressed: () async {
//                         await toogleRecord();
//                         setState(() {});
//                       },
//                       iconSize: 48,
//                       padding: const EdgeInsets.all(16),
//                       color: Colors.white,
//                       icon: Icon(
//                         recorder!.isRecording ? Icons.pause : Icons.play_arrow,
//                         shadows: const <Shadow>[
//                           Shadow(
//                               color: Color.fromRGBO(0, 0, 0, .25),
//                               blurRadius: 4,
//                               offset: Offset(0, 4))
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 40),
//                 Material(
//                   elevation: 6,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(50)),
//                   child: IconButton.filledTonal(
//                     onPressed: () async {
//                       await stop();
//                       setState(() {});
//                     },
//                     iconSize: 32,
//                     style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all(
//                       const Color.fromRGBO(252, 138, 25, .4),
//                     )),
//                     padding: const EdgeInsets.all(12),
//                     color: Colors.white,
//                     icon: const Icon(
//                       Icons.done,
//                       color: Color.fromRGBO(254, 96, 12, 1),
//                       shadows: <Shadow>[
//                         Shadow(
//                             color: Color.fromRGBO(0, 0, 0, .10),
//                             blurRadius: 4,
//                             offset: Offset(0, 4))
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class RecorderView2 extends StatefulWidget {
  const RecorderView2({super.key});
  static const routeName = '/record_audio2';

  @override
  State<RecorderView2> createState() => _RecorderView2State();
}

class _RecorderView2State extends State<RecorderView2> {
  RecorderController controller = RecorderController();
  Timer? timer;
  Duration length = Duration.zero;

  bool recording = false;

  void startTimer() {
    timer = Timer.periodic(
        const Duration(seconds: 1),
        (_) => setState(() {
              length = Duration(seconds: length.inSeconds + 1);
            }));
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          'Record Audio 2',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SvgPicture.asset('assets/images/wave.svg'),
            AudioWaveforms(
              enableGesture: true,
              size: Size(MediaQuery.of(context).size.width / 2, 50),
              recorderController: controller,
              waveStyle: const WaveStyle(
                waveColor: Colors.white,
                extendWaveform: true,
                showMiddleLine: false,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: const Color(0xFF1E1B26),
              ),
              padding: const EdgeInsets.only(left: 18),
              margin: const EdgeInsets.symmetric(horizontal: 15),
            ),
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
                    onPressed: () {
                      controller.stop();
                      timer!.cancel();
                      length = Duration.zero;
                      setState(() {
                        recording = false;
                      });
                    },
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
                      onPressed: () {
                        if (recording) {
                          controller.pause();
                          timer!.cancel();
                          setState(() {
                            recording = false;
                          });
                        } else {
                          controller.record();
                          startTimer();
                          setState(() {
                            recording = true;
                          });
                        }
                      },
                      iconSize: 48,
                      padding: const EdgeInsets.all(16),
                      color: Colors.white,
                      icon: Icon(
                        recording ? Icons.pause : Icons.play_arrow,
                        shadows: const <Shadow>[
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
                    onPressed: () async {
                      controller.stop(false);
                      timer!.cancel();
                      setState(() {
                        recording = false;
                      });
                    },
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
