import 'package:flutter/material.dart';
import 'package:university_ticketing_system/pages/society_hub/widgets/circular_card.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/EventsListPage.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/widgets/SocietyButton.dart';

import '../../../gradient_animation.dart';


class MainSocietyPage extends StatefulWidget {
  const MainSocietyPage({super.key});

  final x = 0;

  @override
  State<MainSocietyPage> createState() => _MainSocietyPageState();
}

@override
class _MainSocietyPageState extends State<MainSocietyPage> {
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return 
    Container(
      color: const Color(0xFFF4E7FA),
      child: Column(children: [
        const SizedBox(
          height: 17,
        ),
        CircularCard(),
        const Text(
          'Data Science Society',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 48, color: Colors.black),
                ),
        const SizedBox(
          height: 25,
        ),
        const Text(
          'Number of members: 17',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24, color: Colors.black),
        ),
        const SizedBox(
          height: 25,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
    
          children: [
           Padding(padding:const EdgeInsets.only(right:10.0), child: SocietyButton(onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SocietyEventsList(societyName: 'Data Society',)
              )
            ),buttonText: "List of Events",)),
            // if(x == 0) {
            //   SocietyButton(onPressed: () => (){
            //     //201 = joined
            //     //400 = already joined
            //     // eveything else = error

            // },buttonText: "Join Society",),

            // }else{
            //    SocietyButton(onPressed: () => (){
            //     //204 = Left Society
            //     //400 = Not joined society
            //     //everything else.


            // },buttonText: "Leave Society",),
            // },
            
          ],
    
          
        ),
         const SizedBox(
              height: 25,
            ),
            const Text(
              'About Us',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 36, color: Colors.black),
                ),
                const SizedBox(
                  height:25
                ),
                Padding(padding: const EdgeInsets.all(10.0),
                child:Card(
              elevation: 0,
              color: Color(0xFFF3F9Fe),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: const SizedBox(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(child: Text('Data Science Society is an international digital community and our team has been building a strong core of members digitally around a body of Data Science knowledge while having fun! So far we have organized multiple Data Science Meetups and International Datathons with attendees from more than 20 countries.')),
            ),
            ),
                ))
        
        
        
    
        
      ],),
    );
  }
}


//join society call url in backend
//201 - joined the society
//400 - already joined 
//anything else - error 