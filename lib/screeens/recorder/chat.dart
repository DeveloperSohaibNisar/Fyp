import 'package:flutter/material.dart';
import 'package:fyp_application/screeens/recorder/chatpage.dart';


class Chat1 extends StatelessWidget{
  const Chat1({super.key});
  static const routeName = '/Chat1';


  @override
  Widget build(BuildContext context){
    return DefaultTabController(
        length: 3,
        child: Scaffold(
        appBar: AppBar(

        centerTitle: true,
        bottom: PreferredSize(
        preferredSize: const Size.fromHeight(52),
    child: ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    child: Container(
    //width: 361,
    height: 52,
    padding: const EdgeInsets.all(8),
    clipBehavior: Clip.antiAlias,
    decoration: ShapeDecoration(
    color: Colors.white,
    shape: RoundedRectangleBorder(
    side: BorderSide(width: 1, color: Color(0xFFDEE5EE)),
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
    colors: [Color(0xFFFC8A19), Color(0xFFFD7713), Color(0xFFFE600C)],
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
    ),
    ),
    body: TabBarView(
    children: [
    Center(child: Text('Inbox Page')),
    Center(child: Text('Archived Page')),
    Center(child: ChatPage()),
    ],
    ),
    )
    );
  }
}