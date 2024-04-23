import 'package:flutter/material.dart';
import 'package:fyp_application/screeens/home/tabpages/notes/note_view.dart';
import 'package:fyp_application/screeens/home/tabpages/pdf/pdf_view.dart';
import 'package:fyp_application/screeens/home/tabpages/recordings/recordings_view.dart';
import 'package:fyp_application/screeens/settings/settings_view.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 50,
          leading: const Padding(
            padding: EdgeInsets.only(left: 24, top: 10),
            child: CircleAvatar(
              foregroundImage: AssetImage('assets/images/profile_picture.png'),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: GradientText(
              'Info-Verse',
              style: const TextStyle(
                fontSize: 18,
              ),
              gradientType: GradientType.linear,
              gradientDirection: GradientDirection.ttb,
              radius: .4,
              colors: const [
                Color.fromRGBO(31, 51, 228, 1),
                Color.fromRGBO(6, 121, 225, 1),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(108),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromRGBO(222, 229, 238, 1)),
                    borderRadius: BorderRadius.circular(30)),
                child: TabBar(
                  dividerHeight: 0,
                  indicator: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(252, 138, 25, 1),
                        Color.fromRGBO(253, 119, 19, 1),
                        Color.fromRGBO(254, 96, 12, 1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelStyle: const TextStyle(fontSize: 13),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  splashBorderRadius: BorderRadius.circular(30),
                  padding: const EdgeInsets.all(8),
                  tabs: const [
                    Tab(
                      text: 'Meeting Assitance',
                    ),
                    Tab(
                      text: 'Chat PDF',
                    ),
                    Tab(
                      text: 'My Note',
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24, top: 10),
              child: IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  // Navigate to the settings page. If the user leaves and returns
                  // to the app after it has been killed while running in the
                  // background, the navigation stack is restored.
                  Navigator.restorablePushNamed(
                      context, SettingsView.routeName);
                },
              ),
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            RecordingView(),
            PdfView(),
            NoteView(),
          ],
        ),
      ),
    );
  }
}
