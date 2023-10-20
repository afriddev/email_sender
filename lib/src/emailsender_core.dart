import 'package:requests/requests.dart';

///main class
class EmailSender {
  ///main server url
  final String server = "https://sendemail.cyclic.app/";

  ///emailAPI website url
  final String url = "https://sendemail.cyclic.app/sendEmail/";

  /// list of error codes fromm server
  List errorCodes = [
    "wrongEmail",
    "sendEmailFailed",
    "wrongCrendentials",
    "passkeyRequired",
    "serverError"
  ];
  //var otp = Random().nextInt(999999).toString().padLeft(6,'0');

  //initalize emailSender section start
  /*
  
  */
  //initalize emailSender section end

  ///check errorCode is present in errorCode section start
  checkErrorCode(message) {
    ///initialize i
    int i = 0;
    while (i < errorCodes.length) {
      if (message == errorCodes[i]) {
        return {"isThere": true, "errorCode": errorCodes[i]};
      } else {
        return {"isThere": false};
      }
    }
  }

  //check errorCode is present in errorCode section end

  ///check serevr is running or not section start
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

  //check server is running or not section end
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
  //details server method end

  ///send default crendentials to provided email section start
  send(String toEmail) async {
    try {
      if (await checkServer()) {
        if (checkEmail(toEmail)) {
          ///response
          var response = await Requests.post(url, json: {"toEmail": toEmail});

          ///check fo rerror code
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
  //send default crendentials to provided email section start

  ///sendOtp and all are  default crendentials to provided email section start
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

  //sendOtp section end
  ///send Custom Email with parameters section start
  sendMessage(String toEmail, String title, String subject, String body) async {
    try {
      if (await checkServer()) {
        if (checkEmail(toEmail)) {
          ///response
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

  //send Custom Email With parameters section end

  ///send custom Email With Custom Email And Passkey section start
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
  //Send Custom Email With Custom Email And Passkey section end

  ///check email is valid or not section start
  bool checkEmail(String email) {
    ///returns true when email is valid else false
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }
  //check email is valid or not section end
}
