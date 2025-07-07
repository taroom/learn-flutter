import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:helloworld/service/google_auth.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class GoogleLoginScreen extends StatefulWidget {
  const GoogleLoginScreen({super.key});

  @override
  State<GoogleLoginScreen> createState() => _GoogleLoginScreenState();
}

class _GoogleLoginScreenState extends State<GoogleLoginScreen> {
  GoogleSignInAccount? _currentUser;
  @override
  void initState() {
    super.initState();

    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      if (mounted) {
        setState(() {
          _currentUser = account;
        });
      }
    });

    _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: const Text('Google Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_currentUser != null)
            Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(_currentUser!.photoUrl ?? ''),
                  radius: 40,
                ),
                SizedBox(height: 10),
                Text('Hello, ${_currentUser!.displayName}'),
                Text(_currentUser!.email),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await _googleSignIn.signOut();
                    setState(() {
                      _currentUser = null;
                    });
                  },
                  child: Text("Logout"),
                )
              ],
            )
          else
            ElevatedButton(
              onPressed: () async {
                try {
                  final account = await _googleSignIn.signIn();
                  if (account == null) {
                    // user cancel login
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Google Sign-in dibatalkan")),
                      );
                    }
                    return;
                  }

                  setState(() {
                    _currentUser = account;
                  });

                  // Optional: panggil Firebase auth jika mau
                  await FirebaseServices().firebaseAuthWithGoogle(account);
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Terjadi kesalahan login")),
                    );
                  }
                }
              },
              child: Center(child: Text('Google Login')),
            )
        ],
      ),
    );
  }
}
