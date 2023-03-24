import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/home/homepage_screens/contact/contact_form.dart';
import 'package:university_ticketing_system/submit_button.dart';

//flutter run -d chrome --web-port 2021 test/contact_form_test.dart
void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.

  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  group("Josh Contact Form Tests", () {
    binding.window.physicalSizeTestValue = const Size(1920, 1080);
    binding.window.devicePixelRatioTestValue = 1.0;
    testWidgets('Contact form renders correct fields and submitButton',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
        body: ContactForm(),
      )));

//Should have four fields and one submit button in total.
      final textFormFieldFinder = find.byType(TextFormField);
      final dropdownFieldFinder = find.byKey(const Key("DropdownButton"));
      final submitButtonFieldFinder = find.byType(SubmitButton);

      expect(textFormFieldFinder, findsNWidgets(3));
      expect(dropdownFieldFinder, findsOneWidget);
      expect(submitButtonFieldFinder, findsOneWidget);

      await tester.pump(const Duration(seconds: 1));
    });

    testWidgets('Contact form does not submit on empty input', (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
        body: ContactForm(),
      )));
      final submitButtonFieldFinder = find.byType(SubmitButton);

      final contactName = find.byKey(const Key("ContactName"));
      final contactEmail = find.byKey(const Key("ContactEmail"));
      final contactMessage = find.byKey(const Key("ContactMessage"));

      expect(submitButtonFieldFinder, findsOneWidget);
      expect(contactName, findsOneWidget);
      expect(contactEmail, findsOneWidget);
      expect(contactMessage, findsOneWidget);

      await tester.tap(submitButtonFieldFinder);
      await tester.pump(const Duration(seconds: 5));

      expect(find.text("Please enter your email."), findsOneWidget);

      await tester.pump(const Duration(seconds: 1));
    });
  });
}
