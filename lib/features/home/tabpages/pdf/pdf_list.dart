import 'package:flutter/material.dart';
import 'package:fyp_application/features/pdf_summary/pdf_summary_tabs_view.dart';
import 'package:fyp_application/state/app_state.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class PdfList extends StatelessWidget {
  const PdfList({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var pdfData = appState.pdfData;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.separated(
        itemCount: pdfData.length,
        itemBuilder: (context, index) {
          return ListTile(
            dense: true,
            leading: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4,
                      color: Colors.black.withOpacity(.25),
                      offset: const Offset(0, 4))
                ],
              ),
              child: const CircleAvatar(
                backgroundColor: Color.fromRGBO(217, 217, 217, 1),
                child: Icon(
                  Icons.description_outlined,
                  weight: 100,
                  grade: -25,
                  color: Colors.black,
                ),
              ),
            ),
            title: Text(pdfData[index].title),
            titleTextStyle: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
            subtitleTextStyle: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(.51)),
            subtitle:
                Text(DateFormat('dd-MMM-yyyy').format(pdfData[index].date)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${pdfData[index].pages}-Pages'),
                const Icon(Icons.more_vert),
              ],
            ),
            onTap: () {
              Navigator.restorablePushNamed(context, PdfTabsView.routeName);
            },
          );
        },
        separatorBuilder: ((context, index) => const Divider()),
      ),
    );
  }
}
