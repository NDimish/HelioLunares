import 'package:flutter/material.dart';

class UserBoughtTicketScreen extends StatefulWidget {
  const UserBoughtTicketScreen({super.key});

  @override
  State<UserBoughtTicketScreen> createState() => _UserBoughtTicketScreenState();
}

class _UserBoughtTicketScreenState extends State<UserBoughtTicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
      children: <Widget> [
        
        const VerticalDivider(
            thickness: 1,
            indent: 5,
            endIndent: 0,
            color: Colors.white
        ),

        Expanded(
          flex: 2,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [

              const SizedBox(height: 10),

              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1
                      ),
                    ),
                    child: Text('Insert ticket picture here'),
                  ), 
                )
              ),



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
           
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              
              const SizedBox(height: 10),

              // Container(
              //   child: Text("Expired Tickets"),
              // ),
              const Text(
                "Expired Tickets",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 25
                ),
              ),

              const SizedBox(height: 10),

              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 47, 148, 87),
                  border: Border.all(
                    width: 10, 
                    color: const Color.fromARGB(255, 47, 148, 87)
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
              
              const SizedBox(height: 10,),
              
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 47, 148, 87),
                  border: Border.all(
                      width: 10, color: const Color.fromARGB(255, 47, 148, 87)),
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

              const SizedBox(height: 10,),

              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 47, 148, 87),
                  border: Border.all(
                      width: 10, color: const Color.fromARGB(255, 47, 148, 87)),
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

              const SizedBox(height: 10,),

              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 47, 148, 87),
                  border: Border.all(
                      width: 10, color: const Color.fromARGB(255, 47, 148, 87)),
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

              const SizedBox(height: 50,),

              const Text(
                "Upcoming Tickets",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 25
                ),
              ),

              const SizedBox(height: 10,),

              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 30, 199, 188),
                  border: Border.all(
                      width: 10, color: const Color.fromARGB(255, 30, 199, 188)),
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

              const SizedBox(height: 10,),

              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 30, 199, 188),
                  border: Border.all(
                      width: 10, color: const Color.fromARGB(255, 30, 199, 188)),
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

              const SizedBox(height: 10,),

              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 30, 199, 188),
                  border: Border.all(
                      width: 10, color: const Color.fromARGB(255, 30, 199, 188)),
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


            ]
          ),
        ),

        const VerticalDivider(
            thickness: 1,
            indent: 5,
            endIndent: 0,
            color: Colors.white
        )

      ]),
    );
  }





}


// class Item {
//   Item({
//     required this.expandedValue,
//     required this.headerValue,
//     this.isExpanded = false,
//   });

//   String expandedValue;
//   String headerValue;
//   bool isExpanded;
// }

// List<Item> generateItems(int numberOfItems) {
//   return List<Item>.generate(numberOfItems, (int index) {
//     return Item(
//       headerValue: 'Panel $index',
//       expandedValue: 'This is item number $index',
//     );
//   });
// }

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({super.key});

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   final List<Item> _data = generateItems(8);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         child: _buildPanel(),
//       ),
//     );
//   }

//   Widget _buildPanel() {
//     return ExpansionPanelList(
//       expansionCallback: (int index, bool isExpanded) {
//         setState(() {
//           _data[index].isExpanded = !isExpanded;
//         });
//       },
//       children: _data.map<ExpansionPanel>((Item item) {
//         return ExpansionPanel(
//           headerBuilder: (BuildContext context, bool isExpanded) {
//             return ListTile(
//               title: Text(item.headerValue),
//             );
//           },
//           body: ListTile(
//               title: Text(item.expandedValue),
//               subtitle:
//                   const Text('To delete this panel, tap the trash can icon'),
//               trailing: const Icon(Icons.delete),
//               onTap: () {
//                 setState(() {
//                   _data.removeWhere((Item currentItem) => item == currentItem);
//                 });
//               }),
//           isExpanded: item.isExpanded,
//         );
//       }).toList(),
//     );
//   }
// }
