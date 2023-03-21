import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart';

// class Event {
//   final String name;
//   final String description;
//   final String date;

//   Event({
//     required this.name,
//     required this.description,
//     required this.date,
//   });
// }

class SocietyEventsList extends StatefulWidget {
  final Society societyName;
  const SocietyEventsList ({super.key, required this.societyName});

  @override
  State<SocietyEventsList> createState() => _SocietyEventsPageState();
}

class _SocietyEventsPageState extends State<SocietyEventsList> {
  // final List<Event> events = [
  //   Event(
  //     name: 'Painting Workshop',
  //     description: 'Join us for a workshop on watercolor painting techniques!',
  //     date: 'Saturday, April 2, 2022',
  //   ),
  //   Event(
  //     name: 'Movie Night',
  //     description: 'Come watch a movie with us and enjoy some popcorn!',
  //     date: 'Friday, April 8, 2022',
  //   ),
  //   Event(
  //     name: 'Book Club Meeting',
  //     description: 'We will be discussing "To Kill a Mockingbird" this month.',
  //     date: 'Monday, April 18, 2022',
  //   ),
  //   Event(
  //     name: 'Book Club Meeting',
  //     description: 'We will be discussing "To Kill a Mockingbird" this month.',
  //     date: 'Monday, April 18, 2022',
  //   ),Event(
  //     name: 'Book Club Meeting',
  //     description: 'We will be discussing "To Kill a Mockingbird" this month.',
  //     date: 'Monday, April 18, 2022',
  //   ),Event(
  //     name: 'Book Club Meeting',
  //     description: 'We will be discussing "To Kill a Mockingbird" this month.',
  //     date: 'Monday, April 18, 2022',
  //   ),Event(
  //     name: 'Book Club Meeting',
  //     description: 'We will be discussing "To Kill a Mockingbird" this month.',
  //     date: 'Monday, April 18, 2022',
  //   ),Event(
  //     name: 'Book Club Meeting',
  //     description: 'We will be discussing "To Kill a Mockingbird" this month.',
  //     date: 'Monday, April 18, 2022',
  //   ),Event(
  //     name: 'Book Club Meeting',
  //     description: 'We will be discussing "To Kill a Mockingbird" this month.',
  //     date: 'Monday, April 18, 2022',
  //   ),Event(
  //     name: 'Book Club Meeting',
  //     description: 'We will be discussing "To Kill a Mockingbird" this month.',
  //     date: 'Monday, April 18, 2022',
  //   ),
  //];

  // Widget eventsList(BuildContext context) {
  //   return ChangeNotifierProvider(
  //     create: (context) => dataCollector<Event>(),
  //     builder: (context,child) {
  //       final events = Provider.of<dataCollector<Event>>(context);
  //       return ListView.builder(
  //         itemCount: events.collection.length,
  //         itemBuilder: (BuildContext context, int index) {
  //           return Card(
  //             margin: EdgeInsets.all(16.0),
  //             child: Padding(
  //               padding: EdgeInsets.all(16.0),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     events.collection[index].title,
  //                     style: TextStyle(
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 20.0,
  //                     ),
  //                   ),
  //                   SizedBox(height: 8.0),
  //                   Text(
  //                     events.collection[index].description,
  //                   ),
  //                   SizedBox(height: 8.0),
  //                   Text(
  //                     'Date: ${events.collection[index].date}',
  //                     style: TextStyle(
  //                       fontStyle: FontStyle.italic,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           );
  //         },
  //       );
  //     }
  //   );
  //}

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => dataCollector<Event>(filter: {'society_id':widget.societyName.user.id.toString()}),//filter: {'society_id':widget.societyName.id.toString()}
      builder: (context,child) {
        final events = Provider.of<dataCollector<Event>>(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.societyName.name),
          ),
          body: 
          
             
        
            
               ListView.builder(
                  shrinkWrap: true,
                     itemCount: events.collection.length,
                     itemBuilder: (BuildContext context, int index) {
                       return Card(
                  margin: EdgeInsets.all(16.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          events.collection[index].title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          events.collection[index].description,
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Date: ${events.collection[index].date}',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                       );
                     },
                   ),
               
             
            
          
        );
      }
    );
  }
}
