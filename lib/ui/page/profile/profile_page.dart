// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ak_messenger/ui/widget/colors.dart';
import 'package:ak_messenger/ui/widget/text.dart';
import 'package:flutter/material.dart';

class ProfilePageUi extends StatelessWidget {
  const ProfilePageUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0,
          left: 0,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Container(
              color: blueColor7,
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 15),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
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
                    Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/client.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_vert_outlined,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.33,
          left: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.67,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                gradient: gradientColor),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        TextWidget(
                          text: "+91 7007765672",
                          fontsize: 25,
                          textcolor: Colors.black,
                        ),
                        TextWidget(
                          text: "adeshyadav1145@gmail.com",
                          fontsize: 20,
                          textcolor: Colors.black54,
                        ),
                        TextWidget(
                          text: "~ Adesh Yadav",
                          fontsize: 20,
                          textcolor: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Container(
                    color: Colors.white38,
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.center,
                    child: TextWidget(
                      text: "Every thing is possible with money.",
                      fontsize: 15,
                      textcolor: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.white38,
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.block_outlined,
                                  color: Colors.red,
                                  size: 25,
                                ),
                                TextWidget(
                                    text: "Block Adesh Yadav",
                                    textcolor: Colors.red,
                                    fontsize: 20,
                                    fontweight: FontWeight.w400),
                                TextWidget(text: "              ")
                              ],
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.thumb_down_alt_rounded,
                                  color: Colors.red,
                                  size: 25,
                                ),
                                TextWidget(
                                  text: "Report Adesh Yadav",
                                  textcolor: Colors.red,
                                  fontsize: 20,
                                  fontweight: FontWeight.w400,
                                ),
                                TextWidget(text: "              ")
                              ],
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
