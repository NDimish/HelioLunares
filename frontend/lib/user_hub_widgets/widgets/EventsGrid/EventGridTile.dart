import 'package:flutter/material.dart';

// Should have:
// Image
// Name of event
// Date/Time of event
// Organiser

class EventGridTile extends GridTile{
  EventGridTile(String imagePath, String eventName, DateTime dateTime, String org):super(
    
    header: Container(
      height: 25,
      decoration: BoxDecoration(
        color: Colors.red[300],
      ),
      child: Center(
        child: Text(
          "EVENT",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 3,
            color: Colors.white
          ),
        )
        ),
    ),
    child: Material(

      child:Ink(
        height: 1000,
        child: InkWell(

          onTap: () {
            
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: SingleChildScrollView(
              child: Column(
              children: <Widget>[
                Image.asset(imagePath, scale: 6,),
                SizedBox(height:4),
                Text(eventName),
                SizedBox(height:4),
                Text(dateTime.day.toString() + "/" + dateTime.month.toString() + "/" + dateTime.year.toString() + ", at " + dateTime.hour.toString() + ":" + dateTime.minute.toString()),
                SizedBox(height:4),
                Text(org),

              ],
            ),
            )
            
          ),
        ),
      ),
      
    )
  
  );
}