import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/routing/routes.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';
import '../../../backend_communication/dataCollector.dart';
import '../../../constants/style.dart';
import 'package:provider/provider.dart';
import '../../../widgets/circle_icon.dart';

class AddEventForm extends StatefulWidget {
  const AddEventForm({super.key});

  //const EventForm({super.key});

  @override
  State<StatefulWidget> createState() => _AddEventFormState();
}

class _AddEventFormState extends State<AddEventForm> {
  //Model
  // late Model.SocietyEvent model = Event(
  //     "name", "price", "date", "location", "duration", "description");
  //final SocietyEvent obj = Get.find<SocietyEvent>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Society society;
  //Controllers
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final dateController = TextEditingController();
  final locationController = TextEditingController();
  final durationController = TextEditingController();
  final descriptionController = TextEditingController();

  // late String finalEventName ;
  // late double finalEventPrice;
  // String finalEventDate;
  // String finalEventLocation;
  // String finalEventTime;
  // String
  late String finalEventName;
  late double finalEventPrice;
  late String finalEventDate;
  late String finalEventTime;
  late String finalEventLocation;
  late String finalEventDescription;
  late double finalEventDuration;

  final CurrencyTextInputFormatter _formatter =
      CurrencyTextInputFormatter(locale: 'en_GB');

  bool _validateName = false;
  bool _validatePrice = false;
  bool _validateDate = false;
  bool _validateLocation = false;
  bool _validateDuration = false;
  bool _validateDescription = false;

  final _formatCurrencyInput = NumberFormat.currency(
      locale: 'en_GB', name: "", symbol: "£", decimalDigits: 2);

  bool checkAllValidators() {
    //final FormState form = _formKey.currentState;
    return (!_validateName &&
            !_validatePrice &&
            !_validateDate &&
            !_validateLocation &&
            !_validateDuration &&
            !_validateDescription)
        ? true
        : false;
  }

  String getFormattedDate() {
    return "";
  }

