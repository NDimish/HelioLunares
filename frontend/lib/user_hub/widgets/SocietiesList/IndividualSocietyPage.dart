import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/backend_communication/societyfunctions.dart';

import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/EventsListPage.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/widgets/SocietyBanner.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/widgets/SocietyButton.dart';

import '../../../backend_communication/dataCollector.dart';
import '../../../gradient_animation.dart';
import '../../../helpers/responsiveness.dart';
import '../EventsList/widgets/IndividualPageHeader.dart';
import 'package:http/http.dart' as http;

class MainSocietyPage extends StatefulWidget {
  final String societyName;
  final String societyDescription;
  final String societyUni;
  final String numberOfFollowers;
  final int socId;

  const MainSocietyPage({
    Key? key,
    required this.societyName,
    required this.societyDescription,
    required this.societyUni,
    required this.numberOfFollowers,
    required this.socId,
  }) : super(key: key);

  @override
  State<MainSocietyPage> createState() => _MainSocietyPageState();
}

@override
class _MainSocietyPageState extends State<MainSocietyPage> {
  final x = 0;
  bool hasJoined = true;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => dataCollector<Society>(ID: widget.socId),
        builder: (context, child) {
          final DataP = Provider.of<dataCollector<Society>>(context);
          return Scaffold(
            appBar: AppBar(
                title: Text(
              DataP.collection[0].name,
              style: const TextStyle(
                  fontFamily: "Arvo", fontWeight: FontWeight.bold),
            )),
            body: CustomLinearGradient(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 24.0, right: 32.0, left: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: SocietyBanner(
                          imageLink:
                              "https://avatars.githubusercontent.com/u/32419965?v=4"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Card(
                        elevation: 0,
                        color: Colors.white.withOpacity(0.7),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                DataP.collection[0].name,
                                style: TextStyle(
                                    fontFamily: "Arvo",
                                    fontSize:
                                        ResponsiveWidget.isSmallScreen(context)
                                            ? 24
                                            : 40),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Flex(
                      mainAxisAlignment: MainAxisAlignment.center,
                      direction: ResponsiveWidget.isSmallScreen(context)
                          ? Axis.vertical
                          : Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white.withOpacity(0.7),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 6.0,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const IndividualPageHeader(
                                    headerName: "University",
                                    headerIcon: Icon(
                                      Icons.location_on,
                                      color: Colors.grey,
                                    )),
                                const SizedBox(height: 10.0),
                                Text(
                                  DataP.collection[0].university.name,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                const IndividualPageHeader(
                                    headerName: 'Number of Followers',
                                    headerIcon: Icon(
                                      Icons.people,
                                      color: Colors.grey,
                                    )),
                                const SizedBox(height: 10.0),
                                Text(
                                  widget.numberOfFollowers,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white.withOpacity(0.7),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 6.0,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Actions",
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Arvo"),
                                ),
                                const SizedBox(height: 10.0),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: hasJoined
                                          ? SocietyButton(
                                              buttonText: "Leave",
                                              onPressed: () async {
                                                http.Response leave_repo =
                                                    await leaveSociety(
                                                        widget.socId);
                                                if (leave_repo.statusCode ==
                                                    201) {
                                                  //Joined society
                                                  AlertDialog(
                                                    content: const Text(
                                                        'You have "joined" successfully!'),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context,
                                                                'Confirm'),
                                                        child: const Text(
                                                            'Confirm'),
                                                      ),
                                                    ],
                                                  );
                                                } else {
                                                  //Failed to join society
                                                  AlertDialog(
                                                    content: const Text(
                                                        'You have failed to join society.'),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context,
                                                                'Confirm'),
                                                        child: const Text(
                                                            'Confirm'),
                                                      ),
                                                    ],
                                                  );
                                                }
                                              })
                                          : SocietyButton(
                                              buttonText: "Join",
                                              onPressed: () async {
                                                http.Response join_repo =
                                                    await joinSociety(
                                                        widget.socId);
                                                if (join_repo.statusCode ==
                                                    201) {
                                                  //Joined society
                                                  AlertDialog(
                                                    content: const Text(
                                                        'You have "joined" successfully!'),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context,
                                                                'Confirm'),
                                                        child: const Text(
                                                            'Confirm'),
                                                      ),
                                                    ],
                                                  );
                                                } else {
                                                  //Failed to join society
                                                  AlertDialog(
                                                    content: const Text(
                                                        'You have failed to join society.'),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context,
                                                                'Confirm'),
                                                        child: const Text(
                                                            'Confirm'),
                                                      ),
                                                    ],
                                                  );
                                                }
                                              }),
                                    ),
                                    SocietyButton(
                                      onPressed: () => Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  SocietyEventsList(
                                                    societyName: DataP
                                                        .collection[0],
                                                  ))),
                                      buttonText: "List of Events",
                                    ),
                                    !ResponsiveWidget.isSmallScreen(context)
                                        ? const SizedBox()
                                        : ElevatedButton(
                                            onPressed: () => showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                title: const Text(
                                                  'Society Info',
                                                  style: const TextStyle(
                                                      fontFamily: "Arvo",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 24),
                                                ),
                                                content: Text(
                                                  DataP.collection[0]
                                                      .description,
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () => {
                                                      Navigator.pop(
                                                          context, 'Return'),
                                                    },
                                                    child: const Text('Return'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            child: const Text("Details"),
                                            style: const ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll<
                                                      Color>(Color(0xffC8A2C8)),
                                            ),
                                          ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    ResponsiveWidget.isSmallScreen(context)
                        ? const SizedBox()
                        : Padding(
                            padding: EdgeInsets.only(
                                left: ResponsiveWidget.isMediumScreen(context)
                                    ? 30
                                    : 200,
                                right: ResponsiveWidget.isMediumScreen(context)
                                    ? 30
                                    : 200),
                            child: Card(
                              elevation: 0,
                              color: Colors.white.withOpacity(0.7),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Further Information',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Divider(),
                                      ResponsiveWidget.isMediumScreen(context)
                                          ? const SizedBox()
                                          : Text(
                                              DataP.collection[0].description,
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                    ]),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}



//join society call url in backend
//201 - joined the society
//400 - already joined
//anything else - error




//join button 


                    
//list of events button 

