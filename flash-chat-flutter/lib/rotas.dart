import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> getAppRoutes(
      BuildContext appContext) {
    return {
      WelcomeScreen.id: (context) => WelcomeScreen(),
      ChatScreen.id: (context) => ChatScreen(),
      LoginScreen.id: (context) => LoginScreen(),
      RegistrationScreen.id: (context) => RegistrationScreen(),
    };
  }
}
