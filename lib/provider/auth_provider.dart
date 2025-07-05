import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final form = GlobalKey<FormState>();

  var isLogin = true;
  var enteredEmail = '';
  var enteredPassword = '';

  void submit() async {
    final isvalid = form.currentState!.validate();

    if (!isvalid) {
      return;
    }

    form.currentState!.save();

    try {
      if (isLogin) {
        // final UserCredential = await _fireAuth.signInWithEmailAndPassword(
        // email: enteredEmail, password: enteredPassword);
      } else {
        //register
        // final UserCredential = await _fireAuth.createUserWithEmailAndPassword(
        // email: enteredEmail, password: enteredPassword);
      }
    } catch (e) {
      // i
    }
    notifyListeners();
  }
}
