import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_chat/component/custom_chat/ChatPage.dart';
import 'package:sample_chat/features/home/presentation/provider/user_list_provider.dart';

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
    final userlistprovider = Provider.of<UserListProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
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
          FutureBuilder<void>(
            future: userlistprovider.execute('11', '111'),
            builder: (cx, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snap.hasError) {
                return Text('Error: ${snap.error}');
              } else {
                return ChatPage(userlistmodel: userlistprovider.userListModel);
              }
            },
          ),
          Text("STATUS"),
          Text("Calls"),
        ],
      ),
    );
  }
}
