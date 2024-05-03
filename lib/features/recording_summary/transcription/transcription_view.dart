import 'package:flutter/material.dart';
import 'package:fyp_application/features/recording_summary/transcription/audio_payer.dart';
import 'package:fyp_application/models/transcription.dart';
import 'package:fyp_application/models/transcription_item.dart';

class TranscriptionView extends StatefulWidget {
  const TranscriptionView({super.key});

  @override
  State<TranscriptionView> createState() => _TranscriptionViewState();
}

class _TranscriptionViewState extends State<TranscriptionView>
    with WidgetsBindingObserver {
  final transcription = TranscriptionClass(
    id: 1,
    audioUrl:
        'https://www.flatworldsolutions.com/transcription/samples/Monologue.mp3',
    audioLength: const Duration(minutes: 2, seconds: 4),
    data: [
      TranscriptionItem(
        id: 0,
        start: const Duration(seconds: 0),
        end: const Duration(seconds: 3),
        text:
            'Well, hello there. So this week, I built a bot that takes voice notes, like the one that I\'m recording right now, turns them to text, and sends that text',
      ),
      TranscriptionItem(
        id: 0,
        start: const Duration(seconds: 4),
        end: const Duration(seconds: 7),
        text:
            'to my notes database in Notion. And by text, I don\'t just mean a transcript. I also get a full summary, a list of the main points in the text,',
      ),
      TranscriptionItem(
        id: 0,
        start: const Duration(seconds: 8),
        end: const Duration(seconds: 24),
        text:
            'and also a list of action items. Today, I\'m gonna show you exactly how to build this workflow for yourself.',
      ),
      TranscriptionItem(
        id: 0,
        start: const Duration(seconds: 25),
        end: const Duration(minutes: 1),
        text:
            'It is surprisingly easy to set up, and once you do have it built, it is completely hands-off and automated, which makes it awesome.',
      ),
      TranscriptionItem(
        id: 0,
        start: const Duration(minutes: 1, seconds: 1),
        end: const Duration(minutes: 1, seconds: 17),
        text:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',
      ),
      TranscriptionItem(
        id: 0,
        start: const Duration(minutes: 1, seconds: 18),
        end: const Duration(minutes: 1, seconds: 53),
        text:
            'when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,',
      ),
      TranscriptionItem(
        id: 0,
        start: const Duration(minutes: 1, seconds: 54),
        end: const Duration(minutes: 2, seconds: 4),
        text:
            'remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: Colors.white,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: transcription.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  // color: sliderlocation > transcription.data[index].start &&
                  //         sliderlocation < transcription.data[index].end
                  //     ? Colors.grey[100]
                  //     : Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        style: const TextStyle(
                          color: Color(0xFF007AFF),
                          fontSize: 14,
                        ),
                        [
                          transcription.data[index].start.inMinutes,
                          transcription.data[index].start.inSeconds
                        ]
                            .map((seg) =>
                                seg.remainder(60).toString().padLeft(2, '0'))
                            .join(':'),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        transcription.data[index].text,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 182,
          color: Colors.white,
          child: CustomAudioPlayer(audioUrl: transcription.audioUrl),
        )
      ],
    );
  }
}
