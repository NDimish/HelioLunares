import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart';
import 'package:university_ticketing_system/backend_communication/models/Event.dart';
import 'package:university_ticketing_system/backend_communication/models/University.dart';
import 'package:university_ticketing_system/pages/events/widgets/delete_event_confirmation.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  User user = User(
      email: "test@gmail.com",
      userType: 2,
      date_joined: "12/02/20",
      password: "w",
      id: 1);

  University university = University(
      name: "KCL",
      latitude: 0.0,
      longitude: 0.0,
      street_name: "test street",
      postcode: "postcode");
  Society society = Society(
      created_at: '12/02/20',
      description: "test description",
      image: "img",
      join_date: "12/02/20",
      name: "Test Society",
      university: university,
      user: user);

  //Create a test event to pass
  Event eventMaker() {
    return Event(
        attendance: 0,
        create_time: "13/02/23",
        date: "13/04/23",
        description: "desc",
        duration: 90,
        price: 5.0,
        society: society,
        time: "08:50",
        title: "Event",
        update_time: "19/03/23",
        venue: "venue",
        id: 0);
  }

  group("Delete Event Confirmation Dialog Box Tests", () {
    binding.window.physicalSizeTestValue = const Size(1920, 1080);
    binding.window.devicePixelRatioTestValue = 1.0;

    testWidgets("Dialog box opens and displays correct buttons",
        (tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(body: Builder(builder: (BuildContext context) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          var actual = DeleteEventConfirmation(event: eventMaker())
              .showAlertDialog(context);
        });
        return Placeholder();
      }))));

      final buttonFinder = find.byType(ElevatedButton);
      final OKButtonFinder = find.byKey(const Key("OKButton"));
      final cancelButtonFinder = find.byKey(const Key("CancelButton"));
      final okTextFinder = find.text("OK");
      final cancelTextFinder = find.text("Cancel");

      await tester.pumpAndSettle();
      expect(buttonFinder, findsNWidgets(2));
      expect(OKButtonFinder, findsOneWidget);
      expect(cancelButtonFinder, findsOneWidget);
      expect(okTextFinder, findsOneWidget);
      expect(cancelTextFinder, findsOneWidget);
    });

    //Cancel button closes the window
  });

  testWidgets("Cancel button onTap will close the popup dialog",
      (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: Builder(builder: (BuildContext context) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        var actual = DeleteEventConfirmation(event: eventMaker())
            .showAlertDialog(context);
      });
      return Placeholder();
    }))));

    final cancelButtonFinder = find.byKey(const Key("CancelButton"));
    await tester.pumpAndSettle();
    expect(cancelButtonFinder, findsOneWidget);
    await tester.tap(cancelButtonFinder);
    await tester.pumpAndSettle();
    expect(cancelButtonFinder, findsNothing);
  });

  testWidgets("Dialog box container build", (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: DeleteEventConfirmation(event: eventMaker()))));

    final containerFinder = find.byType(Container);

    await tester.pumpAndSettle();
    expect(containerFinder, findsOneWidget);
  });
}
