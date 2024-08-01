/*
------------------------------------------------------------
|               author  : shaik afrid                      |
|               github  : @afriddev                        |
|               license : MIT (shaik afrid ,2023)          |
-------------------------------------------------------------
 */
/*
----------- Server Post Response Format ---------------------
|            fromEmail:str | None = defaultEmail            |
|            toEmail:str                                    |  
|            title:str     | None == defaultFromTitle       |
|            subject:str   | None == defaultSubject         |
|            body:str      | None == defaultBody            |
|            passkey:str   | None == None                   |
-------------------------------------------------------------
 */
library email_sender;

export 'src/emailsender_core.dart';

///helpemail class
class Email {
  void help() {
    ///help variable
    var help = """

------------------------------------------------------------
|               author  : shaik afrid                      |
|               github  : @afriddev                        |
|               license : MIT (shaik afrid ,2023)          |
------------------------------------------------------------


-> USAGE EMAIL SENDER

  1. Initalize EmailSender
  2. Initalize a method from EmailSender
  3. Get output

-> Rules for usage

  4. toEmail must be initalize for sending email
  5. You cannot use password to send custom message you need to provide app password , for more. visit : https://support.google.com/accounts/answer/13548313?hl=en
  6. If you dont fill other fileds api will automatically fill default data except toEmail

-> Examples usage

  > EmailSender emailsender = EmailSender();
  > var responseFromEmailSender = await emailsender.details();
  > print(responseFromEmailSender);

-> Methods


  > send()
  > sendOtp()
  > sendMessage()
  > custom()
  

""";
    print(help);
  }
}
