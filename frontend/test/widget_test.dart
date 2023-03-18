// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/home/home_drawer.dart';
import 'package:university_ticketing_system/home/topbar.dart';

import 'package:university_ticketing_system/submit_button.dart';

void a() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  group("Josh Submit Button Test", () {
    testWidgets(
        'Submit button renders correctly and produces correct callback result',
        (tester) async {
      int buttonPress = 0;
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
        body: SubmitButton(
          onPressed: () => buttonPress++,
          textIn: "Submit",
          scaleFactor: 0.5,
        ),
      )));

      final submitFinder = find.text("Submit");

      expect(submitFinder, findsOneWidget);
      expect(buttonPress, 0);

      await tester.tap(submitFinder);
      await tester.pump();
      expect(buttonPress, isNot(0));
      expect(buttonPress, 1);

      await tester.tap(submitFinder);
      await tester.pump();

      expect(buttonPress, isNot(0));
      expect(buttonPress, isNot(1));
      expect(buttonPress, 2);

      await tester.pumpAndSettle(const Duration(seconds: 2));
    });
  });

  //a();
}

void showDrawer() {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  testWidgets('shows drawer', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
              child: Text(
            'test',
            key: Key('test'),
          )),
        ),
      ),
    );
    _scaffoldKey.currentState!.openDrawer();
    await tester.pumpAndSettle();
    expect(
      find.byKey(const Key('test'), skipOffstage: false),
      findsOneWidget,
    );
  });
}

void test_drawer() {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  testWidgets('Find about tile in drawer', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
            key: _scaffoldKey,
            drawer: HomeScreenDrawer(
                //key: Key('test'),
                )),
      ),
    );
    _scaffoldKey.currentState!.openDrawer();
    await tester.pumpAndSettle();
    expect(
      find.widgetWithText(ListTile, "Home"),
      findsOneWidget,
    );

    expect(
      find.widgetWithText(ListTile, "About"),
      findsOneWidget,
    );

    expect(
      find.widgetWithText(ListTile, "Discover"),
      findsOneWidget,
    );

    expect(
      find.widgetWithText(ListTile, "Contact Us"),
      findsOneWidget,
    );

    expect(
      find.widgetWithText(ListTile, "Log In"),
      findsOneWidget,
    );

    expect(
      find.widgetWithText(ListTile, "Sign Up As A Student"),
      findsOneWidget,
    );

    expect(
      find.widgetWithText(ListTile, "Sign Up As A Society"),
      findsOneWidget,
    );
  });
}

void main() {
  testWidgets('Find topbar contents', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
            appBar: PreferredSize(
          preferredSize: Size(1100, 1000),
          child: TopBarContents(),
        )),
      ),
    );
    await tester.pumpAndSettle();
    expect(
      find.widgetWithText(InkWell, "University Ticketing System"),
      findsOneWidget,
    );
  });
}
