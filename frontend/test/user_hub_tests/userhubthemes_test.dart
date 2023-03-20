import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/user_hub/widgets/ThemeDataWidgets/UserHubTheme.dart';

void main(){
  testWidgets(
    "UserHubTheme", 
    (tester) async{
      MaterialApp(
        home:Scaffold(
          appBar: AppBar(
            iconTheme: MainAppBarTheme(),
            titleTextStyle: MainAppBarTextTheme(),
          ),
        )
      );
    });
}