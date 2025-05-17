// This is a basic Flutter widget test for our Todo List app.
//
// This test verifies that our Todo app initializes correctly and the title is displayed.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Todo List app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app title is displayed
    expect(find.text('Todo List App'), findsOneWidget);
    
    // Verify that the empty state message is shown initially
    expect(find.text('No tasks yet! Add some tasks.'), findsOneWidget);
    
    // Verify that the add button is present
    expect(find.byIcon(Icons.add), findsOneWidget);
    
    // Tap the add button and trigger a frame to show the dialog
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    
    // Verify that the dialog is shown
    expect(find.text('Add a task'), findsOneWidget);
    expect(find.text('CANCEL'), findsOneWidget);
    expect(find.text('ADD'), findsOneWidget);
  });
}
