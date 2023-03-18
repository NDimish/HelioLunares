import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/home/topbar.dart';
//Currently the size is fixed at 800 x 600,
//which makes it impossible to test behavior that happens only in portrait mode, as well as other size-dependent behavior.

//Just wrap the widget under test in a SizedBox (contained in a Center) with the given size. Optionally add a MediaQuery in there too if that matters.

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('shows topbar', (WidgetTester tester) async {
    binding.window.physicalSizeTestValue = const Size(1000, 1000);
    binding.window.devicePixelRatioTestValue = 1.0;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
            key: Key('test'),
            appBar: PreferredSize(
                preferredSize: Size(1000, 1000), child: TopBarContents())),
      ),
    );

    await tester.pumpAndSettle();
    expect(
      find.widgetWithText(InkWell, "University Ticketing System"),
      findsOneWidget,
    );
    expect(
      find.widgetWithText(InkWell, "Discover"),
      findsOneWidget,
    );
    expect(
      find.widgetWithText(InkWell, "Contact Us"),
      findsOneWidget,
    );
    expect(
      find.widgetWithText(InkWell, "Log In"),
      findsOneWidget,
    );
    expect(
      find.widgetWithText(InkWell, "Sign Up"),
      findsOneWidget,
    );
  });
}
