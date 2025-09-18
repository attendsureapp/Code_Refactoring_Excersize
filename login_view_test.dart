import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_project/views/login_view.dart';
import 'package:your_project/controllers/auth_controller.dart';

void main() {
  setUp(() {
    Get.put(AuthController());
  });

  testWidgets('renders login view correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: const LoginView(),
      ),
    );

    expect(find.text('Login'), findsOneWidget);
    expect(find.text('E-mail'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Role'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });

  testWidgets('allows entering email and password', (WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(home: const LoginView()));

    await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'password123');

    expect(find.text('test@example.com'), findsOneWidget);
    expect(find.text('password123'), findsOneWidget);
  });

  testWidgets('can select a role', (WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(home: const LoginView()));

    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Professor').last);
    await tester.pump();

    expect(Get.find<AuthController>().selectedRole.value, 'Professor');
  });

  testWidgets('tapping login button calls login method', (tester) async {
    final controller = Get.find<AuthController>();

    bool loginCalled = false;
    controller.login = (String email, String password) {
      loginCalled = true;
    };

    await tester.pumpWidget(GetMaterialApp(home: const LoginView()));

    await tester.tap(find.text('Login'));
    await tester.pump();

    expect(loginCalled, isTrue);
  });
}
