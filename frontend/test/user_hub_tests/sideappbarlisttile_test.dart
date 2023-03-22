import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/user_hub/widgets/SideAppBarWidgets/SideAppBarListTile.dart';


void main(){
  testWidgets("SideAppBarListTile test", 
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home:Scaffold(
            body: ListView(
              children: [SideAppBarListTile(iconname: Icons.face, optionName: "Test", input:Scaffold()),],
            )
          )
        )
      );


      final type = find.byType(SideAppBarListTile);
      final SideAppBarListTile grabber = tester.firstWidget(find.byType(SideAppBarListTile));

      await tester.tap(type);
      await tester.pumpAndSettle();
      

      expect(find.byType(Scaffold), findsOneWidget);
    });
}