# 🚀 Flutter Refactoring Lab

## 📌 Overview
This repository is part of the **Software Engineering Lab** task on **refactoring**.  
The goal is to identify code smells, refactor them using techniques from Martin Fowler’s book and lecture slides, and verify correctness with tests.

We selected the `LoginView` screen as a candidate for refactoring because:
- The `build()` method was **too long** and hard to read.  
- **Duplicate styles** were scattered in multiple places.  
- **Mixed responsibilities**: layout, state, and logic all inside one method.  

---

## 🔧 Refactoring Techniques Applied
Based on lecture slides and principles:

- **Extract Function** → separated UI sections into `_buildHeader`, `_buildTitle`, `_buildEmailField`, `_buildPasswordField`, `_buildRoleDropdown`, `_buildLoginButton`.  
- **Slide Statements** → grouped related code for readability.  
- **Replace Temp with Query** → created `_inputDecoration()` helper for consistent input styles.  
- **Remove Duplicate Code** → common text field UI extracted into `_buildInputField()`.  

---

## ✨ Changes Made
Here are the concrete changes applied to the code:

1. **Split the large `build()` method** into multiple smaller private methods.  
2. **Created `_inputDecoration()` helper** for consistent input field decoration.  
3. **Extracted duplicate text styles** into a reusable `AppTextStyles` class.  
4. **Moved password visibility logic** into controller (kept separation of concerns).  
5. **Dropdown and button code simplified** for better readability.  
6. **Added widget tests** before refactoring to ensure behavior consistency.  

---

## ✅ Testing
We applied **Test-Driven Refactoring**:
1. Wrote **widget tests** for the original code.  
2. Performed refactoring.  
3. Ensured **all tests still pass**.  

### Test Coverage
- UI elements render correctly (title, fields, button).  
- Email & password text entry works.  
- Role dropdown selection works.  
- Login button triggers controller method.  

Run tests with:
```bash
flutter test

## 🔧 Refactoring Techniques Applied

### 1. Extract Function
**Before**
```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      children: [
        // header
        Container(...),
        // email field
        TextField(...),
        // password field
        TextField(...),
        // role dropdown
        DropdownButton(...),
        // login button
        ElevatedButton(...)
      ],
    ),
  );
}
```
**After**
```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      children: [
        _buildHeader(),
        _buildEmailField(),
        _buildPasswordField(),
        _buildRoleDropdown(),
        _buildLoginButton(),
      ],
    ),
  );
}
```

### 2. Slide Statements
**Before**
```dart

Text("Password"),
TextField(...),
DropdownButton(...),
ElevatedButton(...)
```

**After**
```dart

Text("Password"),
TextField(...),
_buildRoleDropdown(),
_buildLoginButton(),
```

### 3. Replace Temp with Query
**Before**
```dart
decoration: InputDecoration(
  hintText: 'hello@example.com',
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide.none,
  ),
);
```

**After**
```dart
decoration: _inputDecoration("hello@example.com"),
```

### 4. Remove Duplicate Code
**Before**
```dart
TextField(
  controller: controller.emailController,
  decoration: InputDecoration(...),
)

TextField(
  controller: controller.passwordController,
  decoration: InputDecoration(...),
)

```

**After**
```dart
_buildInputField(
  controller: controller.emailController,
  hint: "hello@example.com",
)

_buildInputField(
  controller: controller.passwordController,
  hint: "••••••••",
  obscure: true,
)
```

