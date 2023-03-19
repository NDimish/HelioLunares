import 'package:flutter/material.dart';

class CircularCard extends StatelessWidget {
  const CircularCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Column(children: [
      Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage('assets/icons/kcl.png'),
          ),
        ),
      ),
      SizedBox(
        height: _width / 32,
      )
    ]);
  }
}
