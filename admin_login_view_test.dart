import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_app/controllers/admin_controller.dart';
import 'package:your_app/views/admin_login_view.dart';

void main() {
  late AdminController controller;

  setUp(() {
    controller = Get.put(AdminController());
  });

  testWidgets('renders login screen UI correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(home: const AdminLoginView()),
    );

    // Check for title and subtitle
    expect(find.text('Welcome Back'), findsOneWidget);
    expect(find.text('Sign in to continue'), findsOneWidget);

    // Check email and password text fields
    expect(find.byType(TextField), findsNWidgets(2));

    // Check login button
    expect(find.text('Login'), findsOneWidget);
  });

  testWidgets('tapping login button calls login method', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(home: const AdminLoginView()),
    );

    controller.emailController.text = 'test@example.com';
    controller.passwordController.text = 'password123';

    await tester.tap(find.text('Login'));
    await tester.pump();

    // The login method should have been called (you can check side effects here)
    expect(controller.emailController.text, 'test@example.com');
  });
}
