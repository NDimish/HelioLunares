import 'package:flutter/material.dart';

import '../../../helpers/responsiveness.dart';

class CircularCard extends StatelessWidget {
  const CircularCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Column(children: [
      Container(
        width: ResponsiveWidget.isSmallScreen(context) ? 330 : _width / 2,
        height: 330,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage('assets/icons/kcl.png'),
          ),

          //color: Colors.green.withOpacity(0.25), // border color
          //shape: BoxShape.circle,
        ),
        // child: Padding(
        //   padding: EdgeInsets.all(2), // border width
        //   child: Container(
        //     // or ClipRRect if you need to clip the content
        //     decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       color: Colors.blue, // inner circle color
        //     ),
        //     child: Container(), // inner content
        //   ),
        // ),
      ),
      SizedBox(
        height: _width / 32,
      )
    ]);
  }
}
