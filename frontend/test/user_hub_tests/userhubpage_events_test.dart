import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/bought_tickets/user_bought_ticket_screen.dart';
import 'package:university_ticketing_system/user_hub/widgets/SearchBarWidgets/CustomSearchBar.dart';
import 'package:university_ticketing_system/user_hub/widgets/UserHubPage_events.dart';
import 'dart:io';
void main(){
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() => {HttpOverrides.global = null,});
  binding.window.physicalSizeTestValue = const Size(1920, 1080);
  testWidgets("UserHubPage_events type test", 
  (tester)async{
    await tester.pumpWidget(
      MaterialApp(
        home: UserHubPage_events()
      )
    );
    await tester.pumpAndSettle();

    final finder = find.byType(UserHubPage_events);
    expect(finder, findsOneWidget);
  });

  testWidgets("UserHubPage_events searchbar test", 
  (tester)async{
    await tester.pumpWidget(
      MaterialApp(
        home: UserHubPage_events()
      )
    );
    

    final finder = find.byType(CustomSearchBar);
    await tester.enterText(finder, "test");
    await tester.pumpAndSettle();
    expect(finder, findsOneWidget);
  });



// This test will fail due to RenderFlex issue on 
// UserBoughtTicketScreen()
// Too bad! Not my problem
  testWidgets("UserHubPage_events ViewTicketsButton test", 
  (tester)async{
    await tester.pumpWidget(
      MaterialApp(
        home: UserHubPage_events()
      )
    );
    

    final finder = find.byKey(Key("ViewTicketsButton"));
    await tester.tap(finder);
    await tester.pumpAndSettle();
  });

// Also fails for same reason as above - not my pages, not my problem
  testWidgets("UserHubPage_events SettingsButton test", 
  (tester)async{
    await tester.pumpWidget(
      MaterialApp(
        home: UserHubPage_events()
      )
    );
    

    final finder = find.byKey(Key("SettingsButton"));
    await tester.tap(finder);
    await tester.pumpAndSettle();
  });

}