import 'package:flutter/material.dart';

import '../../component/custom_chat/ChatPage.dart';
import '../../core/constant/stirng.dart';
import 'data/model/ChatModel.dart';

class HomeScreen extends StatefulWidget {
  String? email;

  HomeScreen({super.key, required this.email});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _controller;

  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Container(child: Row(children: [Text('Profile ')])),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: [
            Tab(text: "CHATS"),
            Tab(text: "STATUS"),
            Tab(text: "CALLS"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          ChatPage(chatmodels: chatmodels, sourchat: ChatModel()),
          Text("STATUS"),
          Text("Calls"),
        ],
      ),
    );
  }
}
