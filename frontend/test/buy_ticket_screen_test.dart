import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/widget_carousel.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/bought_tickets/buy_ticket_screen.dart';
import '../lib/user_hub/widgets/AppBarWidgets/bought_tickets/user_bought_ticket_screen.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/bought_tickets/user_bought_ticket_screen.dart';
import 'package:university_ticketing_system/backend_communication/authenticate.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart' as data;
import 'package:university_ticketing_system/backend_communication/models/Ticket.dart' as tic;
import 'package:university_ticketing_system/backend_communication/models/all.dart';




void main() {
  
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("All headers exists", (tester) async {
    
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: UserBoughtTicketScreen()
      )
    ));

    // final overview = find.text("Ticket Overview");
    final title = find.text("Title:");
    final date = find.text("Date:");
    final venue = find.text("Venue:");
    final description = find.text("Description:");
    final price = find.text("Price:");
    
    // expect(overview, findsOneWidget);
    expect(title, findsOneWidget);
    expect(date, findsOneWidget);
    expect(venue, findsOneWidget);
    expect(description, findsOneWidget);
    expect(price, findsOneWidget);

  });

  testWidgets('Back button brings you to user buy ticket screen', (tester) async{
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: BuyTicketScreen(id: 0,)
      )
    ));

    final backButton = find.byKey(ValueKey('navigate'));
    
    expect(backButton, findsOneWidget);
    
    await tester.tap(backButton);
    await tester.pumpAndSettle();

    final lookfor = find.text("Expired Ticket(s)");

    expect(lookfor, findsOneWidget);


  });

  testWidgets('Displays message when there is no upcoming tickets', (tester) async{
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: BuyTicketScreen(id: 0,)
      )
    ));
    

    

  });

  testWidgets('Displays message when there is no upcoming tickets', (tester) async{
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: BuyTicketScreen(id: 0,)
      )
    ));
    
    
  });


  
  







}