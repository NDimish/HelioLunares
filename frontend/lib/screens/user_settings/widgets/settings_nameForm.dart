import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NameForm extends StatefulWidget {
  const NameForm({super.key});

  @override
  State<NameForm> createState() => _NameFormState();
}

class _NameFormState extends State<NameForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height:200,
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [TextFormField()]))));
    
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
        SizedBox(
        child:TextFormField(
       
        onSaved: (String? value) {
          // This optional block of code can be used to run
          // code when the user saves the form.
        },
       
        
      )),
      SizedBox(
      child:TextFormField(
   
        onSaved: (String? value) {
          // This optional block of code can be used to run
          // code when the user saves the form.
        },
     
        
      ),
      )
        ],
    
      );
  }
}