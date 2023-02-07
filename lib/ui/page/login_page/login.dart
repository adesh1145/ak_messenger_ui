// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ak_messenger/ui/page/chat/chat_list.dart';
import 'package:ak_messenger/ui/page/register_page/register.dart';
import 'package:ak_messenger/ui/widget/colors.dart';
import 'package:ak_messenger/ui/widget/elevatedbutton.dart';
import 'package:ak_messenger/ui/widget/svgpicture.dart';
import 'package:ak_messenger/ui/widget/text.dart';
import 'package:ak_messenger/ui/widget/textformfield.dart';
import 'package:flutter/material.dart';

class LogInWithEmailPageUi extends StatefulWidget {
  const LogInWithEmailPageUi({super.key});

  @override
  State<LogInWithEmailPageUi> createState() => _LogInWithEmailPageUiState();
}

class _LogInWithEmailPageUiState extends State<LogInWithEmailPageUi> {
  final GlobalKey _emailFormKey = GlobalKey<FormState>();

  final GlobalKey _passwordKey = GlobalKey<FormState>();

  final userController = TextEditingController();

  final passwordController = TextEditingController();

  String usename = "";

  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // alignment: Alignment.center,
        children: [
          Positioned(
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
                  TextWidget(
                    text: " AK Messenger",
                    fontsize: 30,
                    textcolor: Colors.white,
                    fontweight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.33,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.67,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  // color: Colors.white,
                  gradient: gradientColor),
              child: Form(
                key: _emailFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: " Welcome !",
                      fontsize: 30,
                      textcolor: Colors.black,
                      fontweight: FontWeight.bold,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          thickness: 1.3,
                          color: Colors.blueGrey,
                        )),
                        TextWidget(
                          text: "  Log in Email/Password  ",
                          textcolor: Colors.grey,
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 1.3,
                          color: Colors.blueGrey,
                        )),
                      ],
                    ),
                    TextFieldWidget(
                      hint: "Enter Email/Number",
                      label: Text("Email/Number"),
                      prfixIcon: Icon(Icons.email_outlined),
                      borderRadius: 10,
                      borderColor: Colors.grey,
                      textInputType: TextInputType.emailAddress,
                      controller: userController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Email/Number";
                        }
                        return null;
                      },
                    ),
                    TextFieldWidget(
                      key: _passwordKey,
                      obscureText: true,
                      hint: "Enter Password",
                      label: Text("Password"),
                      prfixIcon: Icon(Icons.password_rounded),
                      borderRadius: 10,
                      borderColor: Colors.grey,
                      textInputType: TextInputType.visiblePassword,
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Password".toString();
                        }
                        return null;
                      },
                    ),
                    ElevatedButtonWidget(
                      text: "Log In",
                      textcolor: Colors.white,
                      borderRadius: 15,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.06,
                      onpressed: () {
                       
                          usename = "";
                          password = "";
                          usename = userController.text;
                          password = passwordController.text;
                          if (password != "" && usename != "") {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => ChatListPageUi(),));
                          }
                     
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButtonWidget(
                          text: "Forget Password?",
                          fontsize: 17,
                          textcolor: blackColor,
                          onpressed: () {},
                        ),
                        ElevatedButtonWidget(
                          text: "Register",
                          fontsize: 17,
                          textcolor: blackColor,
                          // fontweight: FontWeight.bold,
                          onpressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterPageUi(),
                                ));
                          },
                        )
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Divider(
                                thickness: 1.3,
                                color: Colors.blueGrey,
                              )),
                              TextWidget(
                                text: "  Or LogIn/Register  ",
                                textcolor: Colors.grey,
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 1.3,
                                  color: Colors.blueGrey,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                child: SvgPictureWidget(
                                  path: "assets/icon/google.svg",
                                  height:
                                      MediaQuery.of(context).size.width * 0.16,
                                ),
                                onTap: () {},
                              ),
                              InkWell(
                                child: SvgPictureWidget(
                                  path: "assets/icon/microsoft.svg",
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                ),
                                onTap: () {},
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
