import 'package:flutter/material.dart';
import 'package:university_ticketing_system/pages/society_hub/widgets/circular_card.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/EventsListPage.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/widgets/SocietyButton.dart';

import '../../../helpers/responsiveness.dart';

class MainSocietyPage extends StatefulWidget {
  final String societyName;
  final String societyDescription;

  MainSocietyPage({
    Key? key,
    required this.societyName,
    required this.societyDescription,
  }) : super(key: key);


  @override
  State<MainSocietyPage> createState() => _MainSocietyPageState();
}

@override
class _MainSocietyPageState extends State<MainSocietyPage> {
  final x = 0;
  bool hasJoined = true;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        (widget.societyName),
        style: TextStyle(fontFamily: "Arvo", fontWeight: FontWeight.bold),
      )),
      body: Container(
        color: const Color(0xFFF4E7FA),
        child: Column(
          children: [
            const SizedBox(
              height: 17,
            ),
       
              CircularCard(),
            
            const SizedBox(
              height: 7.5,
            ),
             Text(
              'Number of members: 17',
              style: TextStyle(
                  fontSize: height/7,
                  color: Colors.black,
                  fontFamily: "Avro",
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SocietyButton(
                      onPressed: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SocietyEventsList(
                                    societyName: (widget.societyName),
                                  ))),
                      buttonText: "List of Events",
                    )),
                SocietyButton(
                    buttonText: !hasJoined ? 'Join' : 'Leave',
                    onPressed: () => {
                          setState(() => {
                                //Process conditional first before negating?
                                hasJoined
                                    ? {
                                        print("left"),
                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            content: const Text(
                                                'You have left successfully!'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'Cancel'),
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'OK'),
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      }
                                    : {
                                        print("joined"),
                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            content: const Text(
                                                'You have joined successfully!'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'Cancel'),
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'OK'),
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      }, //leave and join code
                                hasJoined = !hasJoined
                              })
                        }),
                // if(x == 0) {
                //   SocietyButton(onPressed: () => (){
                //     //201 = joined - pop up joined
                //     //400 = already joined - text on button 'joined'
                //     // eveything else = error - pop up error

                // },buttonText: "Join Society",),

                // }else{
                //    SocietyButton(onPressed: () => (){
                //     //204 = Left Society - pop up successfully leaved
                //
                //     //everything else - pop up unsuccesfuly left

                // },buttonText: "Leave Society",),
                // },
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'About Us',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: ResponsiveWidget.isSmallScreen(context) ? 15 : 36,
                  color: Colors.black),
            ),
            SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 15 : 36),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 0,
                  color: Color(0xFFF3F9Fe),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                          child: Text(
                              (widget.societyDescription),),
                    ),
                  ),
                ))
            )
          ],
        ),
      ),
    );
  }
}

//join society call url in backend
//201 - joined the society
//400 - already joined
//anything else - error
