import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/home/home_drawer.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  group("Josh home drawer tests", () {
    setUpAll(() => {
          HttpOverrides.global = null,
        });
    testWidgets("Home drawer renders correct buttons and text", (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
        body: HomeScreenDrawer(),
      )));

      expect(find.byType(Divider), findsNWidgets(2));
      expect(find.text("About"), findsOneWidget);
      expect(find.text("Home"), findsOneWidget);
      expect(find.text("Discover"), findsOneWidget);
      expect(find.text("Contact Us"), findsOneWidget);

      expect(find.text("Log In"), findsOneWidget);
      expect(find.text("Sign Up As A Student"), findsOneWidget);
      expect(find.text("Sign Up As A Society"), findsOneWidget);

      await tester.pump(const Duration(seconds: 1));
    });

    testWidgets("Clicking home on home drawer renders route correctly",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(1920, 1080);
      binding.window.devicePixelRatioTestValue = 1.0;
      addTearDown(binding.window.clearPhysicalSizeTestValue);
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          navigatorObservers: [mockObserver],
          home: const Scaffold(body: HomeScreenDrawer())));

      await tester.tap(find.byKey(const Key("HomeDraw")));
      await tester.pump(const Duration(seconds: 30));

      verify(mockObserver.didReplace(
          oldRoute: anyNamed('oldRoute'), newRoute: anyNamed('newRoute')));

      await tester.pump(const Duration(seconds: 1));
    });

    testWidgets("Clicking about on home drawer renders route correctly",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(1920, 1080);
      binding.window.devicePixelRatioTestValue = 1.0;
      addTearDown(binding.window.clearPhysicalSizeTestValue);
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          navigatorObservers: [mockObserver],
          home: const Scaffold(body: HomeScreenDrawer())));

      await tester.tap(find.byKey(const Key("AboutDraw")));
      await tester.pump(const Duration(seconds: 30));

      verify(mockObserver.didReplace(
          oldRoute: anyNamed('oldRoute'), newRoute: anyNamed('newRoute')));

      await tester.pump(const Duration(seconds: 1));
    });

    testWidgets("Clicking discover on home drawer renders route correctly",
        (tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          navigatorObservers: [mockObserver],
          home: const Scaffold(body: HomeScreenDrawer())));

      await tester.tap(find.byKey(const Key("DiscoverDraw")));
      await tester.pump(const Duration(seconds: 30));

      verify(mockObserver.didReplace(
          oldRoute: anyNamed('oldRoute'), newRoute: anyNamed('newRoute')));

      await tester.pump(const Duration(seconds: 1));
    });
    testWidgets("Clicking contact on home drawer renders route correctly",
        (tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          navigatorObservers: [mockObserver],
          home: const Scaffold(body: HomeScreenDrawer())));

      await tester.tap(find.byKey(const Key("ContactDraw")));
      await tester.pump(const Duration(seconds: 30));

      verify(mockObserver.didReplace(
          oldRoute: anyNamed('oldRoute'), newRoute: anyNamed('newRoute')));

      await tester.pump(const Duration(seconds: 1));
    });

    testWidgets("Clicking login on home drawer renders route correctly",
        (tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          navigatorObservers: [mockObserver],
          home: const Scaffold(body: HomeScreenDrawer())));

      await tester.tap(find.byKey(const Key("LoginDraw")));
      await tester.pump(const Duration(seconds: 30));

      verify(mockObserver.didReplace(
          oldRoute: anyNamed('oldRoute'), newRoute: anyNamed('newRoute')));

      await tester.pump(const Duration(seconds: 1));
    });

    testWidgets(
        "Clicking society signup on home drawer renders route correctly",
        (tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          navigatorObservers: [mockObserver],
          home: const Scaffold(body: HomeScreenDrawer())));

      await tester.tap(find.byKey(const Key("SocDraw")));
      await tester.pump(const Duration(seconds: 30));

      verify(mockObserver.didReplace(
          oldRoute: anyNamed('oldRoute'), newRoute: anyNamed('newRoute')));

      await tester.pump(const Duration(seconds: 1));
    });

    testWidgets(
        "Clicking student signup on home drawer renders route correctly",
        (tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          navigatorObservers: [mockObserver],
          home: const Scaffold(body: HomeScreenDrawer())));

      await tester.tap(find.byKey(const Key("StuDraw")));
      await tester.pump(const Duration(seconds: 30));

      verify(mockObserver.didReplace(
          oldRoute: anyNamed('oldRoute'), newRoute: anyNamed('newRoute')));

      await tester.pump(const Duration(seconds: 1));
    });
  });
}
