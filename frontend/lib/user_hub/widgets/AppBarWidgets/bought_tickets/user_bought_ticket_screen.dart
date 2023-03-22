import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/bought_tickets/buy_ticket_screen.dart';
import '../../../../backend_communication/authenticate.dart';
import '../../../../backend_communication/dataCollector.dart' as data;
import 'package:university_ticketing_system/backend_communication/models/Ticket.dart' as tic;
import 'package:university_ticketing_system/backend_communication/models/all.dart';

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
          create: (context) => data.dataCollector<tic.Tickets>(
            filter: widget.filter, order: widget.Orderby)),
      ],
      builder: (context, child) {
        
        return Scaffold(
          backgroundColor: const Color(0xFFC8B8D8), body: _buildPanel(context));
      }
    );
  }


  // Widget _buildPanel(BuildContext context) {
  //   final DataP = Provider.of<data.dataCollector<tic.Tickets>>(context);
  //   return Row(children: <Widget>[
  //     Container(
  //       color: const Color(0xFF8C7099),
  //       child: const VerticalDivider(
  //           thickness: 1, indent: 1, endIndent: 0, color: Color(0xFF8C7099)),
  //     ),

  //     // right of screen
  //     Expanded(
  //       flex: 5,
  //       // ignore: avoid_unnecessary_containers
  //       child: Padding(
  //         padding: const EdgeInsets.all(20.0),
  //         child: Container(
            
            
  //           child: ListView.builder(
  //             shrinkWrap: true,
  //             itemCount: DataP.collection.length,
  //             itemBuilder: (BuildContext context, int index) {
  //               return Column(
  //                 crossAxisAlignment: CrossAxisAlignment.stretch,
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [



  //                   const SizedBox(height: 10),



  //                   _buildCollapsible(context),



  //                   const SizedBox(height: 50),



  //                   const Text(
  //                     "Upcoming Tickets",
  //                     textAlign: TextAlign.left,
  //                     style: TextStyle(fontSize: 25),
  //                   ),



  //                   const SizedBox(height: 10),



  //                   _OnHover(
  //                     child: OutlinedButton(
  //                       style: OutlinedButton.styleFrom(
  //                         backgroundColor: const Color(0xFFE8DAFA),
  //                         side: const BorderSide(color: Colors.black)
  //                       ),
                        
  //                       onPressed: () {
  //                         Navigator.push(
  //                           context,
  //                           MaterialPageRoute(
  //                             builder: (context) => const BuyTicketScreen()
  //                           )
  //                         );
  //                       },
                        
  //                       child: Container(
  //                         height: 55,
  //                         decoration: BoxDecoration(
  //                           border: Border.all(
  //                             width: 10,
  //                             color: Colors.transparent,
  //                           ),
  //                           borderRadius: BorderRadius.circular(20),
  //                         ),
                          
  //                         child: Row(
  //                           children: [
  //                             Expanded(
  //                               child: Text(
  //                                 "${DataP.collection[index].event.title}",
  //                                 textAlign: TextAlign.left,
  //                                 selectionColor: Colors.black,
  //                               ),
  //                             )
  //                           ],
  //                         ),
  //                       ),
  //                     )
  //                   ),
                  
                  
  //                 ],
  //               );
  //             },
  //           ),
  //         ),
  //       ),
  //     ),
  //   ]);
  // }

  Widget _buildPanel(BuildContext context) {
    final DataP = Provider.of<data.dataCollector<tic.Tickets>>(context);
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
                    "Upcoming Tickets",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 25),
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



  Widget _buildUpcomingTix (BuildContext context){
    final DataP = Provider.of<data.dataCollector<tic.Tickets>>(context);
    return Container(
      height: 577,
      alignment: Alignment.bottomCenter,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: DataP.collection.length,
        itemBuilder: (BuildContext context, int index){
          return Expanded(
            child: Column(
              children: [
                _OnHover(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFFE8DAFA),
                      side: const BorderSide(color: Colors.black)
                    ),
                    
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BuyTicketScreen(id:DataP.collection[index].id)
                        )
                      );
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
                              "${DataP.collection[index].event.title}",
                              // DataP.collection[index].event.title,
                              textAlign: TextAlign.left,
                              selectionColor: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ),
          
                const SizedBox(height: 20),
              ]
            ),
          );
        }
      ),
    );
  }

  Widget _buildCollapsible(BuildContext context) {
    final DataP = Provider.of<data.dataCollector<tic.Tickets>>(context); 
    // print(DataP.collection[0].event.date);
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
          
          body: SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: DataP.collection.length,
              itemBuilder: (BuildContext context, int index) {
              // children: [
          
                return Column(
                    children: [
                      _OnHover(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFFE8DAFA),
                            side: const BorderSide(color: Colors.black)
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BuyTicketScreen(id:DataP.collection[index].id)));
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
                                    "${DataP.collection[index].event.title}",
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
