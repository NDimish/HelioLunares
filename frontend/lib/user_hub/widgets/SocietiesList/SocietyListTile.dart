import 'package:flutter/material.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/EventsListPage.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/IndividualSocietyPage.dart';

import 'IndividualSocietyPage.dart';

var isVisible = true;
var searchText = "";

void setSearchText(String t) {
  searchText = t;
}

class SocietyListTile extends StatefulWidget {
  SocietyListTile(
      {super.key,
      required this.societyName,
      required this.summary,
      required this.uni,
      required this.societyID});

  String societyName;
  String summary;
  String uni;
  int societyID;

  @override
  State<SocietyListTile> createState() => _SocietyListTileState();
}

class _SocietyListTileState extends State<SocietyListTile> {
  @override
  Widget build(BuildContext context) {
    var name = widget.societyName;
    var summary = widget.summary;
    var uni = widget.uni;
    var socID = widget.societyID;

    RegExp reg = RegExp(r"" + searchText, caseSensitive: false);
    if (reg.hasMatch(name)) {
      isVisible = true;
    } else {
      isVisible = false;
    }

    return Visibility(
      visible: isVisible,
      child: Material(
          color: Color(0x00000000),

          // Using Card avoids a lot of hassle with spacing
          child: Card(
            child: ListTile(
              title: Text(name),
              tileColor: Color(0xFFD2C2E5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              leading: Icon(Icons.group),

              subtitle: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                      child: Row(children: [
                    Icon(Icons.info_outline),
                    SizedBox(width: 5),
                    Flexible(
                        child: Text(
                      summary,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ))
                  ])),
                  Flexible(
                      child: Row(children: [
                    Icon(Icons.school_outlined),
                    SizedBox(width: 5),
                    Flexible(
                        child: Text(
                      uni,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ))
                  ])),
                ],
              ),

              // Add link to events page here
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainSocietyPage(
                              societyName: 'Introduction to AI',
                              societyDescription:
                                  'AI is the driving force of our economy.',
                              societyUni: 'Kings',
                              numberOfFollowers: '10',
                              socId: socID,
                            )));
              },
            ),
          )),
    );
  }
}

// class  extends Material {
//   SocietyListTile(
//       BuildContext context, String societyName, String summary, String uni,
//       {super.key})
//       : super(
//         color: Color(0x00000000),

//         // Using Card avoids a lot of hassle with spacing
//         child: Card(
//           child: ListTile(
//           title: Text(societyName),
//           tileColor: Color(0xFFD2C2E5),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           leading: Icon(Icons.group),

//           subtitle: Row(crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween, 
//             mainAxisSize: MainAxisSize.max,
//             children: [Flexible(child:Row(children: [Icon(Icons.info_outline),SizedBox(width: 5),Flexible(child:Text(summary, overflow: TextOverflow.ellipsis,maxLines: 2,))])),
//               Flexible(child:Row(children: [Icon(Icons.school_outlined),SizedBox(width: 5),Flexible(child:Text(uni, overflow: TextOverflow.ellipsis,maxLines: 1,))])),
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
//         )
//       );
            
// }
