import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/api/user_status.dart';
import 'package:student_app/components/message_boxes.dart';
import 'package:student_app/routes/paths.dart';

class AuthController extends GetxController {
  //-----------------------------------------------------------------
  TextEditingController emaillogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();
  TextEditingController emailReg = TextEditingController();
  TextEditingController passwordReg = TextEditingController();
  //-----------------------------------------------------------------
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //-----------------------------------------------------------------
  final LocalUserStatus _localUserStatus = LocalUserStatus();
  //-----------------------------------------------------------------

  //check validation
  bool isLoginvalid() {
    if (emaillogin.text.isEmpty || passwordLogin.text.isEmpty) {
      alertBoxWarning("Feild cannot be empty");
      return false;
    }
    if (!emaillogin.text.contains('@') || !emaillogin.text.contains('.')) {
      alertBoxWarning("Invalid email");
      return false;
    }
    return true;
  }

  bool isRegvalid() {
    if (emailReg.text.isEmpty || passwordReg.text.isEmpty) {
      alertBoxWarning("Feild cannot be empty");
      return false;
    }
    if (!emailReg.text.contains('@') && !emailReg.text.contains('.')) {
      alertBoxWarning("Invalid email");
      return false;
    }

    if (passwordReg.text.length < 6) {
      alertBoxWarning("Password must have at least 6 characters");
      return false;
    }

    return true;
  }

//------------------------------------------login
  Future<void> login() async {
    //validation
    if (!isLoginvalid()) {
      return;
    }

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emaillogin.text.trim(),
        password: passwordLogin.text.trim(),
      );

      if (userCredential.user != null) {
        alertBoxSuccess("Login Success");

        // add user id to the local storage
        await _localUserStatus.addCurrentUserData(userCredential.user!.uid);

        // move to home page
        Get.offAllNamed(Routes.home);
      } else {
        alertBoxError("Login failed");
      }
    } on FirebaseAuthException catch (e) {
      alertBoxError(e.code);
    }
  }

//----------------------------------------------- Signin
  Future<void> signUp() async {
    //validation
    if (!isRegvalid()) {
      return;
    }

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailReg.text.trim(),
        password: passwordReg.text.trim(),
      );

      if (userCredential.user != null) {
        alertBoxSuccess("SignIN Success. you can login now!");

        // move to home page
        Get.offAllNamed(Routes.login);
      } else {
        alertBoxError("Signin failed");
      }
    } on FirebaseAuthException catch (e) {
      alertBoxError(e.code);
    }
  }
}
