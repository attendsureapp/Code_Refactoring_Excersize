# 📘 Lab Submission – Refactoring Task (LoginView)

## 📝 Task Requirements
1. Find code in the project that is a good candidate for refactoring.  
2. Write tests for that code.  
3. Refactor the code while ensuring tests still pass.  
4. Submit via Pull Request for instructor/TA review.  

---

## 🔍 Code Selected
- **File:** `lib/views/login_view.dart`  
- **Reason for refactoring:**  
  - `build()` method was long and hard to read.  
  - Styles repeated multiple times.  
  - UI logic mixed inside main widget tree.  

---

## 🛠️ Refactoring Done
- Extracted widget code into helper methods:
  - `_buildHeader()`  
  - `_buildEmailField()`  
  - `_buildPasswordField()`  
  - `_buildRoleDropdown()`  
  - `_buildLoginButton()`  
- Created `AppTextStyles` for consistent styling.  
- Improved readability and maintainability.  

---

## ✅ Tests Added
- **File:** `test/login_view_test.dart`  
- Tests include:  
  - UI rendering check (labels, fields, button).  
  - Entering email and password.  
  - Selecting a role.  
  - Verifying login button calls `login`.  

Run with:
```bash
flutter test
