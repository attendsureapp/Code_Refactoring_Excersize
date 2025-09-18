# 🚀 Flutter Refactoring Lab – LoginView

## 📌 Overview
This repository is part of the **Software Engineering Lab** on **Refactoring**.  
The task was to identify code smells, refactor them using Martin Fowler’s techniques (from Lecture 12–13), and verify correctness with tests.  

We selected the `LoginView` screen because:
- The `build()` method was **too long**.  
- **Duplicate styles** existed for multiple fields.  
- UI, state, and logic were **mixed in one place**.  

---

## 🎯 Why Refactor?
- Improve software design.  
- Make code **easier to read and maintain**.  
- Eliminate duplicate logic.  
- Enable **faster, safer future changes**.  

---

## ⚠️ Code Smells Identified
- **Long Function** → single `build()` method contained all UI.  
- **Duplicate Code** → similar `TextField` decoration repeated.  
- **Shotgun Surgery risk** → any style change required updates everywhere.  
- **Comment smell** → comments explained UI structure instead of clean functions.  

---

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

