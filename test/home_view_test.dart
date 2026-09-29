import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_app/features/home/view/home_view.dart';

void main() {
  testWidgets('HomeView renders search bar, categories, and FAB', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: HomeView()));

    // Verify search bar
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Search notes...'), findsOneWidget);

    // Verify category chips
    expect(find.text('All Notes'), findsOneWidget);
    expect(find.text('Personal'), findsOneWidget);
    expect(find.text('Work'), findsOneWidget);
    expect(find.text('Ideas'), findsOneWidget);

    // Verify empty state
    expect(find.text('No notes yet'), findsOneWidget);

    // Verify Floating Action Button exists
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
