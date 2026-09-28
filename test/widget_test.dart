import 'package:flutter_test/flutter_test.dart';
import 'package:note_app/features/auth/view/login_view.dart';
import 'package:note_app/main.dart';

void main() {
  testWidgets('App opens the login screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(LoginView), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
