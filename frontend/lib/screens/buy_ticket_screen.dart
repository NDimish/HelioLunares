import 'package:flutter/material.dart';


class BuyTicketScreen extends StatelessWidget{
  const BuyTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
                child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 4,
                    color: Colors.black
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 10, 
                        color: Colors.white
                      ),
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text ('Title: ', textAlign: TextAlign.left),
                        ),
                      ],
                    )
                  ),

                  const SizedBox(height: 10,),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 10, 
                        color: Colors.white
                      ),
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text ('Date: ', textAlign: TextAlign.left),
                        ),
                      ],
                    )
                  ),


                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 10, 
                        color: Colors.white
                      ),
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text ('Venue: ', textAlign: TextAlign.left),
                        ),
                      ],
                    )
                  ),


                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 10, 
                        color: Colors.white
                      ),
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text ('Seat: ', textAlign: TextAlign.left),
                        ),
                      ],
                    )
                  ),


                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 10, 
                        color: Colors.white
                      ),
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text ('Gate: ', textAlign: TextAlign.left),
                        ),
                      ],
                    )
                  ),


                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 10, 
                        color: Colors.white
                      ),
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text ('Description: ', textAlign: TextAlign.left),
                        ),
                      ],
                    )
                  ),
                  ],
                ),
              )
            )
            
          ),

          Expanded(
            flex: 1,
            child: Text(
              'Link to ticket website',
              textAlign: TextAlign.center,
            ),
            
          )
        ],
      ),
    );
  }

}

