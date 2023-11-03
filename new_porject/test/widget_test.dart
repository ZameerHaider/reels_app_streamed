// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:new_porject/main.dart';
import 'package:new_porject/provider/post_view_provider.dart';
import 'package:new_porject/screens/make_offer/makeofferscreen.dart';
import 'package:new_porject/screens/postView_screen.dart';
import 'package:new_porject/screens/widget/bottom_nav_buttons.dart';
import 'package:new_porject/screens/widget/rounded_button.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('MyApp Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Use the tester to interact with the widget and verify its state.
    expect(find.byType(MaterialApp), findsOneWidget); // Ensure MaterialApp is found.
    expect(find.byType(GestureDetector), findsOneWidget); // Ensure GestureDetector is found.
    expect(find.text('Your App Title'), findsNothing); // Replace with your app title text.

    // You can add more test cases based on your app's behavior.
  });

  testWidgets('MakeOfferScreen UI test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MakeOfferScreen(),
    ));

    // Verify the presence of UI components in the MakeOfferScreen widget
    expect(find.text('Abu Hamza'), findsOneWidget);
    expect(find.text('Posted this item for sale'), findsOneWidget);
    expect(find.byIcon(Icons.close), findsOneWidget);
    expect(find.text('im interested to buy \n your product with counter offer'), findsOneWidget);
    // Add more test cases as needed
  });

  testWidgets('PostViewScreen UI test', (WidgetTester tester) async {
    final provider = PostViewProvider(); // Create a mock provider for testing

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => provider,
          child: const PostViewScreen(),
        ),
      ),
    );

    // Verify the presence of UI components in the PostViewScreen widget
    expect(find.text('MacBook Air 2013'), findsOneWidget);
    expect(find.text('AED 12,00'), findsOneWidget);
    expect(find.text('View Website'), findsOneWidget);
    expect(find.text('Dubai, United Arab Emirates'), findsOneWidget);
    expect(find.byType(RoundedGradientButton), findsNWidgets(4));
    expect(find.byType(MakeOfferScreen), findsOneWidget);
    // Add more test cases as needed
  });

  testWidgets('PostViewScreen Bottom Navigation Test', (WidgetTester tester) async {
    final provider = PostViewProvider(); // Create a mock provider for testing

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => provider,
          child: const PostViewScreen(),
        ),
      ),
    );

    // Verify the presence of UI components in the bottom navigation
    expect(find.byType(CustomBottomNavigationBar), findsOneWidget);
    // Add more test cases as needed
  });
}
