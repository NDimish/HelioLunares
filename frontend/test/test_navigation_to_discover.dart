import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/main.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  binding.window.physicalSizeTestValue = const Size(1000, 1000);
  binding.window.devicePixelRatioTestValue = 1.0;

  group('end-to-end test', () {
    testWidgets('tap on the button, verify count', (WidgetTester tester) async {
      // var app = const MaterialApp(
      //     home: Scaffold(
      //   appBar: PreferredSize(
      //       child: TopBarContents(), preferredSize: Size(1000, 1000)),
      // ));
      var app = const UniversityTicketingApp();
      await tester.pumpFrames(app, const Duration(seconds: 2));
      final inkw = find.widgetWithText(InkWell, "Log In");
      expect(inkw, findsOneWidget);
      await tester.tap(inkw);
      await tester.pumpFrames(app, const Duration(seconds: 2));
      final count_1 = find.text("Welcome Back!");
      expect(count_1, findsOneWidget);
    });
  });
}
