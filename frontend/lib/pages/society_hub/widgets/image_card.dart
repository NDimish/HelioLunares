import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final NetworkImage? image;
  const ImageCard({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Column(children: [
      Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: image ?? const NetworkImage('assets/icons/kcl.png'),
          ),
        ),
      ),
      SizedBox(
        height: _width / 32,
      )
    ]);
  }
}
