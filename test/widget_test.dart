import 'package:covenant_os/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App boots and shows CovenantOS home', (WidgetTester tester) async {
    await tester.pumpWidget(const CovenantOsApp());

    expect(find.text('CovenantOS'), findsWidgets);
  });
}
