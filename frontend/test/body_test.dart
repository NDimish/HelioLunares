import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Home Page Content', (WidgetTester tester) async {
    binding.window.physicalSizeTestValue = const Size(1000, 1000);
    binding.window.devicePixelRatioTestValue = 1.0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
            body: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                child: const Text("A"))),
      ),
    );

    await tester.pumpAndSettle();
    expect(
      find.widgetWithText(AnimatedContainer, "A"),
      findsOneWidget,
    );
  });
}
