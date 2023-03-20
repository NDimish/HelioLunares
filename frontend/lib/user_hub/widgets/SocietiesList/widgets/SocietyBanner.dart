import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../helpers/responsiveness.dart';

class SocietyBanner extends StatelessWidget {
  final String imageLink;
  const SocietyBanner({required this.imageLink, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        //placeholder for now, eventually use the parameter.
        "https://avatars.githubusercontent.com/u/32419965?v=4",
        width: ResponsiveWidget.isSmallScreen(context)
            ? 250
            : MediaQuery.of(context).size.width / 3.5,
        height: ResponsiveWidget.isSmallScreen(context)
            ? 250
            : MediaQuery.of(context).size.height / 4,
        fit: BoxFit.cover,
      ),
    );
  }
}
