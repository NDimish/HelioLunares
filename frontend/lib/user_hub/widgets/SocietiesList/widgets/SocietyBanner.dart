import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../helpers/responsiveness.dart';

class SocietyBanner extends StatelessWidget {
  final String imageLink;
  const SocietyBanner({required this.imageLink, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: ResponsiveWidget.isSmallScreen(context)
            ? 250
            : MediaQuery.of(context).size.width / 3.5,
        height: ResponsiveWidget.isSmallScreen(context)
            ? 250
            : MediaQuery.of(context).size.height / 4,
        child: Image.network(
            "https://www.slntechnologies.com/wp-content/uploads/2017/08/ef3-placeholder-image.jpg"));
  }
}
