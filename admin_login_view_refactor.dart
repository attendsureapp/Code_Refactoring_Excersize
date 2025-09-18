import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/admin_controller.dart';

class AdminLoginView extends GetView<AdminController> {
  const AdminLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildLogo(),
              const SizedBox(height: 24),
              _buildTitle(),
              _buildSubtitle(),
              const SizedBox(height: 32),
              _buildUserTypeDropdown(),
              const SizedBox(height: 16),
              _buildTextField(
                controller.emailController,
                label: 'Email',
                hint: 'Enter your email',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller.passwordController,
                label: 'Password',
                hint: 'Enter your password',
                icon: Icons.lock_outline,
                obscureText: true,
              ),
              const SizedBox(height: 24),
              _buildLoginButton(),
              const SizedBox(height: 16),
              _buildFooterText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() => Icon(
        Icons.school_outlined,
        size: 64,
        color: Colors.blue.shade400,
      );

  Widget _buildTitle() => Text(
        'Welcome Back',
        style: AppTextStyles.title,
        textAlign: TextAlign.center,
      );

  Widget _buildSubtitle() => Text(
        'Sign in to continue',
        style: AppTextStyles.subtitle,
        textAlign: TextAlign.center,
      );

  Widget _buildUserTypeDropdown() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Obx(
          () => DropdownButton<String>(
            value: controller.selectedUserType.value,
            items: controller.userTypes
                .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                .toList(),
            onChanged: controller.changeUserType,
            isExpanded: true,
            underline: const SizedBox(),
            icon: const Icon(Icons.arrow_drop_down),
            style: AppTextStyles.dropdown,
          ),
        ),
      );

  Widget _buildTextField(
    TextEditingController ctrl, {
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return TextField(
      controller: ctrl,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }

  Widget _buildLoginButton() => Obx(
        () => ElevatedButton(
          onPressed: controller.isLoading.value
              ? null
              : () => controller.login(
                    controller.emailController.text,
                    controller.passwordController.text,
                  ),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: controller.isLoading.value
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text('Login', style: AppTextStyles.button),
        ),
      );

  Widget _buildFooterText() => Obx(
        () => Text(
          'Login as ${controller.selectedUserType.value}',
          style: AppTextStyles.footer,
          textAlign: TextAlign.center,
        ),
      );
}

class AppTextStyles {
  static final title = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static final subtitle = GoogleFonts.poppins(
    fontSize: 16,
    color: Colors.grey.shade600,
  );

  static final button = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static final footer = GoogleFonts.poppins(
    fontSize: 14,
    color: Colors.grey.shade600,
  );

  static final dropdown = GoogleFonts.poppins(
    fontSize: 16,
    color: Colors.black87,
  );
}
