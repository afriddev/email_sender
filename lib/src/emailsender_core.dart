import 'package:requests/requests.dart';

///main class
class EmailSender {
  ///main server url
  final String server = "freeemailapi.vercel.app";

  ///emailAPI website url
  final String url = "freeemailapi.vercel.app/sendEmail/";

  /// list of error codes fromm server
  List errorCodes = [
    "wrongEmail",
    "sendEmailFailed",
    "wrongCrendentials",
    "passkeyRequired",
    "serverError"
  ];

  ///check errorCode is present in errorCode 
  checkErrorCode(message) {
    int i = 0;
    while (i < errorCodes.length) {
      if (message == errorCodes[i]) {
        return {"isThere": true, "errorCode": errorCodes[i]};
      } else {
        return {"isThere": false};
      }
    }
  }

  ///check serevr is running or not 
  checkServer() async {
    ///response
    var response = await Requests.get(server);

    if (response.json()["message"]["serverStatus"] == "running") {
      return true;
    } else if (response.json()["message"]["serverStatus"] ==
        "serverUnderMaintenance") {
      return false;
    } else {
      return false;
    }
  }

  ///details server method secion start
  details() async {
    try {
      if (await checkServer()) {
        ///response
        var response = await Requests.get(server);
        return {"message": response.json()["message"]};
      } else {
        return {"message": "serverUnderMaintenance"};
      }
    } catch (e) {
      return {"message": "somethingWrong"};
    }
  }

  ///send default crendentials to provided email 
  send(String toEmail) async {
    try {
      if (await checkServer()) {
        if (checkEmail(toEmail)) {
          ///response
          var response = await Requests.post(url, json: {"toEmail": toEmail});
          ///check for error code
          var checkErrorCodeIsPresentOrNot =
              checkErrorCode(response.json()["message"])["isThere"];
          if (response.json()["message"] == "emailSendSuccess") {
            return response.json();
          } else if (checkErrorCodeIsPresentOrNot) {
            return {"message": checkErrorCodeIsPresentOrNot["erroCode"]};
          } else {
            return {"message": "somethingWrong"};
          }
        } else {
          return {"message": "wrongEmail"};
        }
      } else {
        return {"message": "serverUnderMaintenance"};
      }
    } catch (e) {
      return {"message": "somethingWrong"};
    }
  }

  ///sendOtp and all are  default crendentials to provided email 
  sendOtp(String toEmail, int otp) async {
    try {
      if (await checkServer()) {
        if (checkEmail(toEmail)) {
          ///response
          var response = await Requests.post(url, json: {
            "toEmail": toEmail,
            "body": "Your Verification Code IS $otp"
          });
          ///check error code is present or not
          var checkErrorCodeIsPresentOrNot =
              checkErrorCode(response.json()["message"])["isThere"];
          if (response.json()["message"] == "emailSendSuccess") {
            return response.json();
          } else if (checkErrorCodeIsPresentOrNot) {
            return {"message": checkErrorCodeIsPresentOrNot["erroCode"]};
          } else {
            return {"message": "somethingWrong"};
          }
        } else {
          return {"message": "wrongEmail"};
        }
      } else {
        return {"message": "serverUnderMaintenance"};
      }
    } catch (e) {
      return {"message": "somethingWrong"};
    }
  }

  ///send Custom Email with parameters 
  sendMessage(String toEmail, String title, String subject, String body) async {
    try {
      if (await checkServer()) {
        if (checkEmail(toEmail)) {
          var response = await Requests.post(url, json: {
            "toEmail": toEmail,
            "title": title,
            "subject": subject,
            "body": body
          });
          ///check error code is present or not
          var checkErrorCodeIsPresentOrNot =
              checkErrorCode(response.json()["message"])["isThere"];
          if (response.json()["message"] == "emailSendSuccess") {
            return response.json();
          } else if (checkErrorCodeIsPresentOrNot) {
            return {"message": checkErrorCodeIsPresentOrNot["erroCode"]};
          } else {
            return {"message": "somethingWrong"};
          }
        } else {
          return {"message": "wrongEmail"};
        }
      } else {
        return {"message": "serverUnderMaintenance"};
      }
    } catch (e) {
      return {"message": "somethingWrong"};
    }
  }


  ///send custom Email With Custom Email And Passkey 
  customMessage(String fromEmail, String passkey, String toEmail, String title,
      String subject, String body) async {
    try {
      if (await checkServer()) {
        if (checkEmail(toEmail)) {
          ///response
          var response = await Requests.post(url, json: {
            "fromEmail": fromEmail,
            "passkey": passkey,
            "toEmail": toEmail,
            "title": title,
            "subject": subject,
            "body": body
          });
          ///check error code is present or not
          var checkErrorCodeIsPresentOrNot =
              checkErrorCode(response.json()["message"])["isThere"];
          if (response.json()["message"] == "emailSendSuccess") {
            return response.json();
          } else if (checkErrorCodeIsPresentOrNot) {
            return {"message": checkErrorCodeIsPresentOrNot["erroCode"]};
          } else {
            return {"message": "somethingWrong"};
          }
        } else {
          return {"message": "wrongEmail"};
        }
      } else {
        return {"message": "serverUnderMaintenance"};
      }
    } catch (e) {
      return {"message": "somethingWrong"};
    }
  }

  ///check email is valid or not 
  bool checkEmail(String email) {
    ///returns true when email is valid else false
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }
}
