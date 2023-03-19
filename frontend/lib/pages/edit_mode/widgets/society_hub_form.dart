import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/widgets/circle_icon.dart';
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

  //populate the fields with current details
  @override
  void initState() {
    aboutUsController.text = "...";
    return super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: TextFormField(
                          decoration: InputDecoration(
                            errorText: _validateAboutUs
                                ? 'About section Can\'t Be Empty'
                                : null,
                            labelText: "About Us",
                          ),
                          controller: aboutUsController,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                        )))
              ]),
              const SizedBox(
                height: 20,
              ),
              Row(children: [
                CircleIcon(
                  icon: const Icon(Icons.image),
                  radius: 30,
                ),
                const SizedBox(
                  width: 20,
                ),
                //IMAGE PICKER
                ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MyColours.elementButtonColour.withOpacity(0.2))
                        // foregroundColor: MaterialStateProperty.all<Color>(
                        //     MyColours.panelBackgroundColour),
                        ),
                    child: CustomText(
                      weight: FontWeight.w300,
                      text: "Select Image",
                      size: 18,
                      colour: Colors.white,
                    ),
                    onPressed: () => pickImage()),
                const SizedBox(
                  width: 10,
                ),
                CustomText(
                  size: 14,
                  text: "(200x200 is preferred)",
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: (_file.path == "zz")
                      ? const FlutterLogo(
                          size: 200,
                        )
                      : (kIsWeb)
                          ? Image.memory(webImage)
                          : Image.file(_image!),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )),
                    padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        MyColours.navButtonColour.withOpacity(0.5))),
                onPressed: () {
                  setState(
                    () {
                      aboutUsController.text.isEmpty
                          ? _validateAboutUs = true
                          : _validateAboutUs = false;
                    },
                  );
                  if (checkAllValidators()) {
                    test = aboutUsController.text;

                    print(test);
                    //TODO Update backend

                    navigationController.goBack();
                  }
                },
                child: const CustomText(
                  colour: Colors.white,
                  text: "Save",
                  size: 24,
                  weight: FontWeight.bold,
                ),
              ),
            ])));
  }
}
