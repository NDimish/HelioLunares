import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/bought_tickets/buy_ticket_screen.dart';
import 'package:university_ticketing_system/user_hub/widgets/UserHubPage_events.dart';
import '../../../../backend_communication/authenticate.dart';
import '../../../../backend_communication/dataCollector.dart' as data;
import 'package:university_ticketing_system/backend_communication/models/Ticket.dart'
    as tic;
import 'package:university_ticketing_system/backend_communication/models/all.dart';
import 'package:university_ticketing_system/globals.dart' as globals;

class UserBoughtTicketScreen extends StatefulWidget {
  final data.OrderType Orderby;

  const UserBoughtTicketScreen({
    Key? key,
    this.Orderby = data.OrderType.CHRONOLOGICAL,
  }) : super(key: key);

  @override
  State<UserBoughtTicketScreen> createState() => _UserBoughtTicketScreenState();
}

class _UserBoughtTicketScreenState extends State<UserBoughtTicketScreen> {
  final List<Item> _data = generateItems(1);

  @override
  Widget build(BuildContext context) {
    setState(() {});
    var currentUserFilter = {
      'user': globals.localdataobj.getUserID().toString()
    };
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => Tickets(filter: {
                    'user': globals.localdataobj.getUserID().toString()
                  })),
          // filter: {'user':26.toString()})),
        ],
        builder: (context, child) {
          return Scaffold(
              appBar: AppBar(
                leading:IconButton(onPressed: 
                (){
                  Navigator.push(context, 
                    MaterialPageRoute(builder: 
                      (context) => UserHubPage_events()
                    )
                  );
                }, icon: Icon(Icons.arrow_back))
              ),
              backgroundColor: const Color(0xFFC8B8D8),
              body: _buildPanel(context));
        });
  }

  Widget _buildPanel(BuildContext context) {
    final DataP = Provider.of<Tickets>(context);
    DataP.ticketSort();
    return Column(children: <Widget>[
      // right of screen
      Expanded(
        flex: 5,
        // ignore: avoid_unnecessary_containers
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  _buildCollapsible(context),
                  const SizedBox(height: 50),
                  const Text(
                    "Upcoming Ticket(s)",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Arvo', color: Colors.black, fontSize: 25),
                  ),
                  const SizedBox(height: 10),
                  _buildUpcomingTix(context)
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  // Widget _buildUpcomingTix (BuildContext context){
  //   final DataP = Provider.of<Tickets>(context);
  //   return Container(
  //     height: 577,
  //     child: ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: DataP.upcoming.length,
  //       itemBuilder: (BuildContext context, int index){
  //         return Expanded(
  //           child: Column(
  //             children: [
  //               _OnHover(
  //                 child: OutlinedButton(
  //                   style: OutlinedButton.styleFrom(
  //                     backgroundColor: const Color(0xFFE8DAFA),
  //                     side: const BorderSide(color: Colors.black)
  //                   ),

  //                   onPressed: () {
  //                     Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                         builder: (context) => BuyTicketScreen(id:DataP.upcoming[index].id)
  //                       )
  //                     );
  //                   },

  //                   child: Container(
  //                     key: Key("ticket"),
  //                     height: 55,
  //                     decoration: BoxDecoration(
  //                       border: Border.all(
  //                         width: 10,
  //                         color: Colors.transparent,
  //                       ),
  //                       borderRadius: BorderRadius.circular(20),
  //                     ),

  //                     child: Row(
  //                       children: [
  //                         Expanded(
  //                           child: Text(
  //                             "${DataP.upcoming[index].event.title}",
  //                             textAlign: TextAlign.left,
  //                             selectionColor: Colors.black,
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                   ),
  //                 )
  //               ),

  //               const SizedBox(height: 20),
  //             ]
  //           ),
  //         );
  //       }
  //     ),
  //   );
  // }

  Widget _buildUpcomingTix(BuildContext context) {
    final DataP = Provider.of<Tickets>(context);
    if (DataP.upcoming.length > 0) {
      return Container(
        height: 577,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: DataP.upcoming.length,
            itemBuilder: (BuildContext context, int index) {
              return Expanded(
                child: Column(children: [
                  _OnHover(
                      child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFFE8DAFA),
                        side: const BorderSide(color: Colors.black)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BuyTicketScreen(
                                  id: DataP.upcoming[index].id)));
                    },
                    child: Container(
                      key: Key("ticket"),
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 10,
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${DataP.upcoming[index].event.title}",
                              textAlign: TextAlign.left,
                              selectionColor: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                  const SizedBox(height: 20),
                ]),
              );
            }),
      );
    } else {
      return Container(
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(
            width: 10,
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text("You currently have no upcoming tickets",
                  textAlign: TextAlign.center,
                  selectionColor: Colors.black,
                  style: TextStyle(
                      fontFamily: 'Arvo',
                      color: Colors.black,
                      fontSize: 15,
                      fontStyle: FontStyle.italic)),
            )
          ],
        ),
      );
    }
  }

  // Widget _buildCollapsible(BuildContext context) {
  //   final DataP = Provider.of<Tickets>(context);
  //   return ExpansionPanelList(
  //     elevation: 0,
  //     expansionCallback: (int index, bool isExpanded) {
  //       setState(() {
  //         _data[index].isExpanded = !isExpanded;
  //       });
  //     },
  //     children: _data.map<ExpansionPanel>((Item item) {

  //       return ExpansionPanel(
  //         backgroundColor: const Color(0xFFC8B8D8),
  //         headerBuilder: (BuildContext context, bool isExpanded) {
  //           return ListTile(
  //             contentPadding: const EdgeInsets.all(0),
  //             hoverColor: const Color(0xFFC8B8D8),
  //             title: Text(
  //               item.headerValue,
  //               style: const TextStyle(
  //                   fontFamily: 'Arvo', color: Colors.black, fontSize: 25),
  //             ),
  //           );
  //         },

  //         body: ListView.builder(
  //             shrinkWrap: true,
  //             itemCount: DataP.expired.length,
  //             itemBuilder: (BuildContext context, int index) {

  //               return Column(
  //                   children: [
  //                     _OnHover(
  //                       child: OutlinedButton(
  //                         style: OutlinedButton.styleFrom(
  //                           backgroundColor: const Color(0xFFE8DAFA),
  //                           side: const BorderSide(color: Colors.black)
  //                         ),
  //                         onPressed: () {
  //                           Navigator.push(
  //                               context,
  //                               MaterialPageRoute(
  //                                   builder: (context) => BuyTicketScreen(id:DataP.expired[index].id)));
  //                         },
  //                         child: Container(
  //                           height: 55,
  //                           decoration: BoxDecoration(
  //                             border: Border.all(
  //                               width: 10,
  //                               color: Colors.transparent,
  //                             ),
  //                             borderRadius: BorderRadius.circular(20),
  //                           ),
  //                           child: Row(
  //                             children: [

  //                               Expanded(
  //                                 child: Text(
  //                                   "${DataP.expired[index].event.title}",
  //                                   textAlign: TextAlign.left,
  //                                   selectionColor: Colors.black,
  //                                 ),
  //                               ),

  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     const SizedBox(height: 20),
  //                   ],
  //                 );

  //             },
  //           ),

  //         isExpanded: item.isExpanded,
  //       );
  //     }).toList(),
  //   );
  // }

  Widget _buildCollapsible(BuildContext context) {
    final DataP = Provider.of<Tickets>(context);
    return ExpansionPanelList(
      elevation: 0,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: [
        // Render a panel with expired tickets only when there are expired tickets
        if (DataP.expired.length > 0)
          ExpansionPanel(
            backgroundColor: const Color(0xFFC8B8D8),
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                contentPadding: const EdgeInsets.all(0),
                hoverColor: const Color(0xFFC8B8D8),
                title: Text(
                  "Expired Ticket(s)",
                  style: const TextStyle(
                    fontFamily: 'Arvo',
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              );
            },
            body: ListView.builder(
              shrinkWrap: true,
              itemCount: DataP.expired.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    _OnHover(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color(0xFFE8DAFA),
                          side: const BorderSide(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BuyTicketScreen(
                                id: DataP.expired[index].id,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 10,
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "${DataP.expired[index].event.title}",
                                  textAlign: TextAlign.left,
                                  selectionColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              },
            ),
            isExpanded: _data[0].isExpanded,
          ),
        // Render a panel with the "no expired tickets" message when there are no expired tickets
        if (DataP.expired.length == 0)
          ExpansionPanel(
            backgroundColor: const Color(0xFFC8B8D8),
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                contentPadding: const EdgeInsets.all(0),
                hoverColor: const Color(0xFFC8B8D8),
                title: Text(
                  "Expired Ticket(s)",
                  style: const TextStyle(
                    fontFamily: 'Arvo',
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              );
            },
            body: ListTile(
              title: Text(
                "You currently have no expired tickets.",
                textAlign: TextAlign.center,
                selectionColor: Colors.black,
                style: const TextStyle(
                  fontFamily: 'Arvo',
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                ),
              ),
            ),
            isExpanded: _data[0].isExpanded,
          ),
      ],
    );
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    required this.headerValue,
    this.isExpanded = false,
  });

  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Expired Ticket(s)',
    );
  });
}

