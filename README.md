# 📧 Email Sender

**Email Sender** simplifies email integration in Flutter apps. It enables sending emails, OTP verification, and custom messages with ease — perfect for enhancing your app's communication features.

---

## ✨ Features

- Send simple emails
- Send OTP for verification
- Send custom messages (title, subject, body)
- Use your own email credentials
- Helper documentation method

---

## 🚀 Installation

Add the package using:

```bash
flutter pub add email_sender
```

Or manually add it to your `pubspec.yaml`:

```yaml
dependencies:
  email_sender: ^1.5.1
```

Then run:

```bash
flutter pub get
```

---

## 📦 Import

```dart
import 'package:email_sender/email_sender.dart';
```

---

## 🧪 Example

### ✅ Initialization

```dart
EmailSender emailsender = EmailSender();
```

### 📤 Send Email

```dart
void main() async {
  EmailSender emailsender = EmailSender();
  var response = await emailsender.send("toemail@gmail.com");
  print(response["message"]);
}
```

---

## 📚 Methods

### 🔹 `sendOtp`

```dart
EmailSender emailsender = EmailSender();
var response = await emailsender.sendOtp("toemail@gmail.com", 123456);
```

### 🔹 `sendMessage`

```dart
EmailSender emailsender = EmailSender();
var response = await emailsender.sendMessage(
  "toemail@gmail.com",
  "Your Title",
  "Your Subject",
  "Your message body here",
);
```

### 🔹 `customMessage`

```dart
EmailSender custom = EmailSender(
  "fromemail@gmail.com",
  "passkey",
  "toemail@gmail.com",
  "Custom Title",
  "Custom Subject",
  "Custom Body"
);
var response = await custom.customMessage();
```

### 🔹 `help`

```dart
Email emailsender = Email();
emailsender.help();
```

## 📖 Generate app password from here

- [Click Here](https://support.google.com/accounts/answer/185833?hl=en)

---

## 👨‍💻 Author

- [Shaik Afrid](https://afriddev.vercel.app)

---

## 📖 Getting Started with Flutter

- [Flutter Documentation](https://flutter.dev/docs)
- [Developing Flutter Packages](https://flutter.dev/docs/development/packages-and-plugins/developing-packages)
