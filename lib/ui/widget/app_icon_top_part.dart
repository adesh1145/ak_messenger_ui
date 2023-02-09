import 'package:ak_messenger/ui/widget/colors.dart';
import 'package:ak_messenger/ui/widget/svgpicture.dart';
import 'package:ak_messenger/ui/widget/text.dart';
import 'package:flutter/material.dart';

class TopPartOfScreen extends StatelessWidget {
  const TopPartOfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return      Positioned(
            top: 0,
            left: 0,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Container(
              color: blueColor7,
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPictureWidget(
                    path: "assets/icon/chat.svg",
                    height: 125,
                    color: Colors.white,
                  ),
                  const TextWidget(
                    text: " AK Messenger",
                    fontsize: 30,
                    textcolor: Colors.white,
                    fontweight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          );
  }
}