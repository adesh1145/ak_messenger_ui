// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ak_messenger/ui/page/chat/chat_list.dart';
import 'package:ak_messenger/ui/page/forget_password_page/forget_email_page/forget_password_page.dart';
import 'package:ak_messenger/ui/page/login_page/login_api_services.dart';
import 'package:ak_messenger/ui/page/register_page/register.dart';
import 'package:ak_messenger/ui/widget/app_icon_top_part.dart';
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

  String email = "";
  String password = "";

  bool responseStatus=true;

  String errorData(){
    try{
      return responseData['error']['email'][0].toString();
    }
    catch (e){
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // alignment: Alignment.center,
        children: [
            TopPartOfScreen(),     Positioned(
            top: MediaQuery.of(context).size.height * 0.33-MediaQuery.of(context).viewInsets.bottom*0.5,
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
                    Column(
                      children: [
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
                      Padding(padding: EdgeInsets.only(top: 5,),
                      child: TextWidget(
                            text: errorData(),
                            textcolor: Colors.red,
                            fontsize: 15,
                          ),
                      )
                      ],
                    ),

                
                    TextFieldWidget(
                      hint: "Enter Email",
                      label: Text("Email"),
                      prfixIcon: Icon(Icons.email_outlined),
                      borderRadius: 10,
                      borderColor: Colors.grey,
                      textInputType: TextInputType.emailAddress,
                      controller: userController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Email";
                        }else if (!value.contains('@')) {
                          return "Please Enter @ ";
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
                      height: MediaQuery.of(context).size.height * 0.06,
                      onpressed: () async {
                        email = "";
                        password = "";
                        email = userController.text;
                        password = passwordController.text;
                        if (password != "" && email != "") {
                          setState(() {
                            responseStatus=false;
                          });
                          
                           await action(context,email,password);
                          responseStatus=true;
                            setState(() {
                              
                            });
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
                          onpressed: () {
                            Navigator.push(context, MaterialPageRoute(builder:(context) => ForgetPageUi(),));
                          },
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
          if (responseStatus==false)
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(dismissible: true, color: Colors.black),
          ),
        if (responseStatus==false)
          const Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
   
      
       );
  }
}
