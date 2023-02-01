import 'package:flutter/material.dart';
import 'package:university_ticketing_system/components/custom_text_fields.dart';
import 'package:university_ticketing_system/screens/home_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController _textControllerEmail = TextEditingController();
  TextEditingController _textControllerPassword = TextEditingController();

  bool isUserLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Log in")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: customTextFieldWithIcon(
                    _textControllerEmail,
                    context,
                    Icons.email_outlined,
                    TextInputType.emailAddress,
                    "Enter Email")),
            const SizedBox(height: 10),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: customTextFieldWithIcon(
                    _textControllerPassword,
                    context,
                    Icons.lock_outlined,
                    TextInputType.visiblePassword,
                    "Enter Password")),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: logUserIn,
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.blueAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: const Size(180, 60), //////// HERE
                ),
                child: const Text("Log In")),
          ],
        ),
      ),
    );
  }

  void logUserIn() {
    print(_textControllerEmail.text);
    print(_textControllerPassword.text);
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }
}
