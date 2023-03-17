import 'package:flutter/material.dart';
import 'package:university_ticketing_system/authentication/validators/email_validator.dart';
import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/responsive.dart';
import 'package:university_ticketing_system/submit_button.dart';
import 'package:university_ticketing_system/tff_decoration.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  FocusNode inputNode = FocusNode();

  String email = "";
  String name = "";
  String message = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  String dropdownvalue = 'General Feedback';

  var items = [
    'General Feedback',
    'Bug Report',
    'Feature Request',
  ];

  @override
  void initState() {
    super.initState();
  }

  void openKeyboard() {
    FocusScope.of(context).requestFocus(inputNode);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: CustomLinearGradient(
            child: Center(
                child: Padding(
                    padding: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 20 : 40,
                        left: 15.0,
                        right: 15.0),
                    child: ListView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        children: <Widget>[
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/contract.png',
                                  height:
                                      ResponsiveWidget.isSmallScreen(context)
                                          ? 70
                                          : 90,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                const Text("Send us a message!",
                                    textScaleFactor: 2.5,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Arvo",
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.005),
                                const Text(
                                  "----- Contact us with your feedback -----",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "Arvo", color: Colors.black),
                                ),
                                SizedBox(
                                    height:
                                        ResponsiveWidget.isSmallScreen(context)
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.06
                                            : MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.04),
                                ResponsiveWidget.isSmallScreen(context)
                                    ? contactUsForm(context)
                                    : Card(
                                        color: Colors.white.withOpacity(0.4),
                                        elevation: 0,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: contactUsForm(context),
                                        )),
                              ])
                        ])))));
  }

  Form contactUsForm(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 35,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: DropdownButton(
                  style: TextStyle(fontFamily: "Arvo", color: Colors.black),
                  value: dropdownvalue,
                  iconSize: 20,
                  underline: SizedBox(),
                  icon: const Icon(Icons.keyboard_arrow_down,
                      color: Colors.black),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                )),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            SizedBox(
              width: ResponsiveWidget.isSmallScreen(context)
                  ? MediaQuery.of(context).size.width * 0.85
                  : MediaQuery.of(context).size.width * 0.60,
              child: TextFormField(
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  style:
                      const TextStyle(fontFamily: "Arvo", color: Colors.black),
                  controller: emailController,
                  validator: emailValidator,
                  onFieldSubmitted: (value) {
                    print("submitted");
                  },
                  onChanged: (value) {
                    email = emailController.text;
                  },
                  onSaved: (newValue) {
                    email = emailController.text;
                  },
                  decoration: customDecoration(
                      "Email", "Enter your email", Icons.email_rounded)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.035),
            SizedBox(
              width: ResponsiveWidget.isSmallScreen(context)
                  ? MediaQuery.of(context).size.width * 0.85
                  : MediaQuery.of(context).size.width * 0.60,
              child: TextFormField(
                  cursorColor: Colors.black,
                  style:
                      const TextStyle(fontFamily: "Arvo", color: Colors.black),
                  controller: nameController,
                  //validator: passwordValidator,
                  onFieldSubmitted: (value) {
                    print("submitted");
                  },
                  onChanged: (value) {
                    name = nameController.text;
                  },
                  onSaved: (newValue) {
                    name = nameController.text;
                  },
                  decoration: customDecoration(
                      "Name", "Enter your name", Icons.person_2_rounded)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.035),
            SizedBox(
              width: ResponsiveWidget.isSmallScreen(context)
                  ? MediaQuery.of(context).size.width * 0.85
                  : MediaQuery.of(context).size.width * 0.60,
              child: TextFormField(
                  maxLines: 5,
                  maxLength: 120,
                  cursorColor: Colors.black,
                  style:
                      const TextStyle(fontFamily: "Arvo", color: Colors.black),
                  controller: messageController,
                  onFieldSubmitted: (value) {
                    print("submitted");
                  },
                  onChanged: (value) {
                    message = messageController.text;
                  },
                  onSaved: (newValue) {
                    message = messageController.text;
                  },
                  decoration: customDecorationMultiLineTextField(
                      "Message", "Enter your message", Icons.message_rounded)),
            ),
            SizedBox(
                height: ResponsiveWidget.isSmallScreen(context)
                    ? MediaQuery.of(context).size.height * 0.07
                    : MediaQuery.of(context).size.height * 0.05),
            SubmitButton(
                onPressed: () {
                  _formKey.currentState!.validate()
                      ? print("Valid form")
                      : print("Invalid form");
                },
                scaleFactor:
                    ResponsiveWidget.isSmallScreen(context) ? 0.6 : 0.45,
                textIn: "Send Message"),
          ],
        ));
  }

  InputDecoration customDecorationMultiLineTextField(
      String labelText, String hintText, IconData iconIn) {
    return InputDecoration(
        contentPadding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 40),
        suffixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(end: 25.0),
          child: Icon(
            iconIn,
            color: Colors.black,
          ), // myIcon is a 48px-wide widget.
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black),
        ),
        errorStyle: const TextStyle(fontFamily: "Arvo"),
        labelText: labelText,
        hintText: hintText,
        labelStyle: const TextStyle(fontFamily: "Arvo", fontSize: 18),
        hintStyle: const TextStyle(fontFamily: "Arvo", fontSize: 15),
        floatingLabelStyle: const TextStyle(
            color: Colors.black, fontFamily: "Arvo", fontSize: 18),
        floatingLabelBehavior: FloatingLabelBehavior.always);
  }
}
