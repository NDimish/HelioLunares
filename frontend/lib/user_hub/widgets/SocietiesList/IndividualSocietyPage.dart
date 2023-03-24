import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/EventsListPage.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/widgets/LoeButton.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/widgets/SocietyBanner.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/widgets/SocietyButton.dart';

import '../../../backend_communication/dataCollector.dart';
import '../../../gradient_animation.dart';
import '../../../helpers/responsiveness.dart';
import '../EventsList/widgets/IndividualPageHeader.dart';
import 'package:university_ticketing_system/globals.dart' as global;

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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => dataCollector<Society>(ID: widget.socId),
          ),
          ChangeNotifierProvider(
            create: (context) => dataCollector<SocietyRole>(filter: {
              'user_at_society': global.localdataobj.getUserID().toString(),
              'society': widget.socId.toString()
            }),
          ),
          ChangeNotifierProvider(
            create: (context) => followerCounterProvider(
                filter: {'society': widget.socId.toString()}),
          )
        ],
        builder: (context, child) {
          final DataP = Provider.of<dataCollector<Society>>(context);
          final DataRole = Provider.of<dataCollector<SocietyRole>>(context);
          final followercount = Provider.of<followerCounterProvider>(context);

          hasJoined = (DataRole.collection.length != 0);


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
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SocietyBanner(
                        
                          imageLink:
                              ("${global.DATASOURCE}${DataP.collection[0].image}")),
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
                                  followercount.collection.length.toString(),
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
                                    SocietyButton(
                                      hasJoined: hasJoined,
                                      socId: widget.socId,
                                    ),
                              
                                    SizedBox(height: 10),

                                    ListButton(
                                      onPressed: () => Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  SocietyEventsList(
                                                    societyName:
                                                        DataP.collection[0],
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

class followerCounterProvider extends dataCollector<SocietyRole> {
  followerCounterProvider({super.filter}) : super();
}


