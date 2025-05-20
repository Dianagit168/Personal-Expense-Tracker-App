import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_expense_tracker_app/components/my_btn.dart';
import 'package:personal_expense_tracker_app/components/my_textfild.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, this.onTap});
  final void Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final conPasswordController = TextEditingController();
  bool isLoading = false;

  final auth = FirebaseAuth.instance;

  void signUpUser() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );
    try {
      if (passwordController.text == conPasswordController.text) {
        await auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        Navigator.pop(context);
      } else {
        Navigator.pop(context);
        print('Password don not match!');
        passwordMessage();
        return;
      }

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      print('Error code: ${e.code}');
    }
  }

  void passwordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text('Password don not match!'));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final authService = context.read<AuthService>();
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
                    'Let\'s create an account for you!',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      //fontSize: 35,
                    ),
                  ),
                  SizedBox(height: 25),

                  MyTextfield(
                    obscureText: false, // show value
                    hintText: 'Username',
                    controller: emailController,
                  ),
                  SizedBox(height: 25),
                  MyTextfield(
                    obscureText: false, // show value
                    hintText: 'Password',
                    controller: passwordController,
                  ),
                  SizedBox(height: 25),
                  MyTextfield(
                    obscureText: false, // show value
                    hintText: 'Confirm Password',
                    controller: conPasswordController,
                  ),

                  SizedBox(height: 25),
                  MyBotton(onTap: signUpUser, btnName: "Sign Up"),
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
                        onPressed: widget.onTap,

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
