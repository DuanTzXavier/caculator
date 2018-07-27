// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calculator/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new MyApp());
    expect(find.text('AC'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
    expect(find.text('5'), findsWidgets);
    expect(find.text('6'), findsOneWidget);
    expect(find.text('7'), findsOneWidget);
    expect(find.text('8'), findsOneWidget);
    expect(find.text('9'), findsOneWidget);
    expect(find.text('0'), findsNWidgets(2));
    expect(find.text('.'), findsOneWidget);

//    await tester.tap(find.byKey(Key("leading")));
//
//
//    expect(find.text('计算与换算'), findsOneWidget);

    await tester.tap(find.byKey(Key("1")));

    await tester.tap(find.byKey(Key("3")));

    await tester.tap(find.byKey(Key("2")));

    await tester.tap(find.byKey(Key("4")));

    await tester.tap(find.byKey(Key("assets/images/add.png")));

    await tester.tap(find.byKey(Key("1")));

    await tester.tap(find.byKey(Key("1")));

    await tester.tap(find.byKey(Key("1")));

    await tester.pumpAndSettle();

    Widget showNumber = find.byKey(Key("showNumber")).evaluate().first.widget;
    if (showNumber is Text){
      Text x = showNumber;
      expect(x.data, "111");
    }

    Widget result = find.byKey(Key("result")).evaluate().first.widget;
    if (result is Text){
      Text x = result;
      expect(x.data, "1,435");
    }
  });
}
