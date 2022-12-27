import 'package:flutter/material.dart';

import '../../../../widgets/doctoro_appbar/doctoro_appbar.dart';

class Chat extends StatefulWidget {
  final String? chatRoomId;

  Chat({this.chatRoomId});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  // Stream<QuerySnapshot> chats;
  TextEditingController messageEditingController = new TextEditingController();

  // Stream chatRooms;

  Widget chatMessages() {
    return StreamBuilder(
      // stream: chats,
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return MessageTile(
              message: "salam",
              sendByMe: true,
              time: 2021,
            );
          },
        );
      },
    );
  }

  addMessage() {
    if (messageEditingController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "sendBy": "Constants.myName",
        "message": messageEditingController.text,
        'time': DateTime.now().millisecondsSinceEpoch,
      };

      setState(() {
        messageEditingController.text = "Salam";
      });
    }
  }

  @override
  void initState() {
    // DatabaseService().getChats(widget.chatRoomId).then((val) {
    //   setState(() {
    //     chats = val;
    //   });
    // });
    super.initState();
  }

  // Future<DocumentSnapshot> getUserInfo() async {
  //   var firebaseUser = await FirebaseAuth.instance.currentUser;
  //   return await FirebaseFirestore.instance.collection("SerX")
  //       .doc(firebaseUser.uid)
  //       .get();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorAppbar(
        title: 'Message',
        user: false,
        contextA: context,
        notification: true,
      ),
      body: Container(
        child: Stack(
          children: [
            Container(child: chatMessages(), height: 595),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 3),
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: messageEditingController,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                        ),
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 7, horizontal: 15),
                          filled: true,
                          fillColor: Colors.black,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 3)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(99),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 3,
                              )),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        addMessage();
                      },
                      child: Icon(
                        Icons.send,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String message;
  final bool sendByMe;
  final int time;

  MessageTile(
      {required this.message, required this.sendByMe, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 3, bottom: 3, left: sendByMe ? 0 : 24, right: sendByMe ? 24 : 0),
      alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin:
            sendByMe ? EdgeInsets.only(left: 30) : EdgeInsets.only(right: 30),
        padding: EdgeInsets.only(top: 17, bottom: 17, left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: sendByMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(9),
                    topRight: Radius.circular(9),
                    bottomLeft: Radius.circular(9),
                  )
                : BorderRadius.only(
                    topLeft: Radius.circular(9),
                    topRight: Radius.circular(9),
                    bottomRight: Radius.circular(9)),
            color: sendByMe ? Colors.blue : Colors.white),
        child: Text(
          message,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Orbitron',
            fontSize: 9.0,
          ),
        ),
      ),
    );
  }
}
