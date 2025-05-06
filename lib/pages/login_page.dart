import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_expense_tracker_app/provider/auth_service.dart';

import 'package:personal_expense_tracker_app/pages/signup_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;

  void signIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );
    try {
      await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      print('Error code: ${e.code}');

      // if (e.code == 'user-not-found') {
      //   print('Incorrect Email');
      //   wrongEmailMessage();
      // } else if (e.code == 'wrong-password') {
      //   print('Incorrect Password');
      //   wrongPassMessage();
      // }

      if (e.code == 'invalid-credential') {
        print('Invalid credentials');
        wrongEmailOrPasswordMessage(); // handle both
      } else {
        print('Unhandled error: ${e.message}');
      }
    }
  }

  void wrongEmailOrPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text('Email or Password is incorrect'));
      },
    );
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text('Incorrect Email'));
      },
    );
  }

  void wrongPassMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text('Incorrect Password'));
      },
    );
  }

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
                    'Welcome',
                    //     'Welcome back you\'ve been missed!'
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
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
                  // MyTextfield(
                  //   obscureText: true,
                  //   hintText: 'Password',
                  //   controller: passwordController,
                  // ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  ElevatedButton(onPressed: signIn, child: Text("Sign In")),
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
                      Text('Not a member?'),
                      SizedBox(width: 4),
                      TextButton(
                        onPressed:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpPage(),
                              ),
                            ),
                        child: Text('Register now'),
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
