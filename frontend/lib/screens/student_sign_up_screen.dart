import 'package:flutter/material.dart';

class SignUpAsSocietyScreen extends StatefulWidget {
  const SignUpAsSocietyScreen({super.key});

  @override
  State<SignUpAsSocietyScreen> createState() => _SignUpAsSocietyScreenState();
}

class _SignUpAsSocietyScreenState extends State<SignUpAsSocietyScreen> {
  TextEditingController _textControllerEmail = TextEditingController();
  TextEditingController _textControllerPassword = TextEditingController();

  TextEditingController _societyName = TextEditingController();
  TextEditingController _creationDate = TextEditingController();

  TextEditingController _uniStudyingAt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign up as a society")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: TextField(
              controller: _textControllerEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.blue),
                prefixIcon: const Icon(Icons.email_outlined),
                hintText: "Enter Email",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: TextField(
              controller: _textControllerPassword,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.blue),
                prefixIcon: const Icon(Icons.lock_outline),
                hintText: "Enter Password",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: TextField(
              controller: _textControllerPassword,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.blue),
                prefixIcon: const Icon(Icons.lock_outline),
                hintText: "Enter Society Name",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: TextField(
              controller: _uniStudyingAt,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.blue),
                prefixIcon: const Icon(Icons.school_outlined),
                hintText: "Enter University You Are Studying At",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: TextField(
              controller: _creationDate,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.blue),
                prefixIcon: const Icon(Icons.date_range_outlined),
                hintText: "Enter Society Creation Date",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: signUpSocietyAndRedirect,
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.blueAccent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                minimumSize: const Size(180, 60), //////// HERE
              ),
              child: const Text("Sign Up")),
        ],
      )),
    );
  }

  void signUpSocietyAndRedirect() {
    print("Society successfully signed up");
    print("Redirecting...");
  }
}
