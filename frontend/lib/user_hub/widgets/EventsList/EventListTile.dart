import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'IndividualEventsPage.dart';

// Should have:
// Image
// Name of event
// Date/Time of event
// Organiser

var isVisible = true;
var searchText = "";

void setSearchText(String t){
  searchText = t;
}

class EventListTile extends StatefulWidget{
  EventListTile({super.key, 
  required this.eventName, 
  required this.price,
  required this.dateTime,
  required this.location,
  required this.org,
  required this.eventID});

  String eventName;
  double price;
  String dateTime; 
  String location; 
  String org;
  int eventID;

  @override
  State<EventListTile> createState() => _EventListTileState();
}

class _EventListTileState extends State<EventListTile>{
  @override
  Widget build(BuildContext context){
    var name = widget.eventName;
    var price = widget.price;
    var date = widget.dateTime;
    var loc = widget.location;
    var organ = widget.org;
    var eID = widget.eventID;

    // Regex checker
    RegExp reg = RegExp(r"" + searchText, caseSensitive: false);
    if(reg.hasMatch(name)){
      isVisible = true;
    }
    else{
      isVisible = false;
    }

    return Visibility(
      visible: isVisible,
      child: Material(color: Color(0x00000000),
          child: Card(
          child: ListTile(
          title: Text(name),
          tileColor: Color(0xFFD2C2E5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          leading: Icon(Icons.event),

          subtitle: Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start, 
            mainAxisSize: MainAxisSize.max,
            children: [Flexible(child:Row(children: [Icon(Icons.monetization_on_outlined),SizedBox(width: 5),Flexible(child:Text("£" + price.toString(), overflow: TextOverflow.ellipsis,maxLines: 1,))])),
              Flexible(child:Row(children: [Icon(Icons.calendar_month_outlined),SizedBox(width: 5),Flexible(child:Text(date, overflow: TextOverflow.ellipsis,maxLines: 1))])),
              Flexible(child:Row(children: [Icon(Icons.pin_drop_outlined),SizedBox(width: 5),Flexible(child:Text(loc, overflow: TextOverflow.ellipsis,maxLines: 2,))])),
              Flexible(child:Row(children: [Icon(Icons.group_outlined),SizedBox(width: 5),Flexible(child:Text(organ, overflow: TextOverflow.ellipsis,maxLines: 1,))])),
            ],
          ),
          
          // Add link to events page here
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EventPage(
                              eventName: 'Introduction to AI',
                              eventDate: '10/04/2013',
                              eventDescription: 'Great fun',
                              eventDuration: '1 hour',
                              eventLocation: 'Bush House',
                              eventPrice: '£10',
                              eventId:eID,
                                )));
          },
        ),
        ),
        ));

  }
}

// class  extends Visibility {

//   EventListTile(
//       BuildContext context, String eventName, int price, DateTime dateTime, String location, String org,
//       {super.key})
//       :super(
        
//         visible: isVisible,
//         child:Material(color: Color(0x00000000),
//           child: Card(
//           child: ListTile(
//           title: Text(eventName),
//           tileColor: Color(0xFFD2C2E5),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           leading: Icon(Icons.event),

//           subtitle: Row(crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.start, 
//             mainAxisSize: MainAxisSize.max,
//             children: [Flexible(child:Row(children: [Icon(Icons.monetization_on_outlined),SizedBox(width: 5),Text("£" + price.toString())])),
//               Flexible(child:Row(children: [Icon(Icons.calendar_month_outlined),SizedBox(width: 5),Text(DateFormat("dd/MM/yyyy HH:mm").format(dateTime))])),
//               Flexible(child:Row(children: [Icon(Icons.pin_drop_outlined),SizedBox(width: 5),Flexible(child:Text(location, overflow: TextOverflow.ellipsis,maxLines: 2,))])),
//               Flexible(child:Row(children: [Icon(Icons.group_outlined),SizedBox(width: 5),Flexible(child:Text(org, overflow: TextOverflow.ellipsis,maxLines: 1,))])),
//             ],
//           ),
          
//           // Add link to events page here
//           onTap: (){
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => Scaffold(
//                         appBar: AppBar(
//                           title: const Text("Event here!"),
//                         ),
//                         body: const Center(
//                             child: Text(
//                                 "Page showing event details here")),
//                       )));
//           },
//         ),
//         ),
//         )
//   );
// }
