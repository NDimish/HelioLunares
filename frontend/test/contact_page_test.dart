import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:university_ticketing_system/home/homepage_screens/contact/contact.dart';
import 'package:university_ticketing_system/home/homepage_screens/contact/contact_form.dart';

void main() {
//Contact page simply houses the contact form!
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  group("Josh & Israfeel contact page tests", () {
    testWidgets("Contact page renders correctly on small screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(400, 600);
      binding.window.devicePixelRatioTestValue = 1.0;
      addTearDown(binding.window.clearPhysicalSizeTestValue);
      await tester
          .pumpWidget(const MaterialApp(home: Scaffold(body: ContactScreen())));

      //On a smaller screen, the larger navbar contents are not shown on this screen.
      expect(find.byType(ContactForm), findsOneWidget);
      expect(find.byType(PreferredSize), findsNothing);
      await tester.pump(const Duration(seconds: 1));
    });
    testWidgets("Contact page renders correctly on large screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(1920, 1080);
      binding.window.devicePixelRatioTestValue = 1.0;
      addTearDown(binding.window.clearPhysicalSizeTestValue);
      await tester
          .pumpWidget(const MaterialApp(home: Scaffold(body: ContactScreen())));

      //On a smaller screen, the larger navbar contents are not shown on this screen.
      expect(find.byType(ContactForm), findsOneWidget);
      //2 preferred sizes come from the preferred size defined in the contact screen PLUS the
      //preferred size of the navbar.
      expect(find.byType(PreferredSize).hitTestable(), findsNWidgets(2));
      await tester.pump(const Duration(seconds: 1));
    });
  });
}
