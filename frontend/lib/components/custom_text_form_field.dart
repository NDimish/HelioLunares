import 'package:flutter/material.dart';

Widget customTextFormField(
    BuildContext context,
    TextEditingController controller,
    String errorText,
    String labelText,
    TextInputType keyboardType,
    IconData iconIn,
    String? Function(String?) validator) {
  return TextFormField(
    onSaved: (newValue) {
      controller.text = newValue!;
    },
    controller: controller,
    keyboardType: TextInputType.emailAddress,
    validator: validator,
    autovalidateMode: AutovalidateMode.values.first,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.only(left: 40.0, right: 40.0),
      suffixIcon: Padding(
        padding: const EdgeInsetsDirectional.only(end: 25.0),
        child: Icon(
          iconIn,
          color: Colors.grey,
        ), // myIcon is a 48px-wide widget.
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: Colors.black),
      ),
      labelText: labelText,
      floatingLabelStyle:
          MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
        final Color color = states.contains(MaterialState.error)
            ? Theme.of(context).colorScheme.error
            : Colors.black;
        return TextStyle(color: color, letterSpacing: 1.3);
      }),
    ),
  );
}
