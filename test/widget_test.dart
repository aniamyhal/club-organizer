import 'package:flutter_test/flutter_test.dart';

import 'package:club_organizer/app.dart';

void main() {
  testWidgets('Показує екран входу', (WidgetTester tester) async {
    await tester.pumpWidget(const ClubOrganizerApp());
    expect(find.text('Вхід'), findsOneWidget);
  });
}