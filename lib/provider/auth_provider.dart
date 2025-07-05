import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

var _fireAuth = FirebaseAuth.instance;

class AuthProvider extends ChangeNotifier {
  final form = GlobalKey<FormState>();

  var isLogin = true;
  var enteredEmail = '';
  var enteredPassword = '';

  /// Ini akan menyimpan error atau status supaya bisa diakses di UI
  String? errorMessage;

  Future<bool> submit() async {
    final isvalid = form.currentState!.validate();

    if (!isvalid) {
      return false;
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

      errorMessage = null;
      notifyListeners();
      return true;
    } catch (e) {
      if (e is FirebaseException) {
        switch (e.code) {
          case 'email-already-in-use':
            errorMessage = 'Email telah digunakan';
            break;
          case 'weak-password':
            errorMessage = 'Password terlalu lemah';
            break;
          case 'user-not-found':
            errorMessage = 'User tidak ditemukan';
            break;
          case 'wrong-password':
            errorMessage = 'Password salah';
            break;
          default:
            errorMessage = 'Terjadi kesalahan: ${e.message}';
        }
      }

      notifyListeners();
      return false;
    }
  }
}
