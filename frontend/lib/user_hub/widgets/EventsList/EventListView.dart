import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/backend_communication/authenticate.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart' as data;
import 'EventListTile.dart';
import 'package:flutter/src/widgets/framework.dart';

// This class will need to take in data from the database
// TODO: allow data to be passed to EventListTile for
// dynamic page loading

class EventListView extends StatelessWidget {
  EventListView({super.key,this.Orderby = data.OrderType.CHRONOLOGICAL,
      this.filter = const {},
      this.id = -1});
  
  data.OrderType Orderby;
  Map<String, String> filter;
  int id;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(
              create: (context) => data.dataCollector<data.Event>(
                  filter: filter, order: Orderby))],
      builder: (context, child){
        final eventData = Provider.of<data.dataCollector<data.Event>>(context);

        var size = eventData.collection.length;
        print(size);

        return ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: size,
          itemBuilder: (context, index){
          
          var name = eventData.collection[index].title;
          var price = eventData.collection[index].price;
          var date = eventData.collection[index].date;
          var loc = eventData.collection[index].venue;
          var org = eventData.collection[index].society.name;

          return EventListTile(
            eventName: name,
            price: price,
            dateTime: date,
            location: loc, 
            org: org);
          },
        ); 
      },
    );

  }
}
