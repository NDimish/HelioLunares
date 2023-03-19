
import 'package:flutter/material.dart';

// var search_controller = TextEditingController();

class CustomSearchBar extends Container{
  CustomSearchBar(Function(String)? searchfunc, Function()? clearfunc, TextEditingController? search_controller):super(
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
              hintText:"Search...",


              // Clears search bar
              suffixIcon: IconButton(
                icon: Icon(Icons.close, color: Color(0xff70587C),),
                onPressed: clearfunc,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
              )
              ),
            ),
          )     
          ,width: 500,
          height: 45,
  );
}