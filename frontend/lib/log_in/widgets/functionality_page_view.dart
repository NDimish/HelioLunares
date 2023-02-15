import 'package:flutter/material.dart';

class FunctionalityPageView extends StatelessWidget {
  const FunctionalityPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        //width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.25)),
        child: showFunctionalityCard(context),
      ),
    );
  }

  Widget showFunctionalityCard(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Center(
        child: SizedBox(
            height: height * 0.75,
            width: width * 0.5,
            child: Card(
                child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text("We can add images about our functionality here")
                        ])))));
  }
}
