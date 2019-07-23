// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myapp/main.dart';

void main() {
  testWidgets('MyApp test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that we show six items, six dividers, and 6 Icons to fav
    expect(find.byType(ListTile), findsNWidgets(6));
    expect(find.byType(Divider), findsNWidgets(6));
    expect(find.byIcon(Icons.favorite_border), findsNWidgets(6));

    // Tap the fav icon and trigger a frame.
    await tester.tap(find.byType(ListTile).first);
    await tester.pump();

    // Verify that we have 1 favorited and other 5 without fav
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border), findsNWidgets(5));
  });
}
