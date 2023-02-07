import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        child: BottomAppBar(
          elevation: 5,
          child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                      text: "© 2023 Helio Lunares | Coded with ",
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        CupertinoIcons.heart_solid,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(text: " for "),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        Icons.apple,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        Icons.android,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(text: " & "),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        Icons.public,
                        size: 20,
                        color: Colors.black,
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
                            icon: Icon(CupertinoIcons.doc),
                            color: Colors.grey),
                        IconButton(
                          onPressed: () => print("HI"),
                          tooltip: "Licenses",
                          icon: Icon(Icons.code),
                          color: Colors.grey,
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
