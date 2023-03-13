import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/backend_communication/models/society_event.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';
import '../../../constants/style.dart';
import '../../../backend_communication/authenticate.dart';
import '../../../backend_communication/dataCollector.dart' as data;
import '../../../backend_communication/models/society_event.dart' as Model;
import 'package:provider/provider.dart';

class EventForm extends StatefulWidget {
  const EventForm({super.key});

  @override
  State<StatefulWidget> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final SocietyEvent model = Get.find<SocietyEvent>();
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
    nameController.text = model.name;
    //.format function requires int not string
    priceController.text =
        _formatCurrencyInput.format(double.parse(model.price));
    dateController.text =
        DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse(model.date));
    locationController.text = model.location;
    durationController.text = model.duration;
    descriptionController.text = model.description;
    return super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          Expanded(
              child: SingleChildScrollView(
                  child: Column(children: [
            TextFormField(
                decoration: InputDecoration(
                    errorText: _validateName ? 'Name Can\'t Be Empty' : null,
                    labelText: "Event Name",
                    icon: const Icon(Icons.event)),
                controller: nameController,
                onSaved: (String? name) {
                  model.name = name!;
                  print("event name saved");
                }),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  //FilteringTextInputFormatter.digitsOnly,
                  CurrencyTextInputFormatter(
                    locale: 'en_GB',
                    decimalDigits: 2,
                    symbol: '£',
                  ),
                ],
                decoration: InputDecoration(
                    icon: const Icon(Icons.payments_outlined),
                    labelText: "Ticket Price",
                    errorText: _validatePrice ? 'Value Can\'t Be Empty' : null),
                controller: priceController,
                onSaved: (String? price) {
                  model.price = price!.replaceAll("£", "");
                  print("event price of ${model.price} saved");
                }),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: dateController,
              onSaved: (String? date) {
                model.date = date!;
                print("event date is $date  saved");
              },
              decoration: InputDecoration(
                  errorText: _validateDate ? 'Date Can\'t Be Empty' : null,
                  icon: const Icon(Icons.calendar_today), //icon of text field
                  labelText: "Enter Date"),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          colorScheme: const ColorScheme.light().copyWith(
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
                        colorScheme: const ColorScheme.light().copyWith(
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
                      pickedTime.hour,
                      pickedTime.minute);
                  String formattedDate =
                      DateFormat('yyyy-MM-dd HH:mm').format(pickedDateTime);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  setState(() {
                    dateController.text =
                        formattedDate; //set output date to TextFormField value.
                  });
                } else {}
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                decoration: InputDecoration(
                    labelText: "Event Location",
                    icon: const Icon(Icons.location_on_outlined),
                    errorText:
                        _validateLocation ? 'Location Can\'t Be Empty' : null),
                controller: locationController,
                onSaved: (String? location) {
                  model.location = location!;
                  print("event location saved");
                }),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                decoration: InputDecoration(
                    icon: const Icon(Icons.timer),
                    errorText:
                        _validateDuration ? 'Duration Can\'t Be Empty' : null,
                    labelText: "Event Duration",
                    suffixText: "mins"),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                controller: durationController,
                onSaved: (String? duration) {
                  model.duration = duration!;
                  print("event duration saved");
                }),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                inputFormatters: [LengthLimitingTextInputFormatter(500)],
                decoration: InputDecoration(
                    errorText:
                        _validateDescription ? 'Value Can\'t Be Empty' : null,
                    labelText: "Event Description",
                    icon: const Icon(Icons.description)),
                controller: descriptionController,
                onSaved: (String? description) {
                  model.description = description!;
                  print("event description saved");
                }),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: MyColours.light)),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(MyColours.light),
                foregroundColor:
                    MaterialStateProperty.all<Color>(MyColours.navbarColour),
              ),
              onPressed: () {
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
                if (checkAllValidators()) {
                  _formKey.currentState?.save();
                  //UNCOMMENT ONCE IMPLEMENTED :
                  // data.dataCollector<SocietyEvent> collector = data.dataCollector<SocietyEvent>();
                  // collector.updateCollection(model);

                  Get.put(model);

                  navigationController.goBack();

                  navigationController.refresh();
                  navigationController.goBack();
                  navigationController.refresh();

                  /**
                   * UPDATE THE EVENT model 
                   */
                } else {
                  print("input error");
                }
              },
              child: const CustomText(
                text: "Save",
                size: 18,
                weight: FontWeight.bold,
              ),
            )
          ])))
        ]));
  }
}
