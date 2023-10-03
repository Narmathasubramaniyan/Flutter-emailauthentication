import 'package:firebase_auth/firebase_auth.dart';

class AuthManage {
  Future signUp(String userEmail, String userPass) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: userEmail, password: userPass);
  }
}
