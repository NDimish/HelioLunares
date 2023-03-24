import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:university_ticketing_system/pages/society_members/society_members.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([http.Client])
void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  group('Society Members', () {
    //Ensure screen size
    binding.window.physicalSizeTestValue = const Size(1920, 1080);
    binding.window.devicePixelRatioTestValue = 1.0;

    testWidgets('Widget contains two widgets', (tester) async {
      await tester.pumpWidget(const SocietyMembersPage());
      final notAuthFinder = find.text("Not Authenticated");
      expect(notAuthFinder, findsOneWidget);
    });
  });
}
