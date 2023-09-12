Here the example of all method, enjoy coding 😃
```dart
import 'package:email_sender/email_sender.dart';

void main() async {
  //initalize EmailSender class
  EmailSender emailSender = EmailSender();
  //initalize send method to response variable
  var response = await emailSender.send("@gmail.com");
  if (response["message"] == "emailSendSuccess") {
    print(response);
  } else {
    print("something Failed");
    //for understanding the error 
    print(response);
  }
}


```