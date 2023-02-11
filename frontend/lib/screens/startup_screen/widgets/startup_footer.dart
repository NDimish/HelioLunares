import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
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
          color: Colors.blueGrey,
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
                            onPressed: () async => await launchUrl(
                                Uri.parse("https://github.com/")),
                            tooltip: "Terms & Conditions",
                            icon: const Icon(CupertinoIcons.doc),
                            color: Colors.white),
                        IconButton(
                          onPressed: () => {
                            showLicensePage(
                                context: context,
                                applicationName: "University Ticketing System",
                                applicationVersion: "v1.0")
                          },
                          tooltip: "Licenses",
                          icon: const Icon(Icons.code),
                          color: Colors.white,
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
