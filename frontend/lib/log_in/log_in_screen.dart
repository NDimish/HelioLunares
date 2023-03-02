import 'package:flutter/material.dart';
import 'package:redesigned_front_end/gradient_animation.dart';
import 'package:redesigned_front_end/log_in/widgets/fade_in_transition.dart';
import 'package:redesigned_front_end/log_in/widgets/log_in_card.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Log In"),
            leading: const Icon(Icons.airplane_ticket_rounded)),
        body: CustomLinearGradient(
            child: Center(
                child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height * 0.8,
          child: const CustomFadeTransition(child: LogInCard()),
        ))));
  }
}
