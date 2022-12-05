import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  ///Register User
  Future<UserCredential> registerUser(
      { String email,  String password}) async {
    return await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  ///Login User
  Future<UserCredential> loginUser(
      { String email,  String password}) async {
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  ///Reset Password
  Future resetPassword({ String email}) async {
    return await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  ///SignOut
  Future signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}