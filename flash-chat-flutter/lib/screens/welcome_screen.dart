import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/widgets/round_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = "/";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                Text(
                  'Flash Chat_',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            // 'Log In'
            RoundButton(
              btnColor: Colors.lightBlueAccent,
              textAction: "Register",
              btnOnPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
            RoundButton(
              btnColor: Colors.lightBlueAccent,
              textAction: "Login",
              btnOnPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            )
            //'Register'
          ],
        ),
      ),
    );
  }
}

/*colors
Colors.lightBlueAccent 'Register'
Colors.blueAccent
*/
