import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/backend_communication/authenticate.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart';
import 'package:university_ticketing_system/user_hub/widgets/EventsList/EventListTile.dart';
import 'package:university_ticketing_system/user_hub/widgets/EventsList/EventListView.dart';
import 'dart:io';
import 'package:provider/provider.dart';

import 'package:university_ticketing_system/backend_communication/models/Event.dart';
import 'package:university_ticketing_system/backend_communication/models/User.dart';
import 'package:university_ticketing_system/backend_communication/models/University.dart';
void main(){
  setUpAll(() async {
    HttpOverrides.global = null;
    return await createPerson(
                    "thisisanewemail@gmail.com",
                    "This.is.pass1091",
                    1,
                    "Water",
                    "Rock",
                    "Tester");
    }); 
  group("EventListView tests", () { 
    testWidgets("EventListView is of type EventListView", (tester) async{
      await tester.pumpWidget(MaterialApp(
        home:Scaffold(
          body:EventListView()
        )
      ));
      final typeFinder = find.byType(EventListView);

      await tester.pumpAndSettle();

      expect(typeFinder, findsOneWidget);
    });
    
    // This test fails unless a mock database is used
    testWidgets("EventListView has child of EventListTile type", (tester) async{
      
      
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => dataCollector<Event>(filter: {}),
            )
          ],
          builder: (context, child) {
            dataCollector<Event> events = Provider.of<dataCollector<Event>>(context);
            
            var testuser = User(email: "email", 
            userType: 3, 
            date_joined: "date_joined",
            );

            var testuni = University(name: "name", 
            latitude: 0.0, 
            longitude: 0.0, 
            street_name: "street_name", 
            postcode: "postcode");
            
            var testsoc = Society(user: testuser, 
            university: testuni, 
            name: "name", 
            description: "description", 
            created_at: "created_at", 
            join_date: "join_date", 
            image: "image");
            
            var testevent = Event(society: testsoc, 
            ticket_amount: 0, 
            duration: 0.0, 
            price: 0.0, 
            update_time: "x", 
            create_time: "x", 
            title: "title", 
            date: "date", 
            time: "time", 
            venue: "venue", 
            description: "description",
            id: 0).toJson();

            Future<bool> insideFunc() async {
              return await events.addToCollection(testevent);
            }

            Future<bool> a = insideFunc();

            return MaterialApp(
              home:Scaffold(
                body:EventListView()
              )
            );
          },
        )

        
      );
      final childFinder = find.byType(EventListTile);

      await tester.pumpAndSettle();

      expect(childFinder, findsWidgets);
    });
  });
  
}