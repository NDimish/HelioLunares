import 'package:flutter/material.dart';

class UserBoughtTicketScreen extends StatefulWidget {
  const UserBoughtTicketScreen({super.key});

  @override
  State<UserBoughtTicketScreen> createState() => _UserBoughtTicketScreenState();
}

class _UserBoughtTicketScreenState extends State<UserBoughtTicketScreen> {
  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Row(
  //     children: [
  //       Expanded(
  //         child: Container(
              // decoration: BoxDecoration(
              //   color: const Color.fromARGB(255, 47, 148, 87),
              //   border: Border.all(
              //       width: 10, color: const Color.fromARGB(255, 47, 148, 87)),
              //   borderRadius: BorderRadius.circular(20),
              // ),
              // child: const Text(
              //   'Hello World',
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 16,
              //   ),
              // )),
  //       ),
  //       Expanded(
  //           flex: 4,
  //             child: Column(
  //               children: [
  //                 Expanded(
  //                   child: Container(
  //                     decoration: BoxDecoration(
  //                       color: const Color.fromARGB(255, 47, 148, 87),
  //                       border: Border.all(
  //                         width: 10,
  //                         color: const Color.fromARGB(255, 47, 148, 87)
  //                       ),
  //                       borderRadius: BorderRadius.circular(20),
  //                     ),
  //                     child: const Text(
  //                       'Hello World',
  //                       style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 16,
  //                       ),
  //                     )
  //                   ),
  //                 ),
  //               ],
  //             )
  //         ),
  //     ],)
  //   );
  // }

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Row(
  //     children: [
  //       Expanded(
  //         child: Container(
  //             decoration: BoxDecoration(
  //               color: const Color.fromARGB(255, 47, 148, 87),
  //               border: Border.all(
  //                   width: 10, color: const Color.fromARGB(255, 47, 148, 87)),
  //               borderRadius: BorderRadius.circular(20),
  //             ),
  //             child: const Text(
  //               'Hello World',
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 16,
  //               ),
  //             )),
  //       ),
  //       Expanded(
  //           flex: 4,
  //           child: Container(
  //             decoration: BoxDecoration(
  //               color: const Color.fromARGB(255, 47, 148, 87),
  //               border: Border.all(
  //                 width: 10,
  //                 color: const Color.fromARGB(255, 47, 148, 87)
  //               ),
  //               borderRadius: BorderRadius.circular(20),
  //             ),
  //             child: const Text(
  //               'Hello World',
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 16,
  //               ),
  //             )
  //           ),
  //         ),
  //     ],)
  //   );
  // }

    Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
      children: <Widget> [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text('test')
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





// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Divider Sample')),
//         body: const DividerExample(),
//       ),
//     );
//   }
// }

// class DividerExample extends StatelessWidget {
//   const DividerExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: <Widget>[
//           Expanded(
//             child: Container(
//               color: Colors.amber,
//               child: const Center(
//                 child: Text('Above'),
//               ),
//             ),
//           ),
//           const Divider(
//             height: 20,
//             thickness: 5,
//             indent: 20,
//             endIndent: 0,
//             color: Colors.black,
//           ),
//           // Subheader example from Material spec.
//           // https://material.io/components/dividers#types
//           Container(
//             padding: const EdgeInsets.only(left: 20),
//             child: Align(
//               alignment: AlignmentDirectional.centerStart,
//               child: Text(
//                 'Subheader',
//                 style: Theme.of(context).textTheme.bodySmall,
//                 textAlign: TextAlign.start,
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               color: Theme.of(context).colorScheme.primary,
//               child: const Center(
//                 child: Text('Below'),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





}
