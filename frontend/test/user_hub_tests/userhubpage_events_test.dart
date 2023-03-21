import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/user_hub/widgets/UserHubPage_events.dart';
import 'dart:io';
void main(){
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() => {HttpOverrides.global = null,});
  binding.window.physicalSizeTestValue = const Size(1920, 1080);
  testWidgets("UserHubPage_events test", 
  (tester)async{
    await tester.pumpWidget(
      MaterialApp(
        home: UserHubPage_events()
      )
    );

    final finder = find.byType(UserHubPage_events);
    expect(finder, findsOneWidget);
  });
}