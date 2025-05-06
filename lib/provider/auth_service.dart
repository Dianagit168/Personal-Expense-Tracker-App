import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_expense_tracker_app/pages/expense_page.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

  //SignIn
  void signIn(String email, String pass, context) async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );
    try {
      await auth.signInWithEmailAndPassword(email: email, password: pass);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Navigator.pop(context);
        wrongEmailMessage(context);
      } else if (e.code == 'wrong-password') {
        wrongPassMessage(context);
      }
    }
  }

  void wrongEmailMessage(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text('Incorrect Email'));
      },
    );
  }

  void wrongPassMessage(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text('Incorrect Password'));
      },
    );
  }

  //signup

  Future<UserCredential?> signUp(
    String email,
    String pass,
    BuildContext context,
  ) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return userCredential;
    } catch (e) {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text('Registration Successful!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false,
                    );
                  },
                  child: Text('OK'),
                ),
              ],
            ),
      );
      return null;
    }
  }

  //sign out
  Future<void> signOut() async {
    return await auth.signOut();
  }
}
//  Future<String> signUp(String email, String pass, String name) async {
//     String res = 'Some error';
//     try {
//       UserCredential userCredential = await auth.createUserWithEmailAndPassword(
//         email: email,
//         password: pass,
//       );
//       await firebaseFirestore
//           .collection("users")
//           .doc(userCredential.user!.uid)
//           .set({'name': name, 'email': email, 'uid': userCredential.user!.uid});
//       res = "Success";
//     } on FirebaseAuthException catch (e) {
//       throw Exception(e.code);
//     }
//     return res;
//   }