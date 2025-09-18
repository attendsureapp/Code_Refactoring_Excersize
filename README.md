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
