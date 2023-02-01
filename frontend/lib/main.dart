import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const UniversityTicketingSystem());
}

class UniversityTicketingSystem extends StatelessWidget {
  const UniversityTicketingSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'University Ticketing System',
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("University Ticketing System"),
            centerTitle: false,
            leading: const Icon(Icons.airplane_ticket_outlined, size: 30)),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              const Text("This page must be styled"),
              /*Maybe use an icon like the airplane ticket*/
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: moveToLogInPage,
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.blueAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: const Size(180, 60), //////// HERE
                      ),
                      child: const Text("Log In")),
                  const SizedBox(width: 40),
                  ElevatedButton(
                      onPressed: moveToSignUpAsSocietyPage,
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.blueAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: const Size(180, 60), //////// HERE
                      ),
                      child: const Text("Sign Up As A Society")),
                  const SizedBox(width: 40),
                  ElevatedButton(
                      onPressed: moveToSignUpAsStudentPage,
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.blueAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: const Size(180, 60), //////// HERE
                      ),
                      child: const Text("Sign Up As Student"))
                ],
              ),
            ])));
  }

  void moveToLogInPage() {
    print("Redirect to log in page");
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LogInScreen()),
      );
    });
  }

  void moveToSignUpAsSocietyPage() {
    print("Redirect to sign up page");
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignUpAsSocietyScreen()),
      );
    });
  }

  void moveToSignUpAsStudentPage() {
    print("Redirect to sign up page");
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignUpAsStudentScreen()),
      );
    });
  }
}

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
              child: TextField(
                controller: _textControllerEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.blue),
                  prefixIcon: const Icon(Icons.email_outlined),
                  hintText: "Enter Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
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
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: Text("This is the home page"))),
    );
  }
}
