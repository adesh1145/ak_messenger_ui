// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:ak_messenger/ui/page/login_page/login.dart';
import 'package:ak_messenger/ui/widget/colors.dart';
import 'package:ak_messenger/ui/widget/svgpicture.dart';
import 'package:ak_messenger/ui/widget/text.dart';
import 'package:flutter/material.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => LogInWithEmailPageUi()))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPictureWidget(
              path: "assets/icon/chat.svg",
              height: 175,
              color: blueColor7,
            ),
            Container(
              height: 20,
            ),
            TextWidget(
              text: "AK Messenger",
              fontsize: 30,
            )
          ],
        ),
      ),
    );
  }
}
