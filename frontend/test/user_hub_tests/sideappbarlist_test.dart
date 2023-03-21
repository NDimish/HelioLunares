import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/user_hub/widgets/SideAppBarWidgets/SideAppBarList.dart';


void main(){
  testWidgets("SideAppBarList test", 
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home:Scaffold(
            body: SideAppBarList(),
          )
        )
      );

      final type = find.byType(SideAppBarList);

      expect(type, findsOneWidget);
    });
}