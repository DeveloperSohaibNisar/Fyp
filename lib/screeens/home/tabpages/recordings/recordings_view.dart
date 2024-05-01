import 'package:flutter/material.dart';
import 'package:fyp_application/screeens/home/tabpages/recordings/recodrding_list.dart';
import 'package:fyp_application/screeens/home/tabpages/recordings/recording_filter.dart';

class RecordingView extends StatelessWidget {
  const RecordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [RecordingFilterContainer(), Flexible(child: RecordingList())],
    );
  }
}
