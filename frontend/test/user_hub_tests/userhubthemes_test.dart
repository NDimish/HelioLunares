import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/user_hub/widgets/ThemeDataWidgets/UserHubTheme.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
          appBar: AppBar(
              iconTheme: MainAppBarTheme(),
              titleTextStyle: MainAppBarTextTheme(),
            ),
          )
        );
  }
}

void main(){
  testWidgets(
    "UserHubTheme", 
    (tester) async{
      await tester.pumpWidget(
        MyWidget()
      );

      final BuildContext context = tester.element(find.byType(MaterialApp));
      final AppBar app = tester.firstWidget(find.byType(AppBar));
      final iTheme = app.iconTheme;
      final textstyle = app.titleTextStyle;      

      final themeF = MainAppBarTheme();
      final textthemeF = MainAppBarTextTheme();

      expect(themeF, equals(iTheme));
      expect(textthemeF, equals(textstyle));




    });

    
}