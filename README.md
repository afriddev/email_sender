# 📧 Email Sender

[![Pub Version](https://img.shields.io/pub/v/email_sender.svg)](https://pub.dev/packages/email_sender)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

> ⚡ **Now with HTML Support!** Easily send rich HTML emails with full styling support directly from your Flutter app.


![Email Sender Banner](https://raw.githubusercontent.com/afriddev/email_sender/main/html_email_preview.png)

[![GitHub](https://img.shields.io/badge/github-@afriddev-blue)](https://www.github.com/afriddev)

<p align="center"><i>This is how your HTML email could look!</i></p>

**Email Sender** is a powerful and lightweight Flutter package for integrating email functionality directly into your app. Whether it's sending basic emails, OTPs for verification, or beautifully formatted HTML messages — this package has you covered.

---

## 📦 Installation

Add the package using the Flutter CLI:

```bash
flutter pub add email_sender
```

Or manually add it to your `pubspec.yaml`:

```yaml
dependencies:
  email_sender: ^2.0.1
```

Then run:

```bash
flutter pub get
```

---

## 🚀 Features

- ✅ Send plain emails
- 🔐 OTP-based email verification
- 📝 Custom messages (title, subject, body)
- 💡 Directly send raw HTML strings
- 📄 Send HTML templates (prebuilt or custom)
- 🔑 Use your own email credentials (e.g., Gmail App Password)
- 🛠️ Developer-friendly API with helper methods

---

## 🧪 Usage Examples

### ✅ Initialization

```dart
EmailSender emailsender = EmailSender();
```

### 📤 Send a Basic Email

```dart
var response = await emailsender.send("toemail@gmail.com");
print(response["message"]);
```

### 🔐 Send OTP

```dart
var response = await emailsender.sendOtp("toemail@gmail.com", 123456);
```

### 📝 Send Custom Message

```dart
var response = await emailsender.sendMessage(
  "toemail@gmail.com",
  "Your Title",
  "Your Subject",
  "Your message body here",
);
```

### 💡 Send HTML String

```dart
var response = await emailsender.sendHtml(
  "toemail@gmail.com",
  "<h1>Welcome!</h1><p>This is an HTML email.</p>",
);
```

### 📄 Send HTML Template

```dart
EmailSender htmlSender = EmailSender(
  "fromemail@gmail.com",
  "passkey",
  "toemail@gmail.com",
  "Template Title",
  "Template Subject",
  "<h1>HTML Body from Template</h1>"
);
var response = await htmlSender.customMessage();
```

---

## 📖 App Password Setup (Gmail)

> If you're using Gmail, generate an app password to send emails securely.  
👉 [Generate App Password](https://support.google.com/accounts/answer/185833?hl=en)

---

## 📚 Additional Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Developing Flutter Packages](https://flutter.dev/docs/development/packages-and-plugins/developing-packages)

---

## 👨‍💻 Author

**Shaik Afrid**  
🔗 [Portfolio](https://afriddev.vercel.app)

---
