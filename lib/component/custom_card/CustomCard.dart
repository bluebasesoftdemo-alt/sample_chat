import 'package:flutter/material.dart';

import '../../features/home/data/model/user_list_model.dart';
import '../../features/single_chat/presentation/screen/SingleChatScreen.dart';

class CustomCard extends StatelessWidget {
  CustomCard({Key? key, required this.userListModel, required this.index})
    : super(key: key);
  final UserListModel userListModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (contex) => SingleChatScreen()),
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              //false ? "assets/com/groups.svg" : "assets/com/person.svg",
              child: Image.network(
                'http://10.0.2.2/realtime_chat/${userListModel.message?[index]?.userprofile!}',
                height: 35,
                width: 35,
              ),
              backgroundColor: Colors.blueGrey,
            ),
            title: Text(
              '${userListModel.message?[index]?.username!}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all, color: Colors.cyan, size: 18),
                SizedBox(width: 3),
                Text('Hi, Welcome', style: TextStyle(fontSize: 13)),
              ],
            ),
            trailing: Text('4.20'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 80),
            child: Divider(thickness: 1),
          ),
        ],
      ),
    );
  }
}
