import 'package:flutter/material.dart';
import 'package:university_ticketing_system/pages/edit_mode/widgets/society_hub_form.dart';

class EditSocietyHubPage extends StatelessWidget {
  const EditSocietyHubPage({super.key});

  // SocietyEvent obj = Get.find<SocietyEvent>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(16.0, 60.0, 16.0, 16.0),
        child: const SocietyHubForm());
  }
}
