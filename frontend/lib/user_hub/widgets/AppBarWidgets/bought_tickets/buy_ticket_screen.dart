import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/bought_tickets/user_bought_ticket_screen.dart';
import '../../../../backend_communication/authenticate.dart';
import '../../../../backend_communication/dataCollector.dart' as data;
import '../../../../backend_communication/models/tickets.dart' as data;
import 'package:university_ticketing_system/backend_communication/models/all.dart';

class BuyTicketScreen extends StatelessWidget {
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

  // const BuyTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => data.dataCollector<data.Tickets>(
            // filter: widget.id, order: widget.Orderby
            )),
      ],
      builder: (context, child) {
        final DataP = Provider.of<data.dataCollector<data.Tickets>>(context);
        return Scaffold(
          backgroundColor: const Color(0xFFE0BBE4),
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
                          color: const Color(0xFFFEC8D8),
                          border: Border.all(width: 4, color: Colors.black),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 10,
                                    color: const Color(0xFFFEC8D8),
                                  ),
                                ),
                                child: Row(
                                  children:  [
                                    Expanded(
                                      child: Text('Title: ' + DataP.collection[index].event.title,
                                      textAlign: TextAlign.left),
                                    ),
                                  ],
                                )),
                            Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 10,
                                    color: const Color(0xFFFEC8D8),
                                  ),
                                ),
                                child: Row(
                                  children:  [
                                    Expanded(
                                      child:
                                          Text('Date: ' + DataP.collection[index].date, 
                                          textAlign: TextAlign.left),
                                    ),
                                  ],
                                )),
                            Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 10,
                                    color: const Color(0xFFFEC8D8),
                                  ),
                                ),
                                child: Row(
                                  children:  [
                                    Expanded(
                                      child: Text('Venue: ' + DataP.collection[index].event.venue,
                                          textAlign: TextAlign.left),
                                    ),
                                  ],
                                )),
                            // Container(
                            //     decoration: BoxDecoration(
                            //       border: Border.all(
                            //         width: 10,
                            //         color: const Color(0xFFFEC8D8),
                            //       ),
                            //     ),
                            //     child: Row(
                            //       children:  [
                            //         Expanded(
                            //           child:
                            //               Text('Seat: ' + DataP.collection[index].seat, 
                            //               textAlign: TextAlign.left),
                            //         ),
                            //       ],
                            //     )),
                            // Container(
                            //     decoration: BoxDecoration(
                            //       border: Border.all(
                            //         width: 10,
                            //         color: const Color(0xFFFEC8D8),
                            //       ),
                            //     ),
                            //     child: Row(
                            //       children: const [
                            //         Expanded(
                            //           child:
                            //               Text('Gate: ', textAlign: TextAlign.left),
                            //         ),
                            //       ],
                            //     )),
                            Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 10,
                                    color: const Color(0xFFFEC8D8),
                                  ),
                                ),
                                child: Row(
                                  children:  [
                                    Expanded(
                                      child: Text('Description: ' + DataP.collection[index].event.description,
                                          textAlign: TextAlign.left),
                                    ),
                                  ],
                                )),
                            Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 10,
                                    color: const Color(0xFFFEC8D8),
                                  ),
                                ),
                                child: Row(
                                  children:  [
                                    Expanded(
                                      child: Text('Price: ' + DataP.collection[index].price,
                                          textAlign: TextAlign.left),
                                    ),
                                  ],
                                )), 
  
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UserBoughtTicketScreen()));
                                },
                                child: const Text('back'))
                          ],
                        ),
                      ))),



            ],
          ),
        );
      }
    );
  }


}
