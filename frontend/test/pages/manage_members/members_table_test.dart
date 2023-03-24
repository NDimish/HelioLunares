import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:university_ticketing_system/backend_communication/models/University.dart';
import 'package:university_ticketing_system/pages/society_members/members_table.dart';
import 'package:university_ticketing_system/pages/society_members/society_members.dart';
import 'package:university_ticketing_system/backend_communication/models/all.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([http.Client])
void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  group('Members Table', () {
    //Ensure screen size
    binding.window.physicalSizeTestValue = const Size(1920, 1080);
    binding.window.devicePixelRatioTestValue = 1.0;

    testWidgets('Widget renders', (tester) async {
      await tester.pumpWidget(MembersTable(3, 3, 3, 1, [], () => {}));
      final findUserID = find.text("ID");

      expect(findUserID, findsOneWidget);
    });
  });
}
