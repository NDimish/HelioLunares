import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';
import '../../../backend_communication/models/Event.dart';
import '../../../constants/style.dart';
import '../../../backend_communication/authenticate.dart';
import '../../../backend_communication/dataCollector.dart';
import '../../../backend_communication/models/SocietyEvent.dart' as Model;
import 'package:provider/provider.dart';

import '../../../widgets/circle_icon.dart';
import 'delete_event_confirmation.dart';

class EventForm extends StatefulWidget {
  const EventForm({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  //GET THE DATA PROVIDER

  // final dataCollector<Event> eventDataProvider =
  //     Get.find<dataCollector<Event>>();
  bool _isSaved = false;
  final Event event = Get.find<Event>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //Controllers
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final dateController = TextEditingController();
  final locationController = TextEditingController();
  final durationController = TextEditingController();
  final descriptionController = TextEditingController();

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

  Future<bool> saveData(
      dataCollector<Event> provider, Event eventToUpdate) async {
    if (checkAllValidators()) {
      print("trying update");
      print(provider.collection.length);
      bool result = await provider.updateCollection(eventToUpdate);

      return result;
    }
    print("no");
    return false;
  }

  Future<void> _submitForm(
      dataCollector<Event> provider, Event eventToUpdate) async {
    bool result = await saveData(provider, eventToUpdate);
    setState(() {
      _isSaved = result;
    });
  }

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

  //populate the fields with current event details
  @override
  void initState() {
    // getProvider(context);
    nameController.text = event.title;
    //.format function requires int not string
    priceController.text = _formatCurrencyInput.format(event.price);
    dateController.text =
        DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse(event.date));
    locationController.text = event.venue;
    durationController.text = event.duration.toString();
    descriptionController.text = event.description;

    return super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //getProvider(context);
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
              child: Column(children: [
                Expanded(
                    child: SingleChildScrollView(
                        child: Column(
                  children: [
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
                              onSaved: (String? title) {
                                event.setTitle(title!);
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
                                      ? 'Value Can\'t Be Empty'
                                      : null),
                              controller: priceController,
                              onSaved: (String? price) {
                                event.setPrice(
                                    double.parse(price!.replaceAll("£", "")));
                                print("event price of ${event.price} saved");
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
                        controller: dateController,
                        onSaved: (String? date) {
                          //finalEventDate = date!;
                          int idx = date!.indexOf(" ");
                          List dateParts = [
                            date.substring(0, idx).trim(),
                            date.substring(idx + 1).trim()
                          ];
                          String dateToSave = dateParts[0];
                          String timeToSave = dateParts[1];
                          print(
                              "event date is $dateToSave with time $timeToSave  saved");

                          event.setDate(dateToSave);
                          event.setTime(timeToSave);
                        },
                        decoration: InputDecoration(
                            errorText:
                                _validateDate ? 'Date Can\'t Be Empty' : null,
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
                                '$pickedDate,$pickedTime'); //pickedDate output format => 2021-03-10 00:00:00.000

                            //Create DateTime
                            DateTime pickedDateTime = DateTime(
                              pickedDate.year,
                              pickedDate.month,
                              pickedDate.day,
                            );

                            String formatttedTime = DateFormat("HH:mm").format(
                                DateTime(pickedTime.hour, pickedTime.minute));

                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDateTime);
                            print(
                                "$formattedDate and $formatttedTime"); //formatted date output using intl package =>  2021-03-16
                            setState(() {
                              dateController.text =
                                  ("$formattedDate $formatttedTime"); //set output date to TextFormField value.
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
                                event.setVenue(location!);
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
                              onSaved: (String? duration) {
                                event.setDuration(double.parse(duration!));
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
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(500)
                              ],
                              decoration: InputDecoration(
                                errorText: _validateDescription
                                    ? 'Value Can\'t Be Empty'
                                    : null,
                                labelText: "Event Description",
                              ),
                              controller: descriptionController,
                              onSaved: (String? description) {
                                event.setDescription(description!);
                                print("event description saved");
                              }))
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                        onPressed: () {
                          DeleteEventConfirmation(event: event)
                              .showAlertDialog(context);
                        },
                        child: const CustomText(
                          colour: Colors.red,
                          text: "Delete",
                          size: 24,
                          weight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            )),
                            padding: const MaterialStatePropertyAll(
                                EdgeInsets.all(20)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                MyColours.navButtonColour.withOpacity(0.5))),
                        onPressed: () {
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
                              durationController.text.isEmpty
                                  ? _validateDuration = true
                                  : _validateDuration = false;
                              descriptionController.text.isEmpty
                                  ? _validateDescription = true
                                  : _validateDescription = false;
                            },
                          );
                          if (checkAllValidators() &&
                              _formKey.currentState!.validate()) {
                            _formKey.currentState?.save();

                            print(
                                "EVENT ID IS ${event.id} UPDATED EVENT ${event.title} AND COSTS ${event.price} "
                                "AND IS AT ${event.date} AT ${event.time} AT ${event.venue} AND LASTS  ${event.duration} MINS "
                                " AND DESCRIPTION IS ${event.description}");
                            _submitForm(eventDataProvider, event);

                            // Get.put(event);

                            // navigationController.goBack();

                            // navigationController.refresh();
                            // navigationController.goBack();
                            // navigationController.refresh();

                            /**
                   * UPDATE THE EVENT event 
                   */
                          } else {
                            print("input error");
                          }
                          _isSaved ? print("Save successful") : print("fail");
                        },
                        child: const CustomText(
                          colour: Colors.white,
                          text: "Save",
                          size: 24,
                          weight: FontWeight.bold,
                        ),
                      )
                    ])
                  ],
                )))
              ]));
        });
  }
}
