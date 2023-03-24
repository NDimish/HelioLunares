import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/bought_tickets/user_bought_ticket_screen.dart';


void main() {
  
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("All headers exists", (tester) async {
    
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: UserBoughtTicketScreen()
      )
    ));

    final upcoming = find.text("Upcoming Ticket(s)");
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
  
// will fail
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

  testWidgets('Displays message when there is no expired tickets', (tester) async{
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: UserBoughtTicketScreen()
      )
    ));
    
    final msg = find.text("You currently have no expired tickets.");


    expect(msg, findsOneWidget);


  });

//Will fail
  testWidgets('Displays ticket when user has expired tickets', (tester) async{
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: UserBoughtTicketScreen()
      )
    ));

    final tix = find.byKey(ValueKey('ExpiredTix'));

    expect(tix, findsWidgets);

  });

  testWidgets('Displays message when there is no upcoming tickets', (tester) async{
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: UserBoughtTicketScreen()
      )
    ));
    
    final msg = find.text("You currently have no upcoming tickets.");

    expect(msg, findsOneWidget);
    
  });

// Will fail
  testWidgets('Displays ticket when user has upcoming tickets', (tester) async{
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: UserBoughtTicketScreen()
      )
    ));

    final tix = find.byKey(ValueKey('UpcomingTix'));

    expect(tix, findsWidgets);

  });
  

  
  







}


