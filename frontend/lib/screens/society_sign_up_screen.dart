import 'package:flutter/material.dart';

class SignUpAsStudentScreen extends StatefulWidget {
  const SignUpAsStudentScreen({super.key});

  @override
  State<SignUpAsStudentScreen> createState() => _SignUpAsStudentScreenState();
}

class _SignUpAsStudentScreenState extends State<SignUpAsStudentScreen> {
  TextEditingController _textControllerEmail = TextEditingController();
  TextEditingController _textControllerPassword = TextEditingController();

  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();

  TextEditingController _uniStudyingAt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign up as a student")),
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: TextField(
                controller: _firstName,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.blue),
                  prefixIcon: const Icon(Icons.person),
                  hintText: "Enter First Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: TextField(
                controller: _lastName,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.blue),
                  prefixIcon: const Icon(Icons.person),
                  hintText: "Enter Last Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: TextField(
                controller: _firstName,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.blue),
                  prefixIcon: const Icon(Icons.school_outlined),
                  hintText: "Enter Degree Undertaken",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: signUserUpAndRedirect,
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.blueAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  minimumSize: const Size(180, 60), //////// HERE
                ),
                child: const Text("Sign Up In")),
          ],
        ),
      ),
    );
  }

  void signUserUpAndRedirect() {
    print("User successfully signed up");
    print("Redirecting...");
  }
}
