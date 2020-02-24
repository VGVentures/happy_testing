# You Say Testing, I Say Codemagic!

![inline](assets/codemagic.png)

### Felix Angelov & Jorge Coca

---

# Agenda

- Why Testing?

- Making Code Testable

- 3 Layers of Testing in Flutter

- Testing Tools

- Coding

- Importance of CI & Automation

- Codemagic!

---

# Why Testing?

---

# Does it work now?

- immediate feedback

- confidence-booster

- cover edge cases

---

# Will it work later?

- iterate with confidence

- contributor-friendly

- bug prevention

---

# What makes Code Testable?

- Decoupled dependencies

- Single Responsibility Principle

- Conveys intention clearly

- Avoids Side-Effects

- Is Predictable

---

# Example

```dart
String getTimeOfDay() {
  final time = DateTime.now();
  if (time.hour >= 0 && time.hour < 6) {
    return 'Night';
  }
  if (time.hour >= 6 && time.hour < 12) {
    return 'Morning';
  }
  if (time.hour >= 12 && time.hour < 18) {
    return 'Afternoon';
  }
  return 'Evening';
}
```

---

# Unit Tests

```dart
test('getTimeOfDay at 6am returns Morning', () {
  // Arrange
  // TODO: Need to change the system time to be 6am

  // Act
  final timeOfDay = getTimeOfDay();

  // Assert
  expect(timeOfDay, 'Morning');

  // TODO: Revert system time back to normal
});
```

---

# Refactor

```dart
String getTimeOfDay(DateTime time) {
  if (time.hour >= 0 && time.hour < 6) {
    return 'Night';
  }
  if (time.hour >= 6 && time.hour < 12) {
    return 'Morning';
  }
  if (time.hour >= 12 && time.hour < 18) {
    return 'Afternoon';
  }
  return 'Evening';
}
```

---

# Unit Tests

```dart
test('getTimeOfDay at 6am returns Morning', () {
  // Arrange
  final time = DateTime(2020, 1, 1, 6); // Jan 1st 2020 6:00AM

  // Act
  final timeOfDay = getTimeOfDay(time);

  // Assert
  expect(timeOfDay, 'Morning');
});
```

---

# 3 Layers of Testing in Flutter

1. Unit
   tests a single function, method, or class.

2. Widget
   tests a single widget (UI Component)

3. Integration
   tests a complete app or a large part of an app.

---

# Testing Tools

---

# `package:test/test.dart`

## A full featured library for writing and running Dart tests.

---

# `package:test_coverage/test_coverage.dart`

## Command line utility to run tests in Dart VM and collect coverage data.

---

# `package:flutter_test/flutter_test.dart`

## A full featured library for writing and running Flutter Widget tests.

---

# `package:flutter_driver/flutter_driver.dart`

## A full featured library for writing and running Flutter Integration tests.

---

# `package:mockito/mockito.dart`

## A mock framework inspired by Mockito (Java)

---

# Coding Time

# 👩‍💻👨‍💻

---

# Importance of CI and Automation

- Enforce best practices and standards

- Prevent Bugs

- Save Time

---

# Codemagic

- CI/CD for Flutter

- Automation as code (`codemagic.yaml`)

- Build + Test your app after every commit automatically

- Deploy straight to Google Play/Appstore
