import 'package:flutter/material.dart';
import 'package:university_ticketing_system/screens/buy_ticket_screen.dart';
import 'package:provider/provider.dart';


class UserBoughtTicketScreen extends StatefulWidget {
  const UserBoughtTicketScreen({Key? key}) : super(key: key);

  @override
  State<UserBoughtTicketScreen> createState() => _UserBoughtTicketScreenState();
}

class _UserBoughtTicketScreenState extends State<UserBoughtTicketScreen> {
  final List<Item> _data = generateItems(1);

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   builder: (context) {
        return Scaffold(
          body: _buildPanel()
        );
      // }
    // );
  }

  Widget _buildPanel() {
    return Row(
      children: <Widget> [
        
        const VerticalDivider(
            thickness: 1,
            indent: 5,
            endIndent: 0,
            color: Colors.white
        ),

        
          // left side of the screen
        Expanded(
          flex: 2,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [

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
                      border: Border.all(
                        color: Colors.black,
                        width: 1
                      ),
                    ),
                    child: const Text('Insert picture here'),
                  ), 
                )
              ),


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
                    fontWeight: FontWeight.bold

                  ),
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
                )
              )

            

              
              

            ],
          ),
        ),
        

        const VerticalDivider(
            thickness: 1,
            indent: 5,
            endIndent: 0,
            color: Colors.black
        ),
           
        // right of screen
        Expanded(
          flex: 5,
          // ignore: avoid_unnecessary_containers
          child: Container(
            // color:Colors.amberAccent,  
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                
                _buildCollapsible(),


                const SizedBox(height: 50,),


                const Text(
                  "  Upcoming Tickets",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 25
                  ),
                ),

                const SizedBox(height: 10,),

                _OnHover (
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.black
                      )
                    ),
                    onPressed: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => const BuyTicketScreen())
                      );
                    }, 
                    child: Container(
                      decoration: BoxDecoration(
                        // color: const Color.fromARGB(255, 30, 199, 188),
                        border: Border.all(
                            width: 10, 
                            color: Colors.transparent,
                          ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text (
                              'Venue', 
                              textAlign: TextAlign.right,
                              selectionColor: Colors.black,
                            ),
                          ),
                          Expanded(
                            child: Text (
                              'Date', 
                              textAlign: TextAlign.center,
                              selectionColor: Colors.black,
                            ),
                          ),
                          Expanded(
                            child: Text (
                              'Ticket 2', 
                              textAlign: TextAlign.left,
                              selectionColor: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  )                  
                ),


              ],
            ),
          ),
        ),

              

        const VerticalDivider(
          thickness: 1,
          indent: 5,
          endIndent: 0,
          color: Colors.white
        )
      ]     
    );
  }



  Widget _buildCollapsible() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          backgroundColor: Colors.deepPurpleAccent,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                item.headerValue,
                style: const TextStyle(
                  fontSize: 25
                ),
              ),
            );
          },

          body: Column(
            children: [
              
              const SizedBox(height: 10),

              _OnHover( 
                child: OutlinedButton (
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.black
                    )
                  ),
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const BuyTicketScreen())
                    );
                  }, 
                  child: Container(
                    decoration: BoxDecoration(
                      // color: const Color.fromARGB(255, 47, 148, 87),
                      border: Border.all(
                        width: 10, 
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text ('Venue', textAlign: TextAlign.right),
                        ),
                        Expanded(
                          child: Text ('Date', textAlign: TextAlign.center),
                        ),
                        Expanded(
                          child: Text ('Ticket 1', textAlign: TextAlign.left),
                        )
                      ],
                    )
                  ),
                ),
              ),
              


             
            ],
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

  const _OnHover({
    Key? key,
    required this.child}) : super(key:key);

  @override
  State<_OnHover> createState() => _OnHoverState();
}

class _OnHoverState extends State<_OnHover> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {

    
    final hoveredTransform = Matrix4.identity()..scale(1.05);
    final transform = isHovered ? hoveredTransform: Matrix4.identity();
    
    
    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        transform: transform,
        child: widget.child
      )
      
  

    );
  }

  void onEntered(bool isHovered){
    setState(() {
      this.isHovered = isHovered;
    });
  }
}


