import 'package:flutter/material.dart';
import 'package:personal_expense_tracker_app/pages/login_page.dart';
import 'package:personal_expense_tracker_app/pages/signup_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void toggleLogin() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: toggleLogin);
    } else {
      return RegisterPage(onTap: toggleLogin);
    }
  }
}
