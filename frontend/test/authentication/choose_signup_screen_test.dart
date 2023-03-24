import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/authentication/sign_up/choose_sign_up_screen.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  group("Josh choose sign up screen tests", () {
    //Small screen should contain the same widgets as the large screen.
    testWidgets("Choose sign up page renders correctly on small screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(599, 800);
      binding.window.devicePixelRatioTestValue = 1.0;
      addTearDown(binding.window.clearPhysicalSizeTestValue);
      await tester
          .pumpWidget(const MaterialApp(home: Scaffold(body: ChooseSignUp())));

      expect(
          find.byKey(const Key("SmallSignUp")).hitTestable(), findsOneWidget);
      expect(find.byType(Image), findsNWidgets(2));
      expect(find.byType(Divider), findsNWidgets(2));
      expect(find.text("Sign Up As A Student"), findsOneWidget);
      expect(find.text("Join as a student"), findsOneWidget);
      expect(find.text("Sign Up As A Student"), findsOneWidget);
      expect(find.text("Join as a society"), findsOneWidget);
      expect(find.byType(ElevatedButton), findsNWidgets(2));

      await tester.pump(const Duration(seconds: 1));
    });
    testWidgets("Choose sign up page renders correctly on large screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(1920, 1080);
      binding.window.devicePixelRatioTestValue = 1.0;
      addTearDown(binding.window.clearPhysicalSizeTestValue);
      await tester
          .pumpWidget(const MaterialApp(home: Scaffold(body: ChooseSignUp())));

      expect(find.byType(PreferredSize).hitTestable(), findsNWidgets(2));

      expect(
          find.byKey(const Key("LargeSignUp")).hitTestable(), findsOneWidget);
      expect(find.byType(Image), findsNWidgets(2));
      expect(find.byType(Divider), findsNWidgets(2));
      expect(find.text("Sign Up As A Student"), findsOneWidget);
      expect(find.text("Join as a student"), findsOneWidget);
      expect(find.text("Sign Up As A Student"), findsOneWidget);
      expect(find.text("Join as a society"), findsOneWidget);
      expect(find.byType(ElevatedButton), findsNWidgets(2));

      await tester.pump(const Duration(seconds: 1));
    });
  });
}
