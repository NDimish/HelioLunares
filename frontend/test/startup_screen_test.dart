import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:university_ticketing_system/main.dart';
import 'package:university_ticketing_system/screens/startup_screen/startup_screen.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/social_icons.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/startup_footer.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/startup_navbar.dart';

//A widget test is used to validate the UI
void main() {
  group("Josh Footer Widget Tests", () {
    testWidgets('Startup page footer contains exactly two social buttons test.',
        //The tester could be thought of as the user itself.
        (WidgetTester tester) async {
      // Build an initial startup screen, defaulting to hero page.
      await tester.pumpWidget(const MaterialApp(home: StartupScreen()));

      expect(find.byType(Footer), findsOneWidget);

      expect(find.byType(SocialIcon), findsNWidgets(2));
      expect(find.byIcon(Icons.dialer_sip), findsOneWidget);
    });
  });
}
