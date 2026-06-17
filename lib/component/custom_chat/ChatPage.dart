
import 'package:flutter/material.dart';
import '../../features/home/data/model/ChatModel.dart';
import '../custom_card/CustomCard.dart';
class ChatPage extends StatefulWidget {
  List<ChatModel> chatmodels;
  ChatModel sourchat;
  ChatPage({Key? key, required this.chatmodels, required this.sourchat}) : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*Navigator.push(context,
              MaterialPageRoute(builder: (builder) => SelectContact()));*/
        },
        child: Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: widget.chatmodels.length,
        itemBuilder: (contex, index) => CustomCard(
          chatModel: widget.chatmodels[index],
          sourchat: widget.sourchat,
        ),
      ),
    );
  }
}
