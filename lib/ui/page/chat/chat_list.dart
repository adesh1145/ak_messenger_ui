// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ak_messenger/ui/page/chat/chat_page.dart';
import 'package:ak_messenger/ui/page/contact_list/Contact_list_page.dart';
import 'package:ak_messenger/ui/page/profile/update_profile_page.dart';
import 'package:ak_messenger/ui/widget/colors.dart';

import 'package:ak_messenger/ui/widget/text.dart';
import 'package:ak_messenger/ui/widget/textformfield.dart';
import 'package:flutter/material.dart';

class ChatListPageUi extends StatefulWidget {
  const ChatListPageUi({super.key});

  @override
  State<ChatListPageUi> createState() => _ChatListPageUiState();
}

class _ChatListPageUiState extends State<ChatListPageUi> {
  bool searchBarStatus = false;
  var searchTextController = TextEditingController();
 
  
  Widget chatList(context, index) {
    return InkWell(
      onTap: () {},
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(),
              ));
        },
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero)),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: blueColor7,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/client.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: TextWidget(
            text: "Adesh Yadav $index",
            fontweight: FontWeight.w500,
          ),
          subtitle: TextWidget(text: "Hello How are you?"),
          trailing: TextWidget(text: "Yesterday"),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    searchBarStatus == true
                        ? Container()
                        : Expanded(
                            flex: 4,
                            child: TextWidget(
                              text: "Adesh Yadav",
                              fontweight: FontWeight.w900,
                              fontsize:
                                  MediaQuery.of(context).size.width * 0.06,
                            ),
                          ),
                    searchBarStatus == true
                        ? Expanded(
                            flex: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(40)),
                              child: TextFieldWidget(
                                hint: "Search",
                                borderRadius: 40,
                                fontSize: 20,
                                prfixIcon: Icon(Icons.search),
                                focusBorderColor: blackColor,
                                controller: searchTextController,
                                onChanged: (p0) {
                                  setState(() {});
                                },
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      searchTextController.clear();
                                      searchBarStatus = false;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                            ))
                        : Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.all(0))),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    searchBarStatus = true;
                                  });
                                },
                                child: CircleAvatar(
                                  radius:
                                      MediaQuery.of(context).size.width * 0.06,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.search,
                                  ),
                                ),
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
                                builder: (context) => UpdateProfilePageUi()));
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
          Container(
            margin: EdgeInsets.only(top: 70),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.17,
                    width: MediaQuery.of(context).size.width,
                    color: blueColor7,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(0))),
                          child: Column(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.width * 0.2,
                                width: MediaQuery.of(context).size.width * 0.2,
                                margin: EdgeInsets.all(
                                    MediaQuery.of(context).size.width * 0.015),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  gradient: gradientColor2,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: blueColor7,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                              'assets/images/man.jpeg',
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: TextWidget(
                                  text: "Adesh Yadav",
                                  fontsize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  textcolor: blackColor,
                                  textOverflow: TextOverflow.ellipsis,
                                  fontweight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: 20,
                    ),
                  ),
                  Container(
                    color: blueColor7,
                    child: Container(
                      // height: MediaQuery.of(context).size.height * 0.687,
                      height: 75 * 12,
                      width: MediaQuery.of(context).size.width,

                      padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        // color: Colors.white,
                        gradient: gradientColor,
                      ),
                      child: ListView.builder(
                        padding: EdgeInsets.all(2),
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                         if(searchTextController.text==""||searchTextController.text.isEmpty){
                          return chatList(context, index);
                         }
                         else if(index.toString().toLowerCase().contains(searchTextController.text.toLowerCase())){
                          return chatList(context, index);
                         }
                         else{
                          return Container();
                         }
                        },
                        itemCount: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContactListPageUi(),
              ));
        },
        child: Icon(
          Icons.speaker_notes,
        ),
      ),
    );
  }
}
