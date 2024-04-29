import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:record/record.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class RecorderView extends StatefulWidget {
  const RecorderView({super.key});
  static const routeName = '/record_audio';

  @override
  State<RecorderView> createState() => _RecorderViewState();
}

class _RecorderViewState extends State<RecorderView> {
  Duration _recordDuration = Duration.zero;
  bool isRecording = false;
  Timer? _timer;
  late final AudioRecorder _audioRecorder;
  StreamSubscription<RecordState>? _recordSub;
  StreamSubscription<Amplitude>? _amplitudeSub;
  List<Amplitude> samples = [];

  Future toogleRecord() async {
    if (await _audioRecorder.isPaused()) {
      await resume();
    } else if (await _audioRecorder.isRecording()) {
      await pause();
    } else {
      await record();
    }
  }

  void startTimer() {
    _timer = Timer.periodic(
        const Duration(seconds: 1),
        (_) => setState(() {
              _recordDuration =
                  Duration(seconds: _recordDuration.inSeconds + 1);
            }));
  }

  Future<void> record() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        const encoder = AudioEncoder.aacLc;

        if (!await _audioRecorder.isEncoderSupported(encoder)) {
          return;
        }

        var dir = Directory('/storage/emulated/0/Download/').path;
        var name = 'audio_${DateTime.now().millisecondsSinceEpoch}.m4a';
        var path = dir + name;

        const config = RecordConfig(encoder: encoder, numChannels: 1);
        await _audioRecorder.start(config, path: path);

        startTimer();

        _amplitudeSub = _audioRecorder
            .onAmplitudeChanged(const Duration(milliseconds: 800))
            .listen((amp) {
          if (kDebugMode) {
            print(amp.current);
          }
          setState(() {
            samples.add(amp);
          });
        });

        setState(() {
          isRecording = true;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> stop() async {
    final path = await _audioRecorder.stop();
    if (kDebugMode) {
      print(path);
    }
    _timer?.cancel();
    setState(() {
      isRecording = false;
    });
  }

  Future<void> pause() async {
    await _audioRecorder.pause();
    _timer?.cancel();
    setState(() {
      isRecording = false;
    });
  }

  Future<void> cancel() async {
    _audioRecorder.stop();
    _timer?.cancel();
    _recordSub?.cancel();
    _amplitudeSub?.cancel();
    _recordDuration = Duration.zero;
    setState(() {
      isRecording = false;
      samples = [];
    });
  }

  Future<void> resume() async {
    await _audioRecorder.resume();
    startTimer();
    setState(() {
      isRecording = true;
    });
  }

  @override
  void initState() {
    _audioRecorder = AudioRecorder();
    super.initState();
  }

  @override
  dispose() {
    _timer?.cancel();
    _recordSub?.cancel();
    _amplitudeSub?.cancel();
    _audioRecorder.dispose();
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
          'Record Audio',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wave(samples: samples),

            // Text(_amplitude != null ? _amplitude!.current.toString() : 'null'),
            // const SizedBox(height: 32),
            GradientText(
              [
                _recordDuration.inHours,
                _recordDuration.inMinutes,
                _recordDuration.inSeconds
              ]
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
            isRecording
                ? const Text(
                    style: TextStyle(
                      fontSize: 24,
                      color: Color.fromRGBO(142, 141, 157, 1),
                    ),
                    'Recording...',
                  )
                : const SizedBox(),
            const SizedBox(height: 94),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: IconButton.filledTonal(
                    onPressed: () async {
                      await cancel();
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
                      onPressed: () async {
                        await toogleRecord();
                      },
                      iconSize: 48,
                      padding: const EdgeInsets.all(16),
                      color: Colors.white,
                      icon: Icon(
                        isRecording ? Icons.pause : Icons.play_arrow,
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
                      await stop();
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

class Wave extends StatelessWidget {
  const Wave({
    super.key,
    required this.samples,
  });
  final List<Amplitude> samples;

  @override
  Widget build(BuildContext context) {
    double minVolume = -30.0;
    int maxSampleLength = 40;
    int sampleSize = samples.length;

    double updateVolume(ampl) {
      return (ampl.current - minVolume) / minVolume;
    }

    double volume0to(double maxVolumeToDisplay, ampl) {
      return (updateVolume(ampl) * maxVolumeToDisplay).toDouble().abs();
    }

    List<Amplitude> result = samples;
    if (sampleSize > maxSampleLength) {
      result = samples.skip(sampleSize - maxSampleLength).toList();
    }

    return SizedBox(
      height: 130,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
                  colors: [
                    Color.fromRGBO(252, 138, 25, 1),
                    Color.fromRGBO(253, 119, 19, 1),
                    Color.fromRGBO(254, 96, 12, 1),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.0, 0.5, 1.0],
                  tileMode: TileMode.clamp)
              .createShader(bounds);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (var i in result)
              Container(
                margin: const EdgeInsets.only(right: 5),
                width: 3,
                height: i.current.isFinite && !i.current.isNaN
                    ? volume0to(110, i)
                    : 14,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}
