import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';
import '../../../constants/style.dart';

class SocietyHubForm extends StatefulWidget {
  const SocietyHubForm({super.key});

  @override
  State<StatefulWidget> createState() => _SocietyHubFormState();
}

class _SocietyHubFormState extends State<SocietyHubForm> {
  File _file = File("zz");
  File? _image;
  String? imageSrc;
  Uint8List webImage = Uint8List(10);
  bool webImgNull = true;

  Future pickImage() async {
    // MOBILE
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        var selected = File(image.path);

        setState(() {
          _file = File("a");
          _image = selected;
        });
      } else {
        print("No file selected");
      }
    }
    // WEB
    else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          _file = File("a");
          webImage = f;
        });
      } else {
        print("No file selected");
      }
    }
  }

  _SocietyHubFormState() {}

  String test = "not changed";
  final _formKey = GlobalKey<FormState>();
  //Controllers
  final aboutUsController = TextEditingController();

  bool _validateAboutUs = false;

  bool checkAllValidators() {
    return (!_validateAboutUs) ? true : false;
  }

  //populate the fields with current event details
  @override
  void initState() {
    aboutUsController.text = "...";
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
                  errorText:
                      _validateAboutUs ? 'About section Can\'t Be Empty' : null,
                  labelText: "About Us",
                  icon: const Icon(Icons.event)),
              controller: aboutUsController,
            ),
            const SizedBox(
              height: 20,
            ),
            //IMAGE PICKER
            ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(
                            color: MyColours.elementButtonColour)),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      MyColours.elementButtonHoverColour),
                  foregroundColor: MaterialStateProperty.all<Color>(
                      MyColours.panelBackgroundColour),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.image),
                    SizedBox(
                      width: 16,
                    ),
                    CustomText(
                      weight: FontWeight.w300,
                      text: "Select Image",
                      size: 18,
                    ),
                  ],
                ),
                onPressed: () => pickImage()),

            const SizedBox(
              height: 20,
            ),

            (_file.path == "zz")
                ? const FlutterLogo(
                    size: 200,
                  )
                : (kIsWeb)
                    ? Image.memory(webImage)
                    : Image.file(_image!),
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
                    aboutUsController.text.isEmpty
                        ? _validateAboutUs = true
                        : _validateAboutUs = false;
                  },
                );
                if (checkAllValidators()) test = aboutUsController.text;

                print(test);
                // Get.put(obj);

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
