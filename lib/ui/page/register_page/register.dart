// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:ak_messenger/ui/page/login_page/login.dart';
import 'otp.dart';
import 'package:ak_messenger/ui/widget/colors.dart';
import 'package:ak_messenger/ui/widget/elevatedbutton.dart';
import 'package:ak_messenger/ui/widget/svgpicture.dart';
import 'package:ak_messenger/ui/widget/text.dart';
import 'package:ak_messenger/ui/widget/textformfield.dart';
import 'package:flutter/material.dart';

class RegisterPageUi extends StatefulWidget {
  const RegisterPageUi({super.key});

  @override
  State<RegisterPageUi> createState() => _RegisterPageUiState();
}

class _RegisterPageUiState extends State<RegisterPageUi> {
  final GlobalKey _numberFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String name = "";
  String number = "";
  String email = "";
  String password = "";
  String confirmPassword = "";

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
            top: MediaQuery.of(context).size.height * 0.33 -
                MediaQuery.of(context).viewInsets.bottom * 0.75,
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
                  gradient: gradientColor),
              child: Form(
                key: _numberFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          text: "  Register  ",
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
                      hint: "Enter Name",
                      label: Text("Name"),
                      prfixIcon: Icon(
                        Icons.person_outlined,
                      ),
                      borderRadius: 10,
                      borderColor: Colors.grey,
                      textInputType: TextInputType.name,
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Name".toString();
                        }

                        return null;
                      },
                    ),
                    TextFieldWidget(
                      hint: "Enter Number",
                      label: Text("Number"),
                      prfixIcon: Icon(Icons.phone_rounded),
                      borderRadius: 10,
                      borderColor: Colors.grey,
                      textInputType: TextInputType.number,
                      controller: numberController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Number".toString();
                        } else if (value.length < 10 || value.length > 10) {
                          return "Please Enter 10 Digit Number";
                        }
                        return null;
                      },
                    ),
                    TextFieldWidget(
                      hint: "Enter Email",
                      label: Text("Email"),
                      prfixIcon: Icon(
                        Icons.email_outlined,
                      ),
                      borderRadius: 10,
                      borderColor: Colors.grey,
                      textInputType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Email".toString();
                        } else if (!value.contains('@')) {
                          return "Please Enter @ ";
                        }
                        return null;
                      },
                    ),
                    TextFieldWidget(
                      hint: "Enter Pasword",
                      label: Text("Pasword"),
                      prfixIcon: Icon(
                        Icons.password_outlined,
                      ),
                      borderRadius: 10,
                      borderColor: Colors.grey,
                      textInputType: TextInputType.visiblePassword,
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Password".toString();
                        }
                        return null;
                      },
                    ),
                    TextFieldWidget(
                      hint: "Enter Confirm Pasword",
                      label: Text("Confirm Pasword"),
                      prfixIcon: Icon(
                        Icons.password_outlined,
                      ),
                      borderRadius: 10,
                      borderColor: Colors.grey,
                      textInputType: TextInputType.visiblePassword,
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Password".toString();
                        } else if (value != passwordController.text) {
                          return "Password Doesn't Match";
                        }
                        return null;
                      },
                    ),
                    ElevatedButtonWidget(
                      text: "Register",
                      borderRadius: 15,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.06,
                      textcolor: Colors.white,
                      onpressed: () {
                        name = "";
                        number = "";
                        email = "";
                        password = "";
                        confirmPassword = "";

                        name = nameController.text;
                        number = numberController.text;
                        email = emailController.text;
                        password = passwordController.text;
                        confirmPassword = confirmPasswordController.text;

                        if (name != "" &&
                            number.length == 10 &&
                            email.contains('@') &&
                            password != "" &&
                            confirmPassword != "" &&
                            password == confirmPassword) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtpPageUi(
                                  number: number,
                                  email: email,
                                ),
                              ));
                        } else {
                          setState(() {});
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButtonWidget(
                          text: "Log In with Email",
                          fontsize: 15,
                          textcolor: blackColor,
                          onpressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LogInWithEmailPageUi(),
                                ));
                          },
                        )
                      ],
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
