import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SocietyListTile.dart';
import 'package:university_ticketing_system/backend_communication/authenticate.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart' as data;

// This class will need to take in data from the database
// TODO: allow data to be passed to SocietyListTile for
// dynamic page loading

class SocietyListView extends StatelessWidget {
  SocietyListView({super.key,this.Orderby = data.OrderType.CHRONOLOGICAL,
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
              create: (context) => data.dataCollector<data.Society>(
                  filter: filter, order: Orderby))
      ],
      builder: (context, child){
        final socData = Provider.of<data.dataCollector<data.Society>>(context);
        
        var size = socData.collection.length;
        print(size);

        return ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: size,
        itemBuilder: (context, index){
          
          var name = socData.collection[index].name;
          var summary = socData.collection[index].description;
          var uni = socData.collection[index].university.name;
          var sID = socData.collection[index].id;

          return SocietyListTile(
            societyName: name,
            summary: summary,
            uni: uni,
            societyID: sID,
          );
        },
      );
      },
      );
    
  }
}
