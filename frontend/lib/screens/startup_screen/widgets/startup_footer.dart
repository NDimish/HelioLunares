import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/social_icons.dart';
import 'package:url_launcher/url_launcher.dart';

TextSpan footerText(message) {
  return TextSpan(
      text: message, style: GoogleFonts.barlow(color: Colors.white));
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        child: BottomAppBar(
          color: const Color(0xFF70587c),
          elevation: 5,
          child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: RichText(
                      text: TextSpan(children: [
                    footerText("© 2023 Helio Lunares | Coded with "),
                    const WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        CupertinoIcons.heart_solid,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                    footerText(" for "),
                    const WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        Icons.apple,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    const WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        Icons.android,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    footerText(" & "),
                    const WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        Icons.public,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ])),
                ),
                Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        IconButton(
                            onPressed: () => {
                                  showAboutDialog(
                                      context: context,
                                      applicationName:
                                          "University Ticketing System",
                                      applicationVersion: "v1.0",
                                      children: <Widget>[
                                        const Text(
                                            "terms and conditions go here")
                                      ])
                                },
                            tooltip: "Terms & Conditions",
                            icon: const Icon(FontAwesomeIcons.terminal),
                            color: Color(0xFFc8b8db)),
                        SocialIcon(
                          icon: Icon(FontAwesomeIcons.googlePlay),
                          url: "https://www.google.com/",
                          tooltip: "Play Store",
                        ),
                        SocialIcon(
                          icon: Icon(
                            FontAwesomeIcons.appStoreIos,
                          ),
                          url: "https://www.apple.com/",
                          tooltip: "App Store",
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
