import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/contact_form.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Padding(
              padding: EdgeInsets.all(50),
              child: Card(
                  elevation: 0,
                  color: Color(0xFFffd1da).withOpacity(0.55),
                  child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Column(
                        children: [
                          Text(
                            "Contact Us",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 36),
                          ),
                          Divider(),
                          const Text(
                              "Want to leave some positive feedback? Or perhaps you found a sneaky bug? Whatever it is, don't hesitate to fill out the contact form.\nWe take utmost pride in this application and continually strive to create a better experience. \n\nFor online meetings, we can use any popular video conferencing service.\nFor in-person meetings, our team resides in Bush House (@ 30 Aldwych, London WC2B 4BG).\n\n We eagerly look forward to hearing from you!")
                        ],
                      )))),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Padding(
              padding: EdgeInsets.all(40),
              child: Card(
                  elevation: 0,
                  color: Color(0xFFffd1da).withOpacity(0.55),
                  child: Padding(
                      padding: EdgeInsets.all(10), child: ContactForm()))),
        )
      ]),
    );
  }
}
