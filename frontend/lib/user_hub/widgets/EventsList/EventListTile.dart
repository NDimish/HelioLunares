import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Should have:
// Image
// Name of event
// Date/Time of event
// Organiser

class EventListTile extends Material {
  EventListTile(
      BuildContext context, String eventName, int price, DateTime dateTime, String location, String org,
      {super.key})
      : super(
        color: Color(0x00000000),

        // Using Card avoids a lot of hassle with spacing
        child: Card(
          child: ListTile(
          title: Text(eventName),
          tileColor: Color(0xFFD2C2E5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          leading: Icon(Icons.event),

          subtitle: Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start, 
            mainAxisSize: MainAxisSize.max,
            children: [Flexible(child:Row(children: [Icon(Icons.monetization_on_outlined),SizedBox(width: 5),Text("£" + price.toString())])),
              Flexible(child:Row(children: [Icon(Icons.calendar_month_outlined),SizedBox(width: 5),Text(DateFormat("dd/MM/yyyy HH:mm").format(dateTime))])),
              Flexible(child:Row(children: [Icon(Icons.pin_drop_outlined),SizedBox(width: 5),Flexible(child:Text(location, overflow: TextOverflow.ellipsis,maxLines: 2,))])),
              Flexible(child:Row(children: [Icon(Icons.group_outlined),SizedBox(width: 5),Flexible(child:Text(org, overflow: TextOverflow.ellipsis,maxLines: 1,))])),
            ],
          ),
          
          // Add link to events page here
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: const Text("Event here!"),
                        ),
                        body: const Center(
                            child: Text(
                                "Page showing event details here")),
                      )));
          },
        ),
        )
        
        
            
  );
}
