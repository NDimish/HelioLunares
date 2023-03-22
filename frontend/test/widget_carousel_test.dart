import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/widget_carousel.dart';

//These sets of tests are for the widget carousel which has been discarded in the responsive
//version of the startup screen.
void main() {
  group("Josh Widget Carousel Tests", () {
    testWidgets(
        "Test widget carousel renders on page and correctly transitions between widgets",
        (tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
              body: WidgetCarousel(
        transitionTime: 10,
        children: [Text("widget1"), Text("widget2"), Text("widget3")],
      ))));

      //Every ten seconds, a new children should appear while the others are not visible
      final carouselFinder = find.byType(WidgetCarousel);
      expect(carouselFinder, findsOneWidget);

      expect(find.text("widget1").hitTestable(), findsOneWidget);
      expect(find.text("widget2").hitTestable(), findsNothing);
      expect(find.text("widget3").hitTestable(), findsNothing);

      //By waiting for a period of time longer than the transition time of the widget,
      //ample time is allowed for a new widget to appear as well as the fade animation
      //to finish
      await tester.pump(const Duration(seconds: 12));

      expect(find.text("widget1").hitTestable(), findsNothing);
      expect(find.text("widget2").hitTestable(), findsOneWidget);
      expect(find.text("widget3").hitTestable(), findsNothing);

      await tester.pump(const Duration(seconds: 12));

      expect(find.text("widget1").hitTestable(), findsNothing);
      expect(find.text("widget2").hitTestable(), findsNothing);
      expect(find.text("widget3").hitTestable(), findsOneWidget);

      //Carousel should loop back to beginning once all children have been exhausted

      await tester.pump(const Duration(seconds: 10));

      expect(find.text("widget1").hitTestable(), findsOneWidget);
      expect(find.text("widget2").hitTestable(), findsNothing);
      expect(find.text("widget3").hitTestable(), findsNothing);

      await tester.pumpAndSettle(const Duration(seconds: 2));
    });
  });
}
