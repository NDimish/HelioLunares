
import 'package:flutter/material.dart';

// var search_controller = TextEditingController();

class CustomSearchBar extends Container{
  CustomSearchBar(Function(String)? searchfunc, 
  Function()? clearfunc, 
  TextEditingController? search_controller,
  String hinttext):super(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: SizedBox(
          child: TextField(
            cursorColor: Color(0xff70587C),
            cursorHeight: 20,
            controller: search_controller,


            //--------------------
            // MAIN SEARCH FUNCTION HERE
            //--------------------
            onChanged: searchfunc,

            // Decoration for TextField
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15),
              border: InputBorder.none,
              hintText:"Search $hinttext by name or tags...",


              // Clears search bar
              suffixIcon: IconButton(
                key:Key("ClearSearchbarButton"),
                tooltip: "Clear search",
                icon: Icon(Icons.close, color: Color(0xff70587C),),
                onPressed: clearfunc,
                splashColor: Color.fromARGB(170, 100, 100, 100),
                hoverColor: Color(0xFFD2C2E5),
              )
              ),
            ),
          )     
          ,width: 500,
          height: 45,
  );
}