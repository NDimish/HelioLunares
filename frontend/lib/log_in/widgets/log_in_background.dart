import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/log_in/widgets/log_in_card.dart';
import 'package:flutter/material.dart';

class BackGroundOfLogin extends StatefulWidget {
  const BackGroundOfLogin({super.key});

  @override
  State<BackGroundOfLogin> createState() => _BackGroundOfLoginState();
}

class _BackGroundOfLoginState extends State<BackGroundOfLogin> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
          //width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.25)),
          child: CustomLinearGradient(child: LogInCard())),
    );
  }
}
