import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/login_page.dart';
import 'package:bmi_calculator/home_page.dart';

void main() {
  testWidgets('Login test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Verify that the login page is displayed
    expect(find.byType(LoginPage), findsOneWidget);

    // Enter username and password
    await tester.enterText(find.byKey(Key('usernameField')), '22000016103');
    await tester.enterText(find.byKey(Key('passwordField')), 'responsi_A');
    await tester.tap(find.byKey(Key('loginButton')));
    await tester.pumpAndSettle();

    // Verify that the home page is displayed
    expect(find.byType(HomePage), findsOneWidget);
  });

  testWidgets('BMI Calculation test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Login
    await tester.enterText(find.byKey(Key('usernameField')), '2200016103');
    await tester.enterText(find.byKey(Key('passwordField')), 'responsi_A');
    await tester.tap(find.byKey(Key('loginButton')));
    await tester.pumpAndSettle();

    // Verify that the home page is displayed
    expect(find.byType(HomePage), findsOneWidget);

    // Enter weight and height
    await tester.enterText(
        find.byKey(Key('weightField')), '80'); // Weight in kg
    await tester.enterText(
        find.byKey(Key('heightField')), '170'); // Height in cm
    await tester.tap(find.byKey(Key('calculateButton')));
    await tester.pumpAndSettle();

    // Verify BMI result and category
    expect(find.text('BMI: 27.68'), findsOneWidget);
    expect(find.text('Category: Overweight'), findsOneWidget);
  });
}
