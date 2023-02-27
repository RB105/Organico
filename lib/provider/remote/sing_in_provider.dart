import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:organico/core/widgets/show_message_helper.dart';

class SignInProvider extends ChangeNotifier {
  // CONTROLLERS
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // INSTANCE
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //  VARIABLES
  bool isLoading = false;
  bool isHide= true;

  // to SIGN IN . . .
  Future<bool> signIn() async {
    isLoading = true;
    notifyListeners();
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      isLoading = false;
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showMessageHelper(msg: "User not found");
      } else if (e.code == 'wrong-password') {
        showMessageHelper(msg: "Wrong password");
      } else {
        showMessageHelper(msg: "Something went wrong");
      }
      isLoading = false;
      notifyListeners();
      return false;
    }
  }
  void changeObscure(){
    if (isHide) {
      isHide = !isHide;
    } else {
     isHide = !isHide; 
    }
    notifyListeners();
  }
}
