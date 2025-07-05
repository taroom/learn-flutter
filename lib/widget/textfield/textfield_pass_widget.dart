import 'package:flutter/material.dart';
import 'package:helloworld/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class TextfieldPassWidget extends StatefulWidget {
  final TextEditingController controller;

  const TextfieldPassWidget({super.key, required this.controller});

  @override
  State<TextfieldPassWidget> createState() => _TextfieldPassWidgetState();
}

class _TextfieldPassWidgetState extends State<TextfieldPassWidget> {
  bool stateObsecureText = true;
  @override
  Widget build(BuildContext context) {
    var loadAuth = Provider.of<AuthProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          obscureText: stateObsecureText,
          controller: widget.controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value!.trim().isEmpty || value == "") {
              return "Please enter your password";
            } else if (value.trim().length < 6) {
              return "Password harus minimal 6 karakter";
            }

            return null;
          },
          onSaved: (value) {
            loadAuth.enteredPassword = value!;
          },
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: "Insert Password",
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      stateObsecureText = !stateObsecureText;
                    });
                  },
                  icon: Icon(Icons.remove_red_eye_rounded))),
        )
      ],
    );
  }
}
