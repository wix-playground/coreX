import 'package:flutter_test/flutter_test.dart';
import 'main.dart';

void main() {
  testWidgets('CoreX has one app for editing', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    final titleFinder = find.text('App');

    expect(titleFinder, findsOneWidget);
  });
}
