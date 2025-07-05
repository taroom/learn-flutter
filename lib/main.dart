import 'package:flutter/material.dart';
import 'package:helloworld/provider/auth_provider.dart';
import 'package:helloworld/screen/login_screen.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized(); // ini buat apa?
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Login Firebase',
        darkTheme:
            ThemeData(brightness: Brightness.dark, primarySwatch: Colors.green),
        themeMode: ThemeMode.dark,
        home: LoginScreen(),
      ),
    );
  }
}
/* 
class FirebaseLogin extends StatefulWidget {
  const FirebaseLogin({super.key});

  @override
  State<FirebaseLogin> createState() => _FirebaseLoginState();
}

class _FirebaseLoginState extends State<FirebaseLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Login at Firebase'),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.developer_board),
                Text(
                  "Google Login",
                  style: TextStyle(fontSize: 20, color: Colors.amber),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 */
