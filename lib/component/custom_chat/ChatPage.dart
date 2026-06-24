import 'package:flutter/material.dart';
import 'package:sample_chat/features/home/data/model/user_list_model.dart';

import '../custom_card/CustomCard.dart';

class ChatPage extends StatefulWidget {
  UserListModel userlistmodel;

  ChatPage({Key? key, required this.userlistmodel}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: (builder) => SelectContact()));
      //   },
      //   child: Icon(Icons.chat, color: Colors.white),
      // ),
      body: ListView.builder(
        itemCount: widget.userlistmodel.message?.length ?? 0,
        itemBuilder: (contex, index) =>
            CustomCard(userListModel: widget.userlistmodel, index: index),
      ),
    );
  }
}
