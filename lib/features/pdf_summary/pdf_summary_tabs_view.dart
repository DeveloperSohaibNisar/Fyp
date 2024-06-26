import 'package:flutter/material.dart';
import 'package:fyp_application/features/pdf_summary/chat_view.dart';
import 'package:fyp_application/features/pdf_summary/summary_view.dart';
import 'package:fyp_application/features/pdf_summary/transcribtion_view.dart';

class PdfTabsView extends StatelessWidget {
  const PdfTabsView({super.key});
  static const routeName = '/PdfTabView';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PDF'),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    //width: 361,
                    height: 52,
                    padding: const EdgeInsets.all(3),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFDEE5EE)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(1.00, 0.00),
                          end: Alignment(-1, 0),
                          colors: [
                            Color(0xFFFC8A19),
                            Color(0xFFFD7713),
                            Color(0xFFFE600C)
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Text('Summary'),
                        Text('Transcription'),
                        Text('Chat'),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              NetworkImage("https://via.placeholder.com/25x25"),
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
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Summary(),
            ),
            Transcribtion(),
            ChatView(),
          ],
        ),
      ),
    );
  }
}
