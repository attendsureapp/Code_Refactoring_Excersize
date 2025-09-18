# 📘 Lab Submission – Refactoring Task (Flutter Project)

## 📝 Task Requirements
This lab demonstrates the following steps:
1. **Find code** in the project that is a good candidate for refactoring.  
2. **Write tests** for the original code.  
3. **Refactor the code** while ensuring tests still pass.  
4. **Submit via Pull Request** for instructor/TA review.  

---

## 🔍 Code Selected
- **File:** `lib/views/admin_login_view.dart`  
- **Reason for refactoring:**  
  - The `build()` method was **too long**.  
  - **Repeated styles** (e.g., `GoogleFonts.poppins` everywhere).  
  - **Mixed UI logic**, making it hard to read and maintain.  

---

## 🛠️ Refactoring Done
- Extracted widget tree into **helper methods**:
  - `_buildLogo()`  
  - `_buildTitle()`  
  - `_buildSubtitle()`  
  - `_buildUserTypeDropdown()`  
  - `_buildTextField()`  
  - `_buildLoginButton()`  
  - `_buildFooterText()`  
- Created **`AppTextStyles`** class for consistent text styling.  
- Improved **readability**, **reusability**, and **maintainability**.  

---

## ✅ Tests Added
- **File:** `test/admin_login_view_test.dart`  
- **What was tested:**  
  - UI renders correctly (title, subtitle, text fields, and login button).  
  - Email & password fields accept input.  
  - Login button can be tapped and triggers the `login` function with entered credentials.  

Run tests with:
```bash
flutter test
