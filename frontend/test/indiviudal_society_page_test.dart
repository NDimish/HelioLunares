import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:university_ticketing_system/user_hub/widgets/EventsList/widgets/IndividualPageHeader.dart';

import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/IndividualSocietyPage.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/widgets/SocietyButton.dart';


void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  group('Society Settings page tests', () {
    binding.window.physicalSizeTestValue = const Size(1920, 1080);
    binding.window.devicePixelRatioTestValue = 1.0;

    testWidgets("Test widgets render correctly", (tester) async {
      await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: MainSocietyPage(
            societyDescription: 'Isoc is an Islamic Society',
            societyName: 'ISOC',
            socId: 7,
            societyUni: 'Ravensbourne ',
            numberOfFollowers: '17',
          ))));

      expect(find.byType(Card), findsOneWidget);


      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
  });
}