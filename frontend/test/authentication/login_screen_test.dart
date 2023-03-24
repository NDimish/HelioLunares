import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/authentication/log_in/log_in_form.dart';
import 'package:university_ticketing_system/authentication/log_in/log_in_screen.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  group("Josh login screen tests", () {
    testWidgets("Login screen renders correctly on small screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(400, 600);
      binding.window.devicePixelRatioTestValue = 1.0;
      addTearDown(binding.window.clearPhysicalSizeTestValue);
      await tester
          .pumpWidget(const MaterialApp(home: Scaffold(body: LogInScreen())));

      expect(find.byType(LogInForm), findsOneWidget);
      expect(find.byType(PreferredSize), findsNothing);
      await tester.pump(const Duration(seconds: 1));
    });
    testWidgets("Login screen renders correctly on large screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(1920, 1080);
      binding.window.devicePixelRatioTestValue = 1.0;
      addTearDown(binding.window.clearPhysicalSizeTestValue);
      await tester
          .pumpWidget(const MaterialApp(home: Scaffold(body: LogInScreen())));

      expect(find.byType(LogInForm), findsOneWidget);

      expect(find.byType(PreferredSize).hitTestable(), findsNWidgets(2));
      await tester.pump(const Duration(seconds: 1));
    });
  });
}
