import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/user_hub/widgets/SearchBarWidgets/CustomSearchBar.dart';

void main(){
  TextEditingController testcontrol = new TextEditingController();
  testWidgets("CustomSearchBar test",
  (tester)async{
    await tester.pumpWidget(MaterialApp(
      home:Scaffold(
        body: CustomSearchBar((p0){}, (){}, testcontrol, "TEST")
      )
    ));
    final widgetFinder = find.byType(CustomSearchBar);

    expect(widgetFinder, findsOneWidget);
  });
}