import 'package:f_navigation/ui/pages/page1.dart';
import 'package:f_navigation/ui/pages/page2.dart';
import 'package:f_navigation/ui/pages/page3a.dart';
import 'package:f_navigation/ui/pages/page3b.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  String textFor(WidgetTester tester, String keyName) {
    return tester.widget<Text>(find.byKey(Key(keyName))).data ?? '';
  }

  Widget buildPage3bWithNavigation({required String name}) {
    return GetMaterialApp(
      initialRoute: '/page3b/?name=$name',
      getPages: [
        GetPage(name: '/page3b', page: () => Page3B()),
      ],
    );
  }

  Widget buildPage3aWithNavigation({required String name}) {
    return GetMaterialApp(
      initialRoute: '/page3a/?name=$name',
      getPages: [
        GetPage(name: '/page3a', page: () => const Page3A()),
      ],
    );
  }

  Widget buildPage1WithNavigation() {
    return GetMaterialApp(
      initialRoute: '/page1',
      getPages: [
        GetPage(name: '/page1', page: () => const Page1()),
        GetPage(name: '/page2', page: () => const Page2()),
      ],
    );
  }

  testWidgets('Page1 navigates to Page2 and can logout',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildPage1WithNavigation());
    await tester.pumpAndSettle();

    expect(find.byType(Page1), findsOneWidget);
    expect(find.byKey(const Key('page1NameField')), findsOneWidget);

    await tester.enterText(find.byKey(const Key('page1NameField')), 'John');
    await tester.tap(find.byKey(const Key('page1ContinueButton')));
    await tester.pumpAndSettle();

    expect(find.byType(Page2), findsOneWidget);
    expect(find.byKey(const Key('page2AppBar')), findsOneWidget);
    expect(find.byKey(const Key('homeTabRoot')), findsOneWidget);
    expect(find.byKey(const Key('page2HomeTabButton')), findsOneWidget);
    expect(find.byKey(const Key('page2ProfileTabButton')), findsOneWidget);
    expect(textFor(tester, 'homeTabPromptText'), 'Do you want option A or B?');

    await tester.tap(find.byKey(const Key('page2LogoutButton')));
    await tester.pumpAndSettle();

    expect(find.byType(Page1), findsOneWidget);
    expect(find.byTooltip('Back'), findsNothing);
  });

  testWidgets('Page2 switches between home and profile tabs',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        initialRoute: '/page2/?name=John',
        getPages: [
          GetPage(name: '/page2', page: () => const Page2()),
        ],
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('homeTabPromptText')), findsOneWidget);
    expect(find.byKey(const Key('page2HomeTabButton')), findsOneWidget);
    expect(textFor(tester, 'homeTabPromptText'), 'Do you want option A or B?');

    await tester.tap(find.byKey(const Key('page2ProfileTabButton')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('profileTabRoot')), findsOneWidget);
    expect(find.byKey(const Key('profileTabDescriptionText')), findsOneWidget);
    expect(find.byKey(const Key('profileTabNameText')), findsOneWidget);
    expect(textFor(tester, 'profileTabNameText'), 'John');
  });

  testWidgets('Page3B displays correct app bar title',
      (WidgetTester tester) async {
    const name = 'Augusto';
    await tester.pumpWidget(buildPage3bWithNavigation(name: name));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('page3BAppBar')), findsOneWidget);
    expect(find.byKey(const Key('page3BAppBarTitle')), findsOneWidget);
    expect(textFor(tester, 'page3BAppBarTitle'), '$name Option B');
  });

  testWidgets('Page3B displays snackbar when top button is clicked',
      (WidgetTester tester) async {
    const name = 'Augusto';

    await tester.pumpWidget(buildPage3bWithNavigation(name: name));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('page3BTopSnackbarButton')));
    await tester.pump();

    expect(find.byType(GetSnackBar), findsOneWidget);

    await tester.pump(const Duration(seconds: 4));
    await tester.pumpAndSettle();
  });

  testWidgets('Page3B displays snackbar when bottom button is clicked',
      (WidgetTester tester) async {
    const name = 'Augusto';
    await tester.pumpWidget(buildPage3bWithNavigation(name: name));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('page3BBottomSnackbarButton')));
    await tester.pump();

    expect(find.byType(GetSnackBar), findsOneWidget);

    await tester.pump(const Duration(seconds: 4));
    await tester.pumpAndSettle();
  });

  testWidgets('Page3A displays correct app bar title',
      (WidgetTester tester) async {
    const name = 'Augusto';
    await tester.pumpWidget(buildPage3aWithNavigation(name: name));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('page3AAppBar')), findsOneWidget);
    expect(find.byKey(const Key('page3AAppBarTitle')), findsOneWidget);
    expect(textFor(tester, 'page3AAppBarTitle'), '$name Option A');
  });

  testWidgets('Page3A updates current selection when candy tile is tapped',
      (WidgetTester tester) async {
    const name = 'Augusto';
    await tester.pumpWidget(buildPage3aWithNavigation(name: name));

    expect(find.byKey(const Key('page3ACurrentSelectionText')), findsOneWidget);
    expect(textFor(tester, 'page3ACurrentSelectionText'), 'Give me candy');

    await tester.tap(find.byKey(const Key('page3AShowBottomSheetButton')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('page3ALikeCandyTile')), findsOneWidget);

    await tester.tap(find.byKey(const Key('page3ALikeCandyTile')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('page3ACurrentSelectionText')), findsOneWidget);
    expect(textFor(tester, 'page3ACurrentSelectionText'), 'Give me candy');
  });

  testWidgets('Page1 validates the form before navigation',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildPage1WithNavigation());

    expect(
      find.byKey(const Key('page1InstructionsText')),
      findsOneWidget,
    );
    expect(find.byKey(const Key('page1ContinueButton')), findsOneWidget);

    await tester.tap(find.byKey(const Key('page1ContinueButton')));
    await tester.pumpAndSettle();

    expect(find.byType(Page1), findsOneWidget);
    expect(find.byType(Page2), findsNothing);

    await tester.enterText(find.byKey(const Key('page1NameField')), 'John');
    await tester.tap(find.byKey(const Key('page1ContinueButton')));
    await tester.pumpAndSettle();

    expect(find.byType(Page2), findsOneWidget);
  });
}
