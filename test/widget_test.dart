// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:f_navigation/ui/pages/page1.dart';
import 'package:f_navigation/ui/pages/page2.dart';
import 'package:f_navigation/ui/pages/page3a.dart';
import 'package:f_navigation/ui/pages/page3b.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  Widget _buildPageWithNavigation(Widget pageUnderTest,
      {required String name}) {
    return GetMaterialApp(
      initialRoute: '/page3b/?name=$name',
      getPages: [
        GetPage(name: '/page3b', page: () => Page3B()),
      ],
    );
  }

/*
  testWidgets('Page3B displays correct app bar title',
      (WidgetTester tester) async {
    const name = 'Augusto';
    await tester.pumpWidget(_buildPageWithNavigation(Page3B(), name: name));
    await tester.pumpAndSettle();
    final appBarFinder = find.byType(AppBar);
    expect(appBarFinder, findsOneWidget);

    final titleFinder = find.text('$name Option B');
    expect(titleFinder, findsOneWidget);
  });
*/
  testWidgets('Page3B displays snackbar when top button is clicked',
      (WidgetTester tester) async {
    const name = 'Augusto';
    await tester.pumpWidget(_buildPageWithNavigation(Page3B(), name: name));
    await tester.pumpAndSettle();

    final buttonFinder = find.text('Show Top Snackbar');
    expect(buttonFinder, findsOneWidget);

    await tester.tap(buttonFinder);
    await tester.pump();

    final snackbarFinder = find.text('This is a snackbar on Top');
    expect(snackbarFinder, findsOneWidget);

    await tester.pump(const Duration(seconds: 5));
  });

  testWidgets('Page3B displays snackbar when bottom button is clicked',
      (WidgetTester tester) async {
    const name = 'Augusto';
    await tester.pumpWidget(_buildPageWithNavigation(Page3B(), name: name));
    await tester.pumpAndSettle();

    final buttonFinder = find.text('Show Botton Snackbar');
    expect(buttonFinder, findsOneWidget);

    await tester.tap(buttonFinder);
    await tester.pump();

    final snackbarFinder = find.text('This is a snackbar on Bottom');
    expect(snackbarFinder, findsOneWidget);

    await tester.pump(const Duration(seconds: 5));
  });
}
