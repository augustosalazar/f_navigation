import 'package:f_navigation/ui/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  String textFor(WidgetTester tester, String keyName) {
    return tester.widget<Text>(find.byKey(Key(keyName))).data ?? '';
  }

  testWidgets('App flow integration test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('page1InstructionsText')), findsOneWidget);
    expect(find.byKey(const Key('page1NameField')), findsOneWidget);
    expect(find.byKey(const Key('page1ContinueButton')), findsOneWidget);

    await tester.enterText(find.byKey(const Key('page1NameField')), 'John');
    await tester.tap(find.byKey(const Key('page1ContinueButton')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('page2AppBar')), findsOneWidget);
    expect(find.byKey(const Key('homeTabRoot')), findsOneWidget);
    expect(find.byKey(const Key('homeTabOptionAButton')), findsOneWidget);
    expect(textFor(tester, 'homeTabPromptText'), 'Do you want option A or B?');

    await tester.tap(find.byKey(const Key('page2ProfileTabButton')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('profileTabRoot')), findsOneWidget);
    expect(find.byKey(const Key('profileTabNameText')), findsOneWidget);
    expect(textFor(tester, 'profileTabNameText'), 'John');

    await tester.tap(find.byKey(const Key('page2HomeTabButton')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('homeTabOptionAButton')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('page3AAppBar')), findsOneWidget);
    expect(find.byKey(const Key('page3AAppBarTitle')), findsOneWidget);
    expect(textFor(tester, 'page3AAppBarTitle'), 'John Option A');

    await tester.tap(find.byKey(const Key('page3AShowBottomSheetButton')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('page3ALikeCandyTile')), findsOneWidget);

    await tester.tap(find.byKey(const Key('page3ALikeCandyTile')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('page3ACurrentSelectionText')), findsOneWidget);
    expect(textFor(tester, 'page3ACurrentSelectionText'), 'Give me candy');
  });
}
