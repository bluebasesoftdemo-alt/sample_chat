
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../../../component/custom_card/OwnMessgaeCrad.dart';
import '../../../../component/custom_card/ReplyCard.dart';
import '../../../../core/utils/local_data_store.dart';
import '../../../../core/utils/logger.dart';
import '../provider/user_chat_list_provider.dart';

class SingleChatScreen extends StatefulWidget {
  String? kUserName;
  String? kUserprofile;
  int? kUserid;
  String? kUserLoginStatus;
  String? kUserTimestamp;
  SingleChatScreen({Key? key,required this.kUserName, required this.kUserid, required this.kUserprofile, required this.kUserLoginStatus, required this.kUserTimestamp}) : super(key: key);
  @override
  _SingleChatScreenState createState() => _SingleChatScreenState(kUserName,kUserid,kUserprofile,kUserLoginStatus,kUserTimestamp);
}
class _SingleChatScreenState extends State<SingleChatScreen> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  bool sendButton = false;
  TextEditingController _controller = TextEditingController();
  ScrollController _scrollController = ScrollController();
  IO.Socket? socket;
  String? kUserName;
  String? kUserprofile;
  int? kUserid;
  String? kUserLoginStatus;
  String? kUserTimestamp;
  _SingleChatScreenState(this.kUserName, this.kUserid, this.kUserprofile, this.kUserLoginStatus, this.kUserTimestamp);
  @override
  void initState() {
    super.initState();
     connect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
    connect();
  }
  void connect() {
    // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );
    socket = IO.io("http://10.0.2.2:8080", <String, dynamic>{"transports": ["websocket"], "autoConnect": false,});
    socket!.connect();
    socket!.emit("signin", '');
    socket!.onConnect((data) {
      Log.i("..................Web Socket Connected..............................");
      socket!.on("message", (msg) {
        Log.i('Web Socket Message : $msg');
         setMessage("destination", msg["message"]);
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    });
    Log.i('Web Socket Connected Status: ${socket!.connected}');
  }
  void sendMessage(String message, int sourceId, int targetId) {
    //setMessage("source", message);
    socket!.emit("message", {
      "message": message,
      "sourceId": sourceId,
      "targetId": targetId,
    });
  }
  void setMessage(String type, String message) {
    /*MessageModel messageModel = MessageModel(
      type: type,
      message: message,
      time: DateTime.now().toString().substring(10, 16),
    );*/
    //Log.i('Message : $message');
    setState(() {
     // messages.add(messageModel);
    });
  }
  @override
  Widget build(BuildContext context) {
    final userchatlistprovider = Provider.of<UserChatListProvider>(context, listen: false,);
    return Stack(
      children: [
        Image.asset("assets/chat/whatsapp_Back.png", height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width, fit: BoxFit.cover,),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: AppBar(leadingWidth: 70, titleSpacing: 0,
                leading: InkWell(onTap: () {Navigator.pop(context);},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back, size: 24),
                      CircleAvatar(radius: 20, backgroundColor: Colors.blueGrey, child: SvgPicture.asset(false ? "assets/com/groups.svg" : "assets/com/person.svg",
                        color: Colors.white, height: 36, width: 36,
                      ),
                      ),
                    ],
                  ),
                ),
                title: InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.all(6),
                    child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(kUserName!, style: TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold,),),
                        Text("last seen today at 12:05", style: TextStyle(fontSize: 13),),
                      ],
                    ),
                  ),
                ),
                actions: [
                  IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
                  IconButton(icon: Icon(Icons.call), onPressed: () {}),
                ],
              )
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: PopScope(
                child: Column(
                  children: [
                    Expanded(
                        child: FutureBuilder<void>(
                          future: userchatlistprovider.execute(HiveService.instance.getUserId(), kUserid!),
                          builder: (cx, snap) {
                            if (snap.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snap.hasError) {
                              return Text('Error: ${snap.error}');
                            } else {
                              return ListView.builder(
                                reverse: true,
                                shrinkWrap: true,
                                //controller: _scrollController,
                                itemCount: userchatlistprovider.userchatListModel.userchat?.length,
                                itemBuilder: (context, index) {
                                  if (index == userchatlistprovider.userchatListModel.userchat?.length) {
                                    return Container(height: 70);
                                  }
                                  if (userchatlistprovider.userchatListModel.userchat?[index]?.fromuserid == 11) {
                                    //messages[index].type == "source"
                                    return OwnMessageCard(message: userchatlistprovider.userchatListModel.userchat?[index]!.privatechatmessage!, time: '',);
                                  } else {
                                    return ReplyCard(message: userchatlistprovider.userchatListModel.userchat?[index]!.privatechatmessage!, time: '',);
                                  }
                                },
                              );
                            }
                          },
                        ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(bottom: 5),
                                  width: MediaQuery.of(context).size.width - 60,
                                  child: Card(
                                    margin: EdgeInsets.only(left: 10, right: 2, bottom: 8,),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),),
                                    child: TextFormField(
                                      controller: _controller,
                                      focusNode: focusNode,
                                      textAlignVertical: TextAlignVertical.center,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 5,
                                      minLines: 1,
                                      onChanged: (value) {
                                        if (value.length > 0) {
                                          setState(() {sendButton = true;});
                                        }
                                        else {
                                          setState(() {sendButton = false;});
                                        }
                                      },
                                      decoration: InputDecoration(border: InputBorder.none, hintText: "Type a message", hintStyle: TextStyle(color: Colors.grey),
                                        prefixIcon: IconButton(
                                          icon: Icon(show ? Icons.keyboard : Icons.emoji_emotions_outlined,),
                                          onPressed: () {
                                            if (!show) {
                                              focusNode.unfocus();
                                              focusNode.canRequestFocus = false;
                                            }
                                            setState(() {
                                              show = !show;
                                            });
                                          },
                                        ),
                                        suffixIcon:
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(icon: Icon(Icons.attach_file),
                                              onPressed: () {
                                                // showModalBottomSheet(backgroundColor: Colors.transparent, context: context, builder: (builder) => bottomSheet());
                                              },
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.camera_alt), onPressed: () {},
                                            ),
                                          ],
                                        ),
                                        contentPadding: EdgeInsets.all(5),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8, right: 2, left: 2,),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Color(0xFF128C7E),
                                    child: IconButton(
                                      icon: Icon(sendButton ? Icons.send : Icons.mic, color: Colors.white,),
                                      onPressed: (){
                                         if (sendButton) {
                                           _scrollController.animateTo(_scrollController.position.maxScrollExtent,
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.easeOut,
                                        );
                                        sendMessage(_controller.text, 2, 1);
                                        _controller.clear();
                                        setState(() { sendButton = false; });
                                        }
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height:5)
                          ],
                        ),
                      ),
                    )
                  ],
                )
            ),
          ),
        )
      ],
    );
  }
}