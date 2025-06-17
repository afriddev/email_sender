import 'package:http/http.dart' as http;
import 'dart:convert';

/// Main class
class EmailSender {
  EmailSender();
  /// Server URL
  final String server = "https://freeemailapi.vercel.app/";

  /// Send Email Endpoint
  final String url = "https://freeemailapi.vercel.app/sendEmail/";

  /// Error codes list
  List<String> errorCodes = [
    "wrongEmail",
    "sendEmailFailed",
    "wrongCrendentials",
    "passkeyRequired",
    "serverError"
  ];

  /// Check email format
  bool checkEmail(String email) {
    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$"
    ).hasMatch(email);
    return emailValid;
  }

  /// Check server status
  Future<bool> checkServer() async {
    try {
      final response = await http.get(Uri.parse(server));
      final data = jsonDecode(response.body);
      final status = data["message"]["serverStatus"];

      return status == "running";
    } catch (e) {
      return false;
    }
  }

  /// Check error code presence
  Map<String, dynamic> checkErrorCode(String message) {
    if (errorCodes.contains(message)) {
      return {"isThere": true, "errorCode": message};
    }
    return {"isThere": false};
  }

  /// Send default email
  Future<Map<String, dynamic>> send(String toEmail) async {
    if (!checkEmail(toEmail)) return {"message": "wrongEmail"};
    if (!await checkServer()) return {"message": "serverUnderMaintenance"};

    try {
      final response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"toEmail": toEmail}),
      );

      final data = jsonDecode(response.body);
      final code = data["message"];

      if (code == "emailSendSuccess") return data;
      final error = checkErrorCode(code);
      return error["isThere"]
          ? {"message": error["errorCode"]}
          : {"message": "somethingWrong"};
    } catch (e) {
      return {"message": "somethingWrong"};
    }
  }

  /// Send OTP email
  Future<Map<String, dynamic>> sendOtp(String toEmail, int otp) async {
    if (!checkEmail(toEmail)) return {"message": "wrongEmail"};
    if (!await checkServer()) return {"message": "serverUnderMaintenance"};

    try {
      final response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "toEmail": toEmail,
          "body": "Your Verification Code IS $otp"
        }),
      );

      final data = jsonDecode(response.body);
      final code = data["message"];

      if (code == "emailSendSuccess") return data;
      final error = checkErrorCode(code);
      return error["isThere"]
          ? {"message": error["errorCode"]}
          : {"message": "somethingWrong"};
    } catch (e) {
      return {"message": "somethingWrong"};
    }
  }

  /// Send custom message
  Future<Map<String, dynamic>> sendMessage(
      String toEmail, String title, String subject, String body) async {
    if (!checkEmail(toEmail)) return {"message": "wrongEmail"};
    if (!await checkServer()) return {"message": "serverUnderMaintenance"};

    try {
      final response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "toEmail": toEmail,
          "title": title,
          "subject": subject,
          "body": body
        }),
      );

      final data = jsonDecode(response.body);
      final code = data["message"];

      if (code == "emailSendSuccess") return data;
      final error = checkErrorCode(code);
      return error["isThere"]
          ? {"message": error["errorCode"]}
          : {"message": "somethingWrong"};
    } catch (e) {
      return {"message": "somethingWrong"};
    }
  }

  /// Send with custom credentials
  Future<Map<String, dynamic>> customMessage(
      String fromEmail,
      String passkey,
      String toEmail,
      String title,
      String subject,
      String body) async {
    if (!checkEmail(toEmail)) return {"message": "wrongEmail"};
    if (!await checkServer()) return {"message": "serverUnderMaintenance"};

    try {
      final response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "fromEmail": fromEmail,
          "passkey": passkey,
          "toEmail": toEmail,
          "title": title,
          "subject": subject,
          "body": body
        }),
      );

      final data = jsonDecode(response.body);
      final code = data["message"];

      if (code == "emailSendSuccess") return data;
      final error = checkErrorCode(code);
      return error["isThere"]
          ? {"message": error["errorCode"]}
          : {"message": "somethingWrong"};
    } catch (e) {
      return {"message": "somethingWrong"};
    }
  }
}
