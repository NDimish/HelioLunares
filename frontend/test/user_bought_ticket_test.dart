import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/screens/startup_screen/widgets/widget_carousel.dart';
import '../lib/user_hub/widgets/AppBarWidgets/bought_tickets/user_bought_ticket_screen.dart';


void main() {
  
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("All headers exists", (tester) async {
    
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: UserBoughtTicketScreen()
      )
    ));

    final overview = find.text("Ticket Overview");
    final upcoming = find.text("Upcoming Ticket(s)");
    final expired = find.text("Expired Ticket(s)");
    
    expect(overview, findsOneWidget);
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

  // testWidgets('Clicking on ticket brings you to another page', (tester) async{
  //   await tester.pumpWidget(const MaterialApp(
  //     home: Scaffold(
  //       body: UserBoughtTicketScreen()
  //     )
  //   ));

  //   final expanionListButton = find.byType(ExpansionPanelList);
    
  //   await tester.tap(expanionListButton);

  //   final ticket = find.byType(Container);

  //   expect(ticket, findsWidgets);


  // });



  // write test to show that fields of ticket overview display information
  
  







}


