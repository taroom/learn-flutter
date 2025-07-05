import 'package:flutter/material.dart';
import 'package:helloworld/provider/auth_provider.dart';
import 'package:helloworld/widget/imgpick/imgpick_widget.dart';
import 'package:helloworld/widget/textfield/textfield_email_widget.dart';
import 'package:helloworld/widget/textfield/textfield_pass_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtControllerEmail = TextEditingController();
  TextEditingController txtControllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var loadAuth = Provider.of<AuthProvider>(context);
    return Container(
      color: Color.fromARGB(255, 29, 29, 29),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          // appBar: AppBar(
          //   backgroundColor: Colors.amber,
          //   title: Text("Login With Firebase"),
          // ),
          // https://youtu.be/nYk7B2LmPrc?si=Q6lfVyP5O4kdp8p8&t=1332
          body: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/img/dark-pola.png"),
                        fit: BoxFit.cover)),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4 - 20,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 29, 29, 29),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.green,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 5))
                    ]),
              ),
              Column(
                children: [
                  Spacer(),
                  Container(
                    height: MediaQuery.of(context).size.height / 4 - 20,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 29, 29, 29),
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.green,
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, -5))
                        ]),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loadAuth.isLogin ? "Login" : "Register",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.fontSize,
                          color: loadAuth.isLogin ? Colors.amber : Colors.blue),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.green,
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 3))
                          ]),
                      child: Form(
                        key: loadAuth.form,
                        child: Column(
                          children: [
                            if (!loadAuth.isLogin) ImagePickWidget(),
                            TextfieldEmailWidget(
                              controller: txtControllerEmail,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextfieldPassWidget(
                                controller: txtControllerPassword),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding: EdgeInsets.all(0),
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    final success = await loadAuth.submit();

                                    if (!context.mounted) return;
                                    final msg = context
                                        .read<AuthProvider>()
                                        .errorMessage;

                                    if (success) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Berhasil login/registrasi!')),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(content: Text(msg!)),
                                      );
                                    }
                                  },
                                  child: Text(
                                      loadAuth.isLogin ? "Login" : "Register")),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    loadAuth.isLogin = !loadAuth.isLogin;
                                  });
                                },
                                child: Text(loadAuth.isLogin
                                    ? 'Buat Akun'
                                    : 'Sudah Punya Akun! Mau Login'))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
