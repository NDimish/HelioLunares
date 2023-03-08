import 'package:flutter/material.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/contact_form.dart';

//'Contact' subpage - Contains contact info and a form to (eventually) send
//emails to a given address directly within the app.
class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          height: 500,
          child: Padding(
              padding: const EdgeInsets.all(50),
              child: Card(
                  elevation: 0,
                  color: const Color(0xFF70587c).withOpacity(0.6),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Column(
                        children: const [
                          Text(
                            "Contact us",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 36,
                                color: Colors.white),
                          ),
                          Divider(
                            color: Colors.white70,
                          ),
                          Text(
                            " • Want to leave some positive feedback? Or perhaps you found a sneaky bug? Whatever it is, don't hesitate to fill out the contact form.\n • We take utmost pride in this application and continually strive to create a better experience. \n\n • For online meetings, we can use any popular video conferencing service.\n • For in-person meetings, our team resides in Bush House (@ 30 Aldwych, London WC2B 4BG).\n\n We eagerly look forward to hearing from you!",
                            style:
                                TextStyle(fontSize: 21, color: Colors.white54),
                          )
                        ],
                      )))),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Padding(
              padding: const EdgeInsets.all(40),
              child: SizedBox(
                  height: 600,
                  child: Card(
                      elevation: 0,
                      color: const Color(0xFF70587c).withOpacity(0.6),
                      child: const Padding(
                          padding: EdgeInsets.all(10), child: ContactForm())))),
        )
      ]),
    );
  }
}
