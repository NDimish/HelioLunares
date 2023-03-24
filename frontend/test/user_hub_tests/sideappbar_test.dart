import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/user_hub/widgets/SideAppBarWidgets/SideAppBar.dart';


void main(){
  testWidgets("SideAppBar test", 
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home:Scaffold(
            body: SideAppBar(),
          )
        )
      );

      final yummy = find.byType(SideAppBar);

      expect(yummy, findsOneWidget);
    });
}