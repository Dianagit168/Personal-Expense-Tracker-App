import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  //SignIn
  Future<UserCredential> signIn(String email, String pass) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //signup

  Future<UserCredential> signUp(String email, String pass) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
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