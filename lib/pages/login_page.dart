import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // void signInUser() async {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email: usernameController.text,
  //     password: passwordController.text,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
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
                    ),
                  ),
                  SizedBox(height: 25),
                  TextField(
                    decoration: InputDecoration(hintText: 'Username'),
                    controller: usernameController,
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
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/home_page'),
                    child: Text('Sign In'),
                  ),
                  // MyButton(
                  //   onTap: signInUser,
                  //   text: 'Sign In',
                  // ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: Colors.grey[400], thickness: 0.5),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: Colors.grey[400], thickness: 0.5),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     SqareTile(imagePath: 'lib/images/google.png'),
                  //     SizedBox(width: 10),
                  //     SqareTile(imagePath: 'lib/images/apple.png'),
                  //   ],
                  // ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not a member?'),
                      SizedBox(width: 4),
                      Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
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
