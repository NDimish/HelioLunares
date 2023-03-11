import 'package:flutter/material.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/bought_tickets/user_bought_ticket_screen.dart';
import 'package:url_launcher/url_launcher.dart';
// import '../backend_communication/get.dart' as data;

class BuyTicketScreen extends StatelessWidget {
  // // final data.OrderType Orderby;
  // // final String filter;
  // final int id;

  // const BuyTicketScreen(
  //     {Key? key,
  //     // this.Orderby = data.OrderType.CHRONOLOGICAL,
  //     // this.filter = 'none',
  //     this.id = -1
  //     }
  //   )
  //     : super(key: key);

  const BuyTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                              children: const [
                                Expanded(
                                  child: Text('Title: ',
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
                              children: const [
                                Expanded(
                                  child:
                                      Text('Date: ', textAlign: TextAlign.left),
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
                              children: const [
                                Expanded(
                                  child: Text('Venue: ',
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
                              children: const [
                                Expanded(
                                  child:
                                      Text('Seat: ', textAlign: TextAlign.left),
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
                              children: const [
                                Expanded(
                                  child:
                                      Text('Gate: ', textAlign: TextAlign.left),
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
                              children: const [
                                Expanded(
                                  child: Text('Description: ',
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
                                          const UserBoughtTicketScreen()));
                            },
                            child: const Text('back'))
                      ],
                    ),
                  ))),

          const Expanded(
            flex: 1,
            child: InkWell(
              onTap: _launchURL,
              child: Text(
                'Purchase Ticket Here',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            
          )
          
          // const Expanded(
          //   flex: 1,
          //   child: Text(
          //     'Purchase Ticket Here',
          //       style: TextStyle(
          //         fontSize: 20,
          //         color: Colors.blue,
          //         decoration: TextDecoration.underline,
          //       ),
          //   ),
          // )

        ],
      ),
    );
  }




}

  _launchURL() async {
    Uri url = Uri.parse('https://www.google.com');
    if (await launchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  } 
