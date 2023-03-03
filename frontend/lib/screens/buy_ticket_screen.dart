import 'package:flutter/material.dart';
import 'package:university_ticketing_system/screens/user_bought_ticket_screen.dart';
import '../backend_communication/get.dart' as data;

class BuyTicketScreen extends StatelessWidget{
  // final data.OrderType Orderby;
  // final String filter;
  final int id;

  const BuyTicketScreen(
      {Key? key,
      // this.Orderby = data.OrderType.CHRONOLOGICAL,
      // this.filter = 'none',
      this.id = -1
      }
    )
      : super(key: key);

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
                  
                    ElevatedButton(
                      onPressed: (){
                        Navigator.pop(
                          context, 
                          MaterialPageRoute(builder: (context) => UserBoughtTicketScreen())
                        );
                      }, 
                      child: Text('previous page')
                    )

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

