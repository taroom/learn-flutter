import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

var _fireAuth = FirebaseAuth.instance;

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
        final userCredential = await _fireAuth.signInWithEmailAndPassword(
            email: enteredEmail, password: enteredPassword);
      } else {
        //register
        final userCredential = await _fireAuth.createUserWithEmailAndPassword(
            email: enteredEmail, password: enteredPassword);
      }
    } catch (e) {
      if (e is FirebaseException) {
        if (e.code == 'email-already-in-use') {
          //...
        }

        if (e.code == 'weak-password') {
          //...
        }

        if (e.code == 'user-not-found') {
          //...
        }

        if (e.code == 'wrong-password') {
          //...
        }
      }
    }
    notifyListeners();
  }
}
