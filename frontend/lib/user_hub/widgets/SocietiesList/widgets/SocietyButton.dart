import 'package:flutter/material.dart';

import '../../../../backend_communication/societyfunctions.dart';
import 'package:http/http.dart' as http;

class SocietyButton extends StatefulWidget {
  
  SocietyButton({super.key, required this.hasJoined, required this.socId});
  bool hasJoined;
  int socId;

  @override
  State<SocietyButton> createState() => _SocietyButtonState();
}

// var joined = false;
// void setJoined(){
//   joined = !joined;
// }
var buttonText = "";

// void func1(){
//   http.Response leave_repo = await leaveFromSociety(widget.socId);
//   if (leave_repo.statusCode == 204) {
//     //Left society
//     AlertDialog(
//       content: const Text(
//           'You have "joined" successfully!'),
//       actions: <Widget>[
//         TextButton(
//           onPressed: () =>
//               Navigator.pop(
//                   context,
//                   'Confirm'),
//           child: const Text(
//               'Confirm'),
//         ),
//       ],
//     );
//   } else {
//     //Failed to leave society
//     AlertDialog(
//       content: const Text(
//           'You have failed to join society.'),
//       actions: <Widget>[
//         TextButton(
//           onPressed: () =>
//               Navigator.pop(
//                   context,
//                   'Confirm'),
//           child: const Text(
//               'Confirm'),
//         ),
//       ],
//     );
//   };
// }

void func2(){
  ;
}

class _SocietyButtonState extends State<SocietyButton> {
  @override
  Widget build(BuildContext context) {
    //joined = widget.hasJoined; // Connecting outer variable to inner variable
    void executeWhenLeave() async {
      http.Response leave_repo = await leaveFromSociety(widget.socId);
      if (leave_repo.statusCode == 204) {
        //Left society
        showDialog(context: context,builder: (context) {
                  return AlertDialog(
          content: const Text(
              'You have "left" successfully!'),
          actions: <Widget>[
            TextButton(
              onPressed: () =>
                  Navigator.pop(
                      context,
                      'Confirm'),
              child: const Text(
                  'Confirm'),
            ),
          ],
        );
                },); 
      } else {
        //Failed to leave society
        showDialog(context: context,builder: (context) {
                  return AlertDialog(
          content: const Text(
              'You have failed to leave the society.'),
          actions: <Widget>[
            TextButton(
              onPressed: () =>
                  Navigator.pop(
                      context,
                      'Confirm'),
              child: const Text(
                  'Confirm'),
            ),
          ],
        );
                },);
      };
    };

    void executeWhenJoin() async{
      http.Response join_repo = await joinSociety(widget.socId);
      print(join_repo.statusCode);
      if (join_repo.statusCode == 201) {
        //Joined society
        showDialog(context: context, builder: (context){
          return AlertDialog(
          content: const Text(
              'You have "joined" successfully!'),
          actions: <Widget>[
            TextButton(
              onPressed: () =>
                  Navigator.pop(
                      context,
                      'Confirm'),
              child: const Text(
                  'Confirm'),
            ),
          ],
        );
        });
        
      } else {
        //Failed to join society
        showDialog(context: context, builder: (context){
          return AlertDialog(
          content: const Text(
              'You have failed to join the society.'),
          actions: <Widget>[
            TextButton(
              onPressed: () =>
                  Navigator.pop(
                      context,
                      'Confirm'),
              child: const Text(
                  'Confirm'),
            ),
          ],
        );
        });
      }

    }

    if(!widget.hasJoined) {
      buttonText = "Join";
    }
    else{
      buttonText = "Leave";
    }
    
    return TextButton(onPressed: (){
      //setJoined();
      if(!widget.hasJoined) {
        executeWhenJoin();
      }
      else{
       executeWhenLeave();
      }

      setState(() {
              widget.hasJoined = !widget.hasJoined;
              print(widget.hasJoined);
            });
    },  style:  const ButtonStyle(
    backgroundColor: MaterialStatePropertyAll<Color>(Color(0xffC8A2C8)), foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
    
    ), child: Text(buttonText));
  }
}
