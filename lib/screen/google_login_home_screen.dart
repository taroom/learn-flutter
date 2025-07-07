import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GoogleLoginHomeScreen extends StatefulWidget {
  const GoogleLoginHomeScreen({super.key});

  @override
  State<GoogleLoginHomeScreen> createState() => _GoogleLoginHomeScreenState();
}

class _GoogleLoginHomeScreenState extends State<GoogleLoginHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
                "${FirebaseAuth.instance.currentUser!.photoURL ?? Icon(Icons.account_circle_sharp)}"),
          ),
          Text(
            "Name : ${FirebaseAuth.instance.currentUser!.displayName}",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          Text(
            "Email: ${FirebaseAuth.instance.currentUser?.email}",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          )
        ],
      ),
    );
  }
}
