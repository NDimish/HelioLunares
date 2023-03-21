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

      expect(find.text('Account'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
      expect(find.text('Student'), findsOneWidget);

      expect(find.text('First Name'), findsOneWidget);
      expect(find.text('Enter your first name'), findsOneWidget);
      expect(find.byIcon(Icons.person), findsNWidgets(2));

      expect(find.text('Last Name'), findsOneWidget);
      expect(find.text('Enter your last name'), findsOneWidget);

      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Enter your password'), findsOneWidget);
      expect(find.byIcon(Icons.password), findsOneWidget);

      expect(find.text('Personal Information'), findsOneWidget);
      expect(find.text('Email Address'), findsOneWidget);
      expect(find.text('Enter your email'), findsOneWidget);
      expect(find.byIcon(Icons.email), findsOneWidget);

      expect(find.text('Phone Number'), findsOneWidget);
      expect(find.text('Enter your phone number'), findsOneWidget);
      expect(find.byIcon(Icons.phone), findsOneWidget);

      expect(find.text('University'), findsOneWidget);
      expect(find.text('Enter your university'), findsOneWidget);
      expect(find.byIcon(Icons.school), findsOneWidget);

      expect(find.text('Save'), findsOneWidget);


      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
  });
}