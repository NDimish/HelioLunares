import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/log_in/widgets/submit_button.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/contact_form.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/contact_submit.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/startup_navbar.dart';

//flutter run -d chrome --web-port 2021 test/contact_form_test.dart
void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  group("Josh Contact Form Tests", () {
    testWidgets('Contact form renders correct fields and submitButton',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
        body: ContactForm(),
      )));

//Should have four fields and one submit button in total.
      final textFormFieldFinder = find.byType(TextFormField);
      final dropdownFieldFinder = find.byType(DropdownButtonFormField);
      final submitButtonFieldFinder = find.byType(ContactSubmit);

      expect(textFormFieldFinder, findsNWidgets(3));
      expect(dropdownFieldFinder, findsOneWidget);
      expect(submitButtonFieldFinder, findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });

    testWidgets('Contact form does not submit on empty input', (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
        body: ContactForm(),
      )));
      final submitButtonFieldFinder = find.byType(ContactSubmit);

      final contactName = find.byKey(const Key("ContactName"));
      final contactEmail = find.byKey(const Key("ContactEmail"));
      final contactMessage = find.byKey(const Key("ContactMessage"));

      expect(submitButtonFieldFinder, findsOneWidget);
      expect(contactName, findsOneWidget);
      expect(contactEmail, findsOneWidget);
      expect(contactMessage, findsOneWidget);

      await tester.tap(submitButtonFieldFinder);
      await tester.pumpAndSettle(const Duration(seconds: 1));

//After clicking the button there should be an overlay thanking the user.
      final submitMessageOverlay = find.byType(AlertDialog);
      final acknowledgementButton = find.text("OK");

      expect(submitMessageOverlay, findsNothing);
      expect(acknowledgementButton, findsNothing);

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
  });
}
