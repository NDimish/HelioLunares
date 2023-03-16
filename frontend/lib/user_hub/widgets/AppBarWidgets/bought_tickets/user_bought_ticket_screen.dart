import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/bought_tickets/buy_ticket_screen.dart';
import '../../../../backend_communication/authenticate.dart';
import '../../../../backend_communication/dataCollector.dart' as data;

class UserBoughtTicketScreen extends StatefulWidget {
  final data.OrderType Orderby;
  final Map<String,String> filter;
  // final int id;

  const UserBoughtTicketScreen(
      {Key? key,
      this.Orderby = data.OrderType.CHRONOLOGICAL,
      this.filter = const{},
      // this.id = -1
      }
    )
      : super(key: key);

  // const UserBoughtTicketScreen({Key? key}) : super(key: key);

  @override
  State<UserBoughtTicketScreen> createState() => _UserBoughtTicketScreenState();
}

class _UserBoughtTicketScreenState extends State<UserBoughtTicketScreen> {
  final List<Item> _data = generateItems(1);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => data.dataCollector<data.Event>(
            filter: widget.filter, order: widget.Orderby)),
      ],
      builder: (context, child) {
        
        return Scaffold(
          backgroundColor: const Color(0xFFC8B8D8), body: _buildPanel(context));
      }
    );
  }

  // Widget leftbuild(BuildContext context, int id){
  //   return ChangeNotifierProvider(
  //         create: (context) => data.dataCollector<data.Event>(
  //           ID:id),
  //       builder:(context,child){

  //       }
  //       );
  // }

  Widget _buildPanel(BuildContext context) {
    final DataP = Provider.of<data.dataCollector<data.Event>>(context);
    return Row(children: <Widget>[
      Container(
        color: const Color(0xFF8C7099),
        child: const VerticalDivider(
            thickness: 1, indent: 1, endIndent: 0, color: Color(0xFF8C7099)),
      ),

      // left side of the screen
      Expanded(
        flex: 2,
        child: Container(
          color: const Color(0xFF8C7099),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // // left up screen
              // Expanded(
              //   flex: 3,
              //     child: Padding(
              //       padding: const EdgeInsets.all(5.0),
              //       child: Container(
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: Colors.black,
              //             width: 1
              //           ),
              //         ),
              //         child: Text('Insert picture here'),
              //       ),
              //     )
              // ),

              Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: const Text('Insert event poster here'),
                    ),
                  )),

              // left bottom of screen
              Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),

                      const Text(
                        "Ticket Overview",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 25,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold),
                      ),

                      Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: const Color(0xFFB08BBB),
                              border: Border.all(
                                  width: 10, color: const Color(0xFF8C7099)),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '  Title: '
                                  
                                  // textAlign: TextAlign.left,
                                  // style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          )),

                      const SizedBox(
                        height: 10,
                      ),

                      // Container(
                      //     height: 60,
                      //     decoration: BoxDecoration(
                      //         color: const Color(0xFFB08BBB),
                      //         border: Border.all(
                      //             width: 10, color: const Color(0xFF8C7099)),
                      //         borderRadius: BorderRadius.circular(20)),
                      //     child: Row(
                      //       children: const [
                      //         Expanded(
                      //           child: Text(
                      //             '  Date: '
                      //              + DataP.collection[index].date,
                      //             textAlign: TextAlign.left,
                      //             style: TextStyle(fontSize: 20),
                      //           ),
                      //         ),
                      //       ],
                      //     )),

                      // Container(
                      //     height: 60,
                      //     decoration: BoxDecoration(
                      //         color: const Color(0xFFB08BBB),
                      //         border: Border.all(
                      //             width: 10, color: const Color(0xFF8C7099)),
                      //         borderRadius: BorderRadius.circular(20)),
                      //     child: Row(
                      //       children: const [
                      //         Expanded(
                      //           child: Text(
                      //             '  Venue: '
                      //              + DataP.collection[index].venue,
                      //             textAlign: TextAlign.left,
                      //             style: TextStyle(fontSize: 20),
                      //           ),
                      //         ),
                      //       ],
                      //     )),

                      // Container(
                      //     height: 60,
                      //     decoration: BoxDecoration(
                      //         color: const Color(0xFFB08BBB),
                      //         border: Border.all(
                      //             width: 10, color: const Color(0xFF8C7099)),
                      //         borderRadius: BorderRadius.circular(20)),
                      //     child: Row(
                      //       children: const [
                      //         Expanded(
                      //           child: Text(
                      //             '  Seat: ',
                      //              + DataP.collection[index].seat,
                      //             textAlign: TextAlign.left,
                      //             style: TextStyle(fontSize: 20),
                      //           ),
                      //         ),
                      //       ],
                      //     )),

                      // Container(
                      //   height: 60,
                      //   decoration: BoxDecoration(
                      //     color: Color(0xFFB08BBB),
                      //     border: Border.all(
                      //       width: 10,
                      //       color: Color(0xFF8C7099)
                      //     ),
                      //     borderRadius: BorderRadius.circular(20)
                      //   ),
                      //   child: Row(
                      //     children: const [
                      //       Expanded(
                      //           child: Text (
                      //             '  Gate: ',
                      //             //  + DataP.collection[index].gate,
                      //             textAlign: TextAlign.left,
                      //             style: TextStyle(
                      //               fontSize: 20
                      //             ),
                      //           ),
                      //       ),
                      //     ],
                      //   )

                      // ),

                      // Container(
                      //     height: 60,
                      //     decoration: BoxDecoration(
                      //         color: const Color(0xFFB08BBB),
                      //         border: Border.all(
                      //             width: 10, color: const Color(0xFF8C7099)),
                      //         borderRadius: BorderRadius.circular(20)),
                      //     child: Row(
                      //       children: const [
                      //         Expanded(
                      //           child: Text(
                      //             '  Description: '
                      //              + DataP.collection[index].description,
                      //             textAlign: TextAlign.left,
                      //             style: TextStyle(fontSize: 20),
                      //           ),
                      //         ),
                      //       ],
                      //     )),
                    ],
                  ))
            ],
          ),
        ),
      ),

      // Container(
      //   decoration: const BoxDecoration(
      //     gradient: LinearGradient(
      //       colors: [
      //         Color(0xFF70587C),
      //         Color(0xFFC8B8D8)
      //       ]
      //     ),
      //   ),
      //     child: const VerticalDivider(
      //       thickness: 1,
      //       indent: 5,
      //       endIndent: 5,
      //       color: Colors.black
      //     ),

      // ),

      // right of screen
      Expanded(
        flex: 5,
        // ignore: avoid_unnecessary_containers
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            // color:Colors.amberAccent,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: DataP.collection.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                _buildCollapsible(context),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Upcoming Tickets",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 10,
                ),
                _OnHover(
                    child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFFE8DAFA),
                      side: const BorderSide(color: Colors.black)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BuyTicketScreen()));
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
                      children:  [
                        // Expanded(
                        //   child: Text(
                        //     'Venue',
                        //     textAlign: TextAlign.right,
                        //     selectionColor: Colors.black,
                        //   ),
                        // ),
                        // Expanded(
                        //   child: Text(
                        //     'Date',
                        //     textAlign: TextAlign.center,
                        //     selectionColor: Colors.black,
                        //   ),
                        // ),
                        Expanded(
                          child: Text(
                            "${DataP.collection[index].title}",
                            textAlign: TextAlign.left,
                            selectionColor: Colors.black,
                          ),
                        )

                      ],
                    ),
                  ),
                )),
              ],
                );
              },
            ),
          ),
        ),
      ),
    ]);
  }

  Widget _buildCollapsible(BuildContext context) {
    final DataP = Provider.of<data.dataCollector<data.Event>>(context);
    return ExpansionPanelList(
      elevation: 0,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          backgroundColor: const Color(0xFFC8B8D8),
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              contentPadding: const EdgeInsets.all(0),
              hoverColor: const Color(0xFFC8B8D8),
              title: Text(
                item.headerValue,
                style: const TextStyle(
                    fontFamily: 'Arvo', color: Colors.black, fontSize: 25),
              ),
            );
          },
          body:ListView.builder(
              shrinkWrap: true,
              itemCount: 3, //DataP.collection.length,
              itemBuilder: (BuildContext context, int index) {
            children: [
              _OnHover(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFFE8DAFA),
                      side: const BorderSide(color: Colors.black)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BuyTicketScreen()));
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
                        // Expanded(
                        //   child: Text(
                        //     'Venue',
                        //     textAlign: TextAlign.right,
                        //     selectionColor: Colors.black,
                        //   ),
                        // ),
                        Expanded(
                          child: Text(
                            "${index}",
                            //"${DataP.collection[index].title}",
                            textAlign: TextAlign.left,
                            selectionColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
              },
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
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
