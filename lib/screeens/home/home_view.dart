import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp_application/screeens/home/tabpages/notes/note_view.dart';
import 'package:fyp_application/screeens/home/tabpages/pdf/pdf_view.dart';
import 'package:fyp_application/screeens/home/tabpages/recordings/recordings_view.dart';
import 'package:fyp_application/screeens/settings/settings_view.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:fyp_application/screeens/recorder/recorder_view.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const routeName = '/';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Widget _bottomSheetButton = const RecordingBottomButton();

  _handleTabSelection(currentIndex) {
    setState(() {
      switch (currentIndex) {
        case 0:
          setState(() {
            _bottomSheetButton = const RecordingBottomButton();
          });
        case 1:
          setState(() {
            _bottomSheetButton = const PdfBottomButton();
          });
        case 2:
          setState(() {
            _bottomSheetButton = const NoteBottomButton();
          });
          break;
        default:
          setState(() {
            _bottomSheetButton = const RecordingBottomButton();
          });
      }
    });
  }

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
                    Tab(text: 'Meeting Assitance'),
                    Tab(text: 'Chat PDF'),
                    Tab(text: 'My Note'),
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
        bottomSheet: BottomSheet(
          backgroundColor: Colors.white,
          elevation: 0,
          enableDrag: false,
          onClosing: () {},
          builder: (BuildContext context) {
            final TabController tabController =
                DefaultTabController.of(context);
            tabController.addListener(() {
              if (!tabController.indexIsChanging) {
                _handleTabSelection(tabController.index);
              }
            });
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/images/vector1.svg',
                ),
                Container(
                  width: double.infinity,
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
                  child: AnimatedSwitcher(
                      duration: const Duration(seconds: 1),
                      child: _bottomSheetButton),
                ),
              ],
            );
          },
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

class NoteBottomButton extends StatelessWidget {
  const NoteBottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton.filledTonal(
          onPressed: () {},
          iconSize: 45,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.black.withOpacity(.1))),
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          icon: const Icon(
            Icons.add,
            shadows: <Shadow>[
              Shadow(
                  color: Color.fromRGBO(0, 0, 0, .25),
                  blurRadius: 4,
                  offset: Offset(0, 4))
            ],
          ),
        ),
      ],
    );
  }
}

class PdfBottomButton extends StatelessWidget {
  const PdfBottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton.filledTonal(
          onPressed: () {},
          iconSize: 45,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.black.withOpacity(.1))),
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
    );
  }
}

class RecordingBottomButton extends StatelessWidget {
  const RecordingBottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton.filledTonal(
          onPressed: () async {
            var status = await Permission.microphone.request();
            if (!context.mounted) return;
            switch (status) {
              case PermissionStatus.permanentlyDenied:
                var snackBar = SnackBar(
                  content: const Text('microphone permission required!'),
                  action: SnackBarAction(
                    label: 'Open Settings',
                    onPressed: () => openAppSettings(),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                break;
              case PermissionStatus.denied:
                const snackBar = SnackBar(
                    content: Text('microphone permission not granted'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                break;
              case PermissionStatus.granted:
                Navigator.restorablePushNamed(context, RecorderView.routeName);
              default:
            }
          },
          iconSize: 45,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.black.withOpacity(.1))),
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          icon: const Icon(
            Icons.mic,
            shadows: <Shadow>[
              Shadow(
                  color: Color.fromRGBO(0, 0, 0, .25),
                  blurRadius: 4,
                  offset: Offset(0, 4))
            ],
          ),
        ),
        const SizedBox(width: 40),
        IconButton.filledTonal(
          onPressed: () async {
            var picked = await FilePicker.platform.pickFiles();
            if (picked != null) {
              if (kDebugMode) {
                print(picked.files.first.name);
              }
            }
          },
          iconSize: 45,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.black.withOpacity(.1))),
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          icon: const Icon(
            Icons.audio_file,
            shadows: <Shadow>[
              Shadow(
                  color: Color.fromRGBO(0, 0, 0, .25),
                  blurRadius: 4,
                  offset: Offset(0, 4))
            ],
          ),
        ),
      ],
    );
  }
}
