import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/userSettingsPage/user_settings.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  group('User Settings page tests', () {
    binding.window.physicalSizeTestValue = const Size(1920, 1080);
    binding.window.devicePixelRatioTestValue = 1.0;

    testWidgets("Test widgets render correctly", (tester) async {
      await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: UserSettingsPage())));

      expect(find.byType(TextFormField), findsNWidgets(6));
      expect(find.text("Profile"), findsOneWidget);
      expect(find.text("Account"), findsOneWidget);
      expect(find.text("Personal Information"), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
  });
}
