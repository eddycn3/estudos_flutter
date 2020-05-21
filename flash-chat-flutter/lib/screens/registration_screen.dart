import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/widgets/round_button.dart';
import 'package:flutter/material.dart';
import "dart:io" show Platform;

import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = "/registration";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;
  bool _isLoading = false;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: "logo",
                child: Container(
                  height: Platform.isIOS ? 200.0 : 150.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: Platform.isIOS ? 48.0 : 24.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: "Entre com seu email")),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: "Entre com uma senha")),
              SizedBox(
                height: Platform.isIOS ? 24.0 : 12.0,
              ),
              RoundButton(
                btnColor: Colors.blueAccent,
                textAction: "Register",
                btnOnPressed: () async {
                  if (email != null && password != null) {
                    try {
                      setState(() {
                        _isLoading = true;
                      });

                      var user = await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        print("Registration.user : " + user.toString());
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        _isLoading = false;
                      });
                    } catch (e) {
                      setState(() {
                        _isLoading = false;
                      });
                      print("Registration error: " + e);
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
