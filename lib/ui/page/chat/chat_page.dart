// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../widget/colors.dart';
import '../../widget/date_time.dart';
import '../../widget/text.dart';
import '../profile/profile_page.dart';
import 'chat_data.dart';
import 'chat_message_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final messageController = TextEditingController();
  final _listViewController = ScrollController();
  String? message;
  void _scrollToBottom() {
    _listViewController.animateTo(_listViewController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 70,
              width: MediaQuery.of(context).size.width,
              color: blueColor7,
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(0))),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.06,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: TextWidget(
                          text: "Adesh Yadav",
                          textcolor: Colors.white,
                          fontweight: FontWeight.w500,
                          fontsize: MediaQuery.of(context).size.width * 0.06,
                        ),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(0))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfilePageUi(),
                            ));
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/client.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 0,
            child: Container(
              color: blueColor7,
              child: Container(
                height: MediaQuery.of(context).size.height -
                    100 -
                    MediaQuery.of(context).viewInsets.bottom,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                  top: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  gradient: gradientColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height -
                          100 -
                          15 -
                          55 -
                          10 -
                          MediaQuery.of(context).viewInsets.bottom -
                          59,
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: ListView.builder(
                        controller: _listViewController,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(
                              top: 10,
                            ),
                            child: Align(
                              alignment:
                                  (messageList[index].messageType == "receiver"
                                      ? Alignment.topLeft
                                      : Alignment.topRight),
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: 240,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      messageList[index].messageType ==
                                              "receiver"
                                          ? BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            )
                                          : BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              bottomLeft: Radius.circular(20),
                                              topLeft: Radius.circular(20),
                                            ),
                                  color: (messageList[index].messageType ==
                                          "receiver"
                                      ? Colors.grey.shade200
                                      : Colors.blue[200]),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 1, color: Colors.black26),
                                  ],
                                ),
                                padding: EdgeInsets.only(
                                    top: 11, bottom: 10, left: 12, right: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      messageList[index]
                                          .messageContent
                                          .toString(),
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    TextWidget(
                                      text: "${messageList[index].dateTime}",
                                      fontsize: 12,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: messageList.length,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      // color: blackColor,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                cursorHeight: 30,
                                textInputAction: TextInputAction.newline,
                                maxLines: 4,
                                minLines: 1,
                                controller: messageController,
                                style: TextStyle(fontSize: 19),
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.photo_camera,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      top: 10, bottom: 10, left: 20, right: 10),
                                  hintText: "Type Message...",
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: BorderSide(width: 0)),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(width: 0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(width: 0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 8, right: 8),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: blueColor7,
                              child: IconButton(
                                icon: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  message = messageController.text;
                                  messageController.clear();
                                  if (message != "") {
                                    setState(() {
                                      String nowDateTime = dateTimeFinder();
                                      String sender = "sender";

                                      messageList.add(ChatMessage(
                                          messageContent: message,
                                          messageType: sender,
                                          dateTime: nowDateTime));
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
