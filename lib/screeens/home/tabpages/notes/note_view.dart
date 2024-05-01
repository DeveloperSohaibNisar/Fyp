import 'package:flutter/material.dart';
import 'package:fyp_application/screeens/home/tabpages/notes/note_list.dart';
import 'package:fyp_application/screeens/home/tabpages/notes/note_filter.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [NoteFilterContainer(), Flexible(child: NoteList())],
    );
  }
}
