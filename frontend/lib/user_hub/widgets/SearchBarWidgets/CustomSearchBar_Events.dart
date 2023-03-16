
// import 'package:flutter/material.dart';
// import 'package:university_ticketing_system/user_hub/widgets/EventsList/EventListTile.dart' as EventTile;
// import 'package:university_ticketing_system/user_hub/widgets/EventsList/EventListView.dart' as EventsList;

// var search_controller = TextEditingController();

// class CustomSearchBar_Events extends Container{
//   CustomSearchBar_Events():super(
//     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
//         child: SizedBox(
//           child: TextField(
//             cursorColor: Color(0xff70587C),
//             cursorHeight: 20,
//             controller: search_controller,


//             //--------------------
//             // MAIN SEARCH FUNCTION HERE
//             //--------------------
//             onChanged: (value) {
//             },

//             // Decoration for TextField
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.all(15),
//               border: InputBorder.none,
//               hintText:"Search...",


//               // Clears search bar
//               suffixIcon: IconButton(
//                 icon: Icon(Icons.close, color: Color(0xff70587C),),
//                 onPressed: () {
//                   search_controller.clear();
//                 },
//                 splashColor: Colors.transparent,
//                 hoverColor: Colors.transparent,
//               )
//               ),
//             ),
//           )     
//           ,width: 500,
//           height: 45,
//   );
// }