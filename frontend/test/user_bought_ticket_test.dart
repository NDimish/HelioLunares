import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/widget_carousel.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/bought_tickets/buy_ticket_screen.dart';
import '../lib/user_hub/widgets/AppBarWidgets/bought_tickets/user_bought_ticket_screen.dart';


void main() {
  
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("All headers exists", (tester) async {
    
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: BuyTicketScreen()
      )
    ));

    final upcoming = find.text("Title");
    final expired = find.text("Expired Ticket(s)");
    
    // expect(overview, findsOneWidget);
    expect(upcoming, findsOneWidget);
    expect(expired, findsOneWidget);

  });

  testWidgets('Expired ticket list expands', (tester) async{
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: UserBoughtTicketScreen()
      )
    ));

    final expanionListButton = find.byType(ExpansionPanelList);
    
    await tester.tap(expanionListButton);

    final ticket = find.byType(Container);

    expect(ticket, findsWidgets);


  });

  testWidgets('Clicking on ticket brings you to another page', (tester) async{
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: UserBoughtTicketScreen()
      )
    ));

    final nextPage = find.byKey(ValueKey('ticket'));
    
    expect(nextPage, findsOneWidget);
    
    await tester.tap(nextPage);
    await tester.pumpAndSettle();

    final lookfor = find.text("Ticket Details");

    expect(lookfor, findsOneWidget);




  });

  
  







}


