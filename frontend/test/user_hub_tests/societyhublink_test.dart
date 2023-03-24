import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/SocietyHubLink.dart';
import 'dart:io';
void main(){
  setUpAll(() => {HttpOverrides.global = null,});
  testWidgets("SocietyHubLink redirect test", 
  (tester)async{
    await tester.pumpWidget(
      MaterialApp(
          home:Scaffold(
            body: Center(child:SocietyHubLink()), 
          )
        )
    );
    await tester.pumpAndSettle();

    final visfinder = find.byType(SocietyHubLink);
    await tester.tap(visfinder);
    await tester.pumpAndSettle();
    expect(find.byType(Scaffold), findsOneWidget);
    
  });
}