import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/widgets/SocietyBanner.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() => {HttpOverrides.global = null});
  group("Josh Society Banner test", () {
    testWidgets("Test widget renders correct image type", (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
              body: SocietyBanner(
                  imageLink:
                      "https://avatars.githubusercontent.com/u/32419965?v=4"))));

      expect(find.byType(Image), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });

    testWidgets("Test widget displays correct size on small screens",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(400, 400);
      addTearDown(binding.window.clearPhysicalSizeTestValue);
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
              body: SocietyBanner(
                  imageLink:
                      "https://avatars.githubusercontent.com/u/32419965?v=4"))));

      final foundImage = find.byType(Image).evaluate().first.widget as Image;

      //To avoid overflows, the size of the image on small screens is fixed to 250.
      expect(foundImage.width, equals(250));
      expect(foundImage.height, equals(250));

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });

    testWidgets("Test widget displays scales in proportion to large screens",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(1920, 1080);
      binding.window.devicePixelRatioTestValue = 1.0;
      addTearDown(binding.window.clearPhysicalSizeTestValue);
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
              body: SocietyBanner(
                  imageLink:
                      "https://avatars.githubusercontent.com/u/32419965?v=4"))));

      final foundImage = find.byType(Image).evaluate().first.widget as Image;

      //On larger screens, the banner should scale based on screen width/height.
      expect(foundImage.width, equals(1920 / 3.5));
      expect(foundImage.height, equals(1080 / 4));

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
  });
}
