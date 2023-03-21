import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:university_ticketing_system/society_settings/society_settings_page.dart';


void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  group('Society Settings page tests', () {
    binding.window.physicalSizeTestValue = const Size(1920, 1080);
    binding.window.devicePixelRatioTestValue = 1.0;

    testWidgets("Test widgets render correctly", (tester) async {
      await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: SocietySettingsPage(
            userId: 7,
          ))));

      expect(find.text('Account'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
      expect(find.text('Personal Information'), findsOneWidget);
      expect(find.text('Save'), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
  });
}