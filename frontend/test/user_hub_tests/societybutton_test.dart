// This tests the society button under SocietiesList
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/user_hub/widgets/EventsList/EventListTile.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/widgets/SocietyButton.dart';

void main(){
    setUpAll(() => {HttpOverrides.global = null}); 

    // Needs Mockito 
    testWidgets("SocietyButton tap test", 
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home:Scaffold(
            body: SocietyButton(hasJoined: true, socId: 1)
          )
        )
      );

      final widgetFinder = find.byType(SocietyButton);
      
      await tester.tap(widgetFinder);
      await tester.pumpAndSettle();
      
      
    } );
}