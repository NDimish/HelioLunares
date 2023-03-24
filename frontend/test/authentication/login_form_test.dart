import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/authentication/log_in/log_in_form.dart';
import 'package:university_ticketing_system/submit_button.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  group("Josh Login form tests", () {
    binding.window.physicalSizeTestValue = const Size(1920, 1080);
    binding.window.devicePixelRatioTestValue = 1.0;
    testWidgets('Login form renders correct fields and submitButton',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
        body: LogInForm(),
      )));

      final textFormFieldFinder = find.byType(TextFormField);
      final submitButtonFieldFinder = find.byType(SubmitButton);

      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(textFormFieldFinder, findsNWidgets(2));
      expect(submitButtonFieldFinder, findsOneWidget);

      await tester.pump(const Duration(seconds: 1));
    });

    testWidgets('Login form does not submit on empty inputs', (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
        body: LogInForm(),
      )));

      final textFormFieldFinder = find.byType(TextFormField);
      final submitButtonFieldFinder = find.byType(SubmitButton);

      expect(find.byType(Image), findsOneWidget);
      expect(textFormFieldFinder, findsNWidgets(2));
      expect(submitButtonFieldFinder, findsOneWidget);

      await tester.tap(submitButtonFieldFinder);
      await tester.pump(const Duration(seconds: 10));

      final passwordFieldFinder = find.byKey(const Key("Password"));
      final passwordValidatorFinder = find.text("Please enter your password.");

      final emailFieldFinder = find.byKey(const Key("Email"));
      final emailValidatorFinder = find.text("Please enter your email.");

      final emailValidation =
          find.descendant(of: emailFieldFinder, matching: emailValidatorFinder);

      final passwordValidation = find.descendant(
          of: passwordFieldFinder, matching: passwordValidatorFinder);
      expect(emailValidation, findsOneWidget);
      expect(passwordValidation, findsOneWidget);

      await tester.pump(const Duration(seconds: 1));
    });

    testWidgets('Login form allows you to switch between visible password',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
        body: LogInForm(),
      )));

      final passwordFinder = find.descendant(
          of: find.byKey(const Key("Password")),
          matching: find.byType(TextField));
      final passwordField = tester.firstWidget<TextField>(passwordFinder);

      final passwordButtonFinder = find.byKey(const Key("PasswordVis"));

      expect(passwordField.obscureText, isTrue);

      await tester.tap(passwordButtonFinder);
      await tester.pump(const Duration(seconds: 10));
      final passwordFieldNonObscure =
          tester.firstWidget<TextField>(passwordFinder);

      expect(passwordFieldNonObscure.obscureText, isFalse);

      await tester.pump(const Duration(seconds: 1));
    });

    testWidgets('Login form does not submit on invalid email', (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
        body: LogInForm(),
      )));

      final textFormFieldFinder = find.byType(TextFormField);
      final submitButtonFieldFinder = find.byType(SubmitButton);

      expect(find.byType(Image), findsOneWidget);
      expect(textFormFieldFinder, findsNWidgets(2));
      expect(submitButtonFieldFinder, findsOneWidget);

      await tester.enterText(find.byKey(const Key("Email")), "invalid");
      await tester.pump(const Duration(seconds: 10));

      await tester.tap(submitButtonFieldFinder);
      await tester.pump(const Duration(seconds: 10));

      final emailValidatorFinder = find.text("This email is not valid.");

      final emailValidation = find.descendant(
          of: find.byKey(const Key("Email")), matching: emailValidatorFinder);

      expect(emailValidation, findsOneWidget);

      await tester.pump(const Duration(seconds: 1));
    });

    testWidgets('Login form does not submit on invalid password',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
        body: LogInForm(),
      )));

      final textFormFieldFinder = find.byType(TextFormField);
      final submitButtonFieldFinder = find.byType(SubmitButton);

      expect(find.byType(Image), findsOneWidget);
      expect(textFormFieldFinder, findsNWidgets(2));
      expect(submitButtonFieldFinder, findsOneWidget);

      await tester.enterText(find.byKey(const Key("Password")), "invalid");
      await tester.pump(const Duration(seconds: 10));

      await tester.tap(submitButtonFieldFinder);
      await tester.pump(const Duration(seconds: 10));

      final passwordValidatorFinder = find.text(
          "Enter a valid password: \n At least - 1 uppercase, 1 lowercase, 1 number, 1 special character\n At least 8 characters long");

      final passwordValidation = find.descendant(
          of: find.byKey(const Key("Password")),
          matching: passwordValidatorFinder);

      expect(passwordValidation, findsOneWidget);

      await tester.pump(const Duration(seconds: 1));
    });

    testWidgets('Contact form does not submit on empty inputs', (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
        body: LogInForm(),
      )));

      final textFormFieldFinder = find.byType(TextFormField);
      final submitButtonFieldFinder = find.byType(SubmitButton);

      expect(find.byType(Image), findsOneWidget);
      expect(textFormFieldFinder, findsNWidgets(2));
      expect(submitButtonFieldFinder, findsOneWidget);

      await tester.tap(submitButtonFieldFinder);
      await tester.pump(const Duration(seconds: 10));

      final passwordFieldFinder = find.byKey(const Key("Password"));
      final passwordValidatorFinder = find.text("Please enter your password.");

      final emailFieldFinder = find.byKey(const Key("Email"));
      final emailValidatorFinder = find.text("Please enter your email.");

      final emailValidation =
          find.descendant(of: emailFieldFinder, matching: emailValidatorFinder);

      final passwordValidation = find.descendant(
          of: passwordFieldFinder, matching: passwordValidatorFinder);
      expect(emailValidation, findsOneWidget);
      expect(passwordValidation, findsOneWidget);

      await tester.pump(const Duration(seconds: 1));
    });
  });
}