class _OnHover extends StatefulWidget {
  final Widget child;

  const _OnHover({Key? key, required this.child}) : super(key: key);

  @override
  State<_OnHover> createState() => _OnHoverState();
}

class _OnHoverState extends State<_OnHover> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..scale(1.05);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();

    return MouseRegion(
        onEnter: (event) => onEntered(true),
        onExit: (event) => onEntered(false),
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            transform: transform,
            child: widget.child));
  }

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}

class Tickets extends data.dataCollector<tic.Tickets> {
  Tickets({super.filter}) : super();

  List<tic.Tickets> expiredtix = [];
  List<tic.Tickets> upcomingtix = [];

  List<tic.Tickets> get upcoming {
    return [...upcomingtix];
  }

  List<tic.Tickets> get expired {
    return [...expiredtix];
  }

  ticketSort() async {
    DateTime now = DateTime.now();

    List<tic.Tickets> temp1 = [];
    List<tic.Tickets> temp2 = [];
    for (tic.Tickets tix in collection) {
      DateTime date = DateFormat("yyyy-MM-dd").parse(tix.event.date);

      if (date.isAfter(now) || date.isAtSameMomentAs(now)) {
        temp1.add(tix);
      } else {
        temp2.add(tix);
      }
    }

    expiredtix = temp2;
    upcomingtix = temp1;
    // print(expiredtix);
    // print(upcomingtix);
  }
}
