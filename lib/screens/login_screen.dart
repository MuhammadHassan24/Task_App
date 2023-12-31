import 'package:chat_app/models/authenticat/login_auth.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool authenticated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                  onPressed: () async {
                    final authenticat = await Authantication.authentication();
                    setState(() {
                      authenticated = authenticat;
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomeView()));
                    });
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Icon(Icons.fingerprint), Text("FingerPrint")],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