  @override
  void initState() {
    super.initState();
    society = Get.find<Society>();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => dataCollector<Event>(filter: {})),
        ],
        builder: (context, child) {
          dataCollector<Event> eventDataProvider =
              Provider.of<dataCollector<Event>>(context);
          return Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: SingleChildScrollView(
                            child: Column(children: [
                      Row(children: [
                        CircleIcon(
                          icon: const Icon(Icons.event),
                          radius: 30,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                            child: TextFormField(
                                key: const Key("EventName"),
                                decoration: InputDecoration(
                                  errorText: _validateName
                                      ? 'Name Can\'t Be Empty'
                                      : null,
                                  labelText: "Event Name",
                                ),
                                controller: nameController,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(30)
                                ],
                                onSaved: (String? name) {
                                  finalEventName = name!;
                                  print("event name saved");
                                }))
                      ]),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(children: [
                        CircleIcon(
                          icon: const Icon(Icons.payments_outlined),
                          radius: 30,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                            child: TextFormField(
                                key: const Key("EventPrice"),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  //FilteringTextInputFormatter.digitsOnly,
                                  CurrencyTextInputFormatter(
                                    locale: 'en_GB',
                                    decimalDigits: 2,
                                    symbol: '£',
                                  ),
                                  LengthLimitingTextInputFormatter(7)
                                ],
                                decoration: InputDecoration(
                                    labelText: "Ticket Price",
                                    errorText: _validatePrice
                                        ? 'Price Can\'t Be Empty'
                                        : null),
                                controller: priceController,
                                onSaved: (String? price) {
                                  finalEventPrice =
                                      double.parse(price!.replaceAll("£", ""));
                                  print(
                                      "event price of $finalEventPrice saved");
                                }))
                      ]),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(children: [
                        CircleIcon(
                          icon: const Icon(Icons.calendar_today),
                          radius: 30,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                            child: TextFormField(
                          key: const Key("EventDate"),
                          controller: dateController,
                          onSaved: (String? date) {
                            int idx = date!.indexOf(" ");
                            List dateParts = [
                              date.substring(0, idx).trim(),
                              date.substring(idx + 1).trim()
                            ];
                            String dateToSave = dateParts[0];
                            String timeToSave = dateParts[1];
                            print(
                                "event date is $dateToSave with time $timeToSave  saved");
                            finalEventDate = dateToSave;
                            finalEventTime = timeToSave;
                          },
                          decoration: InputDecoration(
                              errorText:
                                  _validateDate ? 'Date Can\'t Be Empty' : null,
                              //icon of text field
                              labelText: "Enter Date"),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                builder: (context, child) {
                                  return Theme(
                                    data: ThemeData.light().copyWith(
                                      colorScheme:
                                          const ColorScheme.light().copyWith(
                                        primary: MyColours.navButtonColour,
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2100));
                            // ignore: use_build_context_synchronously
                            TimeOfDay? pickedTime = await showTimePicker(
                              builder: (context, child) {
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                    colorScheme:
                                        const ColorScheme.light().copyWith(
                                      primary: MyColours.navButtonColour,
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (pickedDate != null && pickedTime != null) {
                              print(
                                  '$pickedDate $pickedTime'); //pickedDate output format => 2021-03-10 00:00:00.000

                              //Create DateTime
                              DateTime pickedDateTime = DateTime(
                                  pickedDate.year,
                                  pickedDate.month,
                                  pickedDate.day,
                                  pickedTime.hour,
                                  pickedTime.minute);

                              String formattedDate =
                                  DateFormat('yyyy-MM-dd HH:mm')
                                      .format(pickedDateTime);

                              setState(() {
                                dateController.text =
                                    (formattedDate); //set output date to TextFormField value.
                              });
                            } else {}
                          },
                        ))
                      ]),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(children: [
                        CircleIcon(
                          icon: const Icon(Icons.location_on_outlined),
                          radius: 30,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                            child: TextFormField(
                                key: const Key("EventLocation"),
                                decoration: InputDecoration(
                                    labelText: "Event Location",
                                    errorText: _validateLocation
                                        ? 'Location Can\'t Be Empty'
                                        : null),
                                controller: locationController,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(30)
                                ],
                                onSaved: (String? location) {
                                  finalEventLocation = location!;
                                  print("event location saved");
                                }))
                      ]),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(children: [
                        CircleIcon(
                          icon: const Icon(Icons.timer),
                          radius: 30,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                            child: TextFormField(
                                key: const Key("EventDuration"),
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      int.parse(value) <= 0) {
                                    _validateDuration = true;
                                    return 'Duration Can\'t Be Empty';
                                  }
                                  _validateDuration = false;
                                  return null;
                                },
                                decoration: InputDecoration(
                                    errorText: _validateDuration
                                        ? 'Duration Can\'t Be Empty'
                                        : null,
                                    labelText: "Event Duration",
                                    suffixText: "mins"),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(3)
                                ],
                                controller: durationController,
                                onSaved: (String? duration) {
                                  finalEventDuration = double.parse(duration!);
                                  print("event duration saved");
                                }))
                      ]),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(children: [
                        CircleIcon(
                          icon: const Icon(Icons.description),
                          radius: 30,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                            child: TextFormField(
                                key: const Key("EventDescription"),
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(500)
                                ],
                                decoration: InputDecoration(
                                  errorText: _validateDescription
                                      ? 'Description Can\'t Be Empty'
                                      : null,
                                  labelText: "Event Description",
                                ),
                                controller: descriptionController,
                                onSaved: (String? description) {
                                  finalEventDescription = description!;
                                  print("event description saved");
                                }))
                      ]),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            )),
                            padding: const MaterialStatePropertyAll(
                                EdgeInsets.all(20)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                MyColours.navButtonColour.withOpacity(0.5))),
                        onPressed: () async {
                          _formKey.currentState!.validate();
                          setState(
                            () {
                              nameController.text.isEmpty
                                  ? _validateName = true
                                  : _validateName = false;
                              (priceController.text.isEmpty ||
                                      priceController.text == "£0.00")
                                  ? _validatePrice = true
                                  : _validatePrice = false;
                              dateController.text.isEmpty
                                  ? _validateDate = true
                                  : _validateDate = false;

                              locationController.text.isEmpty
                                  ? _validateLocation = true
                                  : _validateLocation = false;

                              // durationController.text.isEmpty
                              //     ? _validateDuration = true
                              //     : _validateDuration = false;
                              descriptionController.text.isEmpty
                                  ? _validateDescription = true
                                  : _validateDescription = false;
                            },
                          );
                          if (checkAllValidators() &&
                              _formKey.currentState!.validate()) {
                            //SAVE EVENT MODEL FIELDS & ADD TO DB
                            _formKey.currentState?.save();
                            //UNCOMMENT ONCE IMPLEMENTED :
                            //data.dataCollector<SocietyEvent> collector = data.dataCollector<SocietyEvent>();
                            //collector.addToCollection(model);
                            //GET THE CREATE TIME
                            DateTime now = DateTime.now();
                            String createDate =
                                DateFormat('yyyy-MM-dd – kk:mm').format(now);
                            //MAKE A NEW EVENT OBJ
                            Event event = Event(
                                create_time: createDate,
                                date: finalEventDate,
                                time: finalEventTime,
                                description: finalEventDescription,
                                duration: finalEventDuration,
                                price: finalEventPrice,
                                society: society,
                                attendance: 0,
                                title: finalEventName,
                                update_time: createDate,
                                venue: finalEventLocation,
                                id: 0);

                            bool a =
                                await eventDataProvider.addToCollection(event);
                            //GO TO MAIN EVENTS PAGE
                            navigationController
                                .navigateTo(societyEventsPageDisplayName);
                          } else {
                            print("input error");
                          }
                        },
                        child: const CustomText(
                          colour: Colors.white,
                          text: "Save",
                          size: 24,
                          weight: FontWeight.bold,
                        ),
                      )
                    ])))
                  ]));
        });
  }
}
