/*
------------------------------------------------------------
|               Author   : Shaik Afrid                     |
|               GitHub   : @afriddev                       |
|               License  : MIT (Shaik Afrid, 2023)         |
------------------------------------------------------------
*/

/*
----------- Server Post Response Format ---------------------
|  fromEmail : String | null = defaultEmail                |
|  toEmail   : String (required)                           |  
|  title     : String | null = defaultFromTitle            |
|  subject   : String | null = defaultSubject              |
|  body      : String | null = defaultBody                 |
|  passkey   : String | null = null                        |
-------------------------------------------------------------
*/

library email_sender;

export 'src/emailsender_core.dart';

/// Help class for Email Sender
class Email {
  /// Prints help and usage instructions
  void help() {
    const String helpText = '''

------------------------------------------------------------
|               Author   : Shaik Afrid                     |
|               GitHub   : @afriddev                       |
|               License  : MIT (Shaik Afrid, 2023)         |
------------------------------------------------------------

📧 USAGE GUIDE - EMAIL SENDER

1. Initialize EmailSender:
   > EmailSender emailsender = EmailSender();

2. Call any method:
   > var response = await emailsender.send("toemail@gmail.com");

3. Print the result:
   > print(response);

📌 RULES FOR USAGE

- "toEmail" is required for sending any email.
- You **must** use an App Password for sending custom messages.
  🔐 Generate it here: https://support.google.com/accounts/answer/13548313?hl=en
- All other fields are optional. If left null, default values will be used.

✅ AVAILABLE METHODS

- send()
- sendOtp()
- sendMessage()
- customMessage()

------------------------------------------------------------

''';
    print(helpText);
  }
}
