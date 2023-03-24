import 'package:flutter/material.dart';
import 'package:university_ticketing_system/widgets/circle_icon.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  Icon icon = Icon(Icons.airplane_ticket);

  binding.window.physicalSizeTestValue = const Size(1920, 1080);
  binding.window.devicePixelRatioTestValue = 1.0;

  testWidgets("Circle icon is shown correctly", (WidgetTester tester) async {
    // Set up widget tree
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: Container(
                child: CircleIcon(
                  icon: Icon(Icons.airplane_ticket),
                  backgroundColor: Colors.black,
                  radius: 8,
                ),
              ),
            );
          },
        ),
      ),
    );

    // Verify layout is correct
    final iconFinder = find.byIcon(Icons.airplane_ticket);
    expect(iconFinder, findsOneWidget);

    // Verify background color and radius are correct
    final circleIconWidget = tester.widget<CircleIcon>(find.byType(CircleIcon));
    expect(circleIconWidget.backgroundColor, equals(Colors.black));
    expect(circleIconWidget.radius, equals(8));
  });
}
