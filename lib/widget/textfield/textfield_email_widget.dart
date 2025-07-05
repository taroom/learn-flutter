import 'package:flutter/material.dart';
import 'package:helloworld/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class TextfieldEmailWidget extends StatefulWidget {
  final TextEditingController controller;

  const TextfieldEmailWidget({super.key, required this.controller});

  @override
  State<TextfieldEmailWidget> createState() => _TextfieldEmailWidgetState();
}

class _TextfieldEmailWidgetState extends State<TextfieldEmailWidget> {
  @override
  Widget build(BuildContext context) {
    var loadAuth = Provider.of<AuthProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: widget.controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value!.isEmpty || value == "") {
              return "Please enter your email";
            } else if (!value.trim().contains("@")) {
              return "Email invalid";
            }

            return null;
          },
          onSaved: (value) {
            loadAuth.enteredEmail = value!;
          },
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: "InsertEmail"),
        )
      ],
    );
  }
}
