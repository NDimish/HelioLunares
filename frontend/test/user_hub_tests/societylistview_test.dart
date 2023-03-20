import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/SocietyListTile.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/SocietyListView.dart';

void main(){
  group("SocietyListView tests", () { 
    testWidgets("SocietyListView is of type EventListView", (tester) async{
      await tester.pumpWidget(MaterialApp(
        home:Scaffold(
          body: SocietyListView()
        )
      ));
      final typeFinder = find.byType(SocietyListView);

      expect(typeFinder, findsOneWidget);
    });
    testWidgets("SocietyListView has child of SocietyListTile type", (tester) async{
      await tester.pumpWidget(MaterialApp(
        home:Scaffold(
          body:SocietyListView()
        )
      ));
      final childFinder = find.byType(SocietyListTile);

      expect(childFinder, findsWidgets);
    });
  });
  
}