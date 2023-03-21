import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/user_hub/widgets/SideAppBarWidgets/SideAppBarList.dart';
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home:Scaffold(
            body: SideAppBarList(context),
          )
        );
  }
}

void main(){
  testWidgets("SideAppBarList test", 
    (tester) async {
      await tester.pumpWidget(
        MyWidget()
      );

      final type = find.byType(SideAppBarList);
      final findchild = find.byType(ListTile);

      expect(type, findsOneWidget);
      expect(findchild, findsWidgets);
    });
}