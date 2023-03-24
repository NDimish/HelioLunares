import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/constants/style.dart';
import 'package:university_ticketing_system/controllers/navigation_controller.dart';
import 'package:university_ticketing_system/controllers/side_menu_controller.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';
import 'package:university_ticketing_system/controllers/menu_controller.dart'
    as menu;
import 'package:university_ticketing_system/widgets/horizontal_menu_item.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  // Initialize GetX controllers and provide them to GetMaterialApp

  Get.put(menu.MenuController());
  Get.put(NavigationController());
  Get.put(menu.MenuController());
  Get.put(SideMenuController());

  testWidgets('HorizontalMenuItem displays itemName ',
      (WidgetTester tester) async {
    // Wrap the widget to test in a MaterialApp with a scaffold
    await tester.pumpWidget(
      Builder(
        builder: (BuildContext context) {
          return GetMaterialApp(
            home: Scaffold(
              body: HorizontalMenuItem(
                itemName: 'Test Item',
                onTap: () {},
              ),
            ),
          );
        },
      ),
    );

    // Verify that the widget displays the item name
    expect(find.text('Test Item'), findsOneWidget);
  });
}
