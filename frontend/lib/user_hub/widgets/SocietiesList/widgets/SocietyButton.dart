import 'package:flutter/material.dart';
class SocietyButton extends StatefulWidget {
  
  SocietyButton({super.key,required this.buttonText, required this.hasJoined});
  String buttonText;
  bool hasJoined;

  @override
  State<SocietyButton> createState() => _SocietyButtonState();
}

var joined = false;

void setJoined(){
  joined = !joined;
}

void func1(){
  print("From func1");
}

void func2(){
  print("From func2");
}

class _SocietyButtonState extends State<SocietyButton> {
  @override
  Widget build(BuildContext context) {
    widget.hasJoined = joined; // Connecting outer variable to inner variable

    if(!widget.hasJoined){
      widget.buttonText = "Join";
      func1();
    }
    else{
      widget.buttonText = "Leave";
      func2();
    }
    
    return TextButton(onPressed: (){
      setJoined();
      setState(() {
              
            });
    },  style:  const ButtonStyle(
    backgroundColor: MaterialStatePropertyAll<Color>(Color(0xffC8A2C8)), foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
    
    ), child: Text(widget.buttonText));
  }
}
