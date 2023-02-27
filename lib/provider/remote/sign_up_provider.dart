import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:organico/core/widgets/show_message_helper.dart';

class SignUpProvider extends ChangeNotifier {
  // CONTROLLERS
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // INSTANCE
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //  VARIABLES
  bool isHide = true;
  bool isLoading = false;
  bool isRegisteredBefore = false;

  Future<dynamic> signUp() async {
    isLoading = true;
    notifyListeners();
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      isLoading = false;
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showMessageHelper(msg: "Weak password");
      } else if (e.code == 'email-already-in-use') {
        isRegisteredBefore = true;
        notifyListeners();
        showMessageHelper(msg: "Email already in use,please try to sign in");
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
