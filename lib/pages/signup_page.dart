import 'package:flutter/material.dart';
import 'package:personal_expense_tracker_app/provider/auth_service.dart';

import 'package:personal_expense_tracker_app/pages/login_page.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, this.onTap});
  final void Function()? onTap;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();

  // final usernameController = TextEditingController();

  final passwordController = TextEditingController();
  bool isLoading = false;

  final conPasswordController = TextEditingController();
  final auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Icon(Icons.lock, size: 100),
                  SizedBox(height: 50),
                  Text(
                    'Welcome back you\'ve been missed!',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      //fontSize: 35,
                    ),
                  ),
                  SizedBox(height: 25),
                  // TextField(
                  //   decoration: InputDecoration(hintText: 'User name'),
                  //   controller: usernameController,
                  // ),
                  SizedBox(height: 25),
                  TextField(
                    decoration: InputDecoration(hintText: 'Email'),
                    controller: emailController,
                  ),
                  // MyTextfield(
                  //   obscureText: false, // show value
                  //   hintText: 'Username',
                  //   controller: usernameController,
                  // ),
                  SizedBox(height: 25),
                  TextField(
                    decoration: InputDecoration(hintText: 'Password'),
                    controller: passwordController,
                  ),
                  SizedBox(height: 25),
                  TextField(
                    decoration: InputDecoration(hintText: 'Confirm Password'),
                    controller: conPasswordController,
                  ),
                  SizedBox(height: 10),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Text(
                  //       'Forgot Password?',
                  //       style: TextStyle(
                  //         color: Colors.grey[600],
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      if (passwordController.text.trim() ==
                          conPasswordController.text.trim()) {
                        authService.signUp(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                          context,
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder:
                              (context) => AlertDialog(
                                title: Text('Password don not matchs!'),
                              ),
                        );
                      }
                    },
                    child: Text("Sign Up"),
                  ),
                  //TextButton(onPressed: signInUser, child: Text('Sign In')),
                  // MyButton(
                  //   onTap: signInUser,
                  //   text: 'Sign In',
                  // ),
                  SizedBox(height: 50),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Divider(color: Colors.grey[400], thickness: 0.5),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 10),
                  //       child: Text(
                  //         'Or continue with',
                  //         style: TextStyle(color: Colors.grey[700]),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: Divider(color: Colors.grey[400], thickness: 0.5),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: 50),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     SqareTile(imagePath: 'lib/images/google.png'),
                  //     SizedBox(width: 10),
                  //     SqareTile(imagePath: 'lib/images/apple.png'),
                  //   ],
                  // ),
                  // SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('You are member?'),
                      SizedBox(width: 4),
                      TextButton(
                        onPressed:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            ),
                        child: Text('Log In'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
