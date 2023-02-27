import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/models/society_event.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';
import '../../../constants/style.dart';

class EventForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  _EventFormState() {}

  final SocietyEvent obj = Get.find<SocietyEvent>();
  final _formKey = GlobalKey<FormState>();
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
  final _formatCurrencyInputNoDecimal = NumberFormat.currency(
      locale: 'en_GB', name: "", symbol: "£", decimalDigits: 0);
  final _formatCurrencyInput = NumberFormat.currency(
      locale: 'en_GB', name: "", symbol: "£", decimalDigits: 2);

  bool checkAllValidators() {
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
    nameController.text = obj.name;
    //.format function requires int not string
    priceController.text = _formatCurrencyInput.format(double.parse(obj.price));
    dateController.text =
        DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse(obj.date));
    locationController.text = obj.location;
    durationController.text = obj.duration;
    descriptionController.text = obj.description;
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
            TextField(
                decoration: InputDecoration(
                    errorText: _validateName ? 'Name Can\'t Be Empty' : null,
                    labelText: "Event Name",
                    icon: Icon(Icons.event)),
                controller: nameController,
                onChanged: (String value) {
                  // obj.name = value;
                }),
            const SizedBox(
              height: 20,
            ),
            TextField(
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
                    icon: Icon(Icons.payments_outlined),
                    labelText: "Ticket Price",
                    errorText: _validatePrice ? 'Value Can\'t Be Empty' : null),
                controller: priceController,
                onChanged: (String value) {
                  // obj.price = value;
                }),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: dateController,
              onChanged: (String value) {
                //obj.date = value;
              },
              decoration: InputDecoration(
                  errorText: _validateDate ? 'Date Can\'t Be Empty' : null,
                  icon: Icon(Icons.calendar_today), //icon of text field
                  labelText: "Enter Date"),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100));
                // ignore: use_build_context_synchronously
                TimeOfDay? pickedTime = await showTimePicker(
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
                        formattedDate; //set output date to TextField value.
                  });
                } else {}
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
                decoration: InputDecoration(
                    labelText: "Event Location",
                    icon: Icon(Icons.location_on_outlined),
                    errorText:
                        _validateLocation ? 'Location Can\'t Be Empty' : null),
                controller: locationController,
                onChanged: (String value) {
                  //obj.location = value;
                }),
            const SizedBox(
              height: 20,
            ),
            TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.timer),
                    errorText:
                        _validateDuration ? 'Duration Can\'t Be Empty' : null,
                    labelText: "Event Duration",
                    suffixText: "mins"),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                controller: durationController,
                onChanged: (String value) {
                  //obj.duration = value;
                }),
            const SizedBox(
              height: 20,
            ),
            TextField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              inputFormatters: [LengthLimitingTextInputFormatter(500)],
              decoration: InputDecoration(
                  errorText:
                      _validateDescription ? 'Value Can\'t Be Empty' : null,
                  labelText: "Event Description",
                  icon: Icon(Icons.description)),
              controller: descriptionController,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: MyColours.light)),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(MyColours.light),
                foregroundColor:
                    MaterialStateProperty.all<Color>(MyColours.dark),
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
                if (checkAllValidators()) obj.name = nameController.text;
                obj.date = dateController.text;
                obj.location = locationController.text;
                obj.price = priceController.text.replaceAll("£", "");
                obj.duration = durationController.text;
                obj.description = descriptionController.text;
                print(obj.price);
                Get.put(obj);

                navigationController.goBack();

                navigationController.refresh();
                navigationController.goBack();
                navigationController.refresh();
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
