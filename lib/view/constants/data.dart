// Validators
String validationEmail =
    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
//Valid email address required: text@domain.com
String validationPassword =
    r'(?=[A-Za-z0-9@#$%^&+!=]+$)^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@#$%^&+!=])(?=.{8,}).*$';
//  password with 8+ characters, including uppercase, lowercase, numbers, and special characters like @#$%^&+!=
String validationPassword2 = r'^(?=.*\d).{8,}$';
//password that must be at least 8 characters long, containing at least one alphabetical character and at least one digit
String validatePasswordUpperCase = r'[A-Z]';
String validatePasswordLowerCase = r'[a-z]';
String validatePasswordDigits = r'[0-9]';
String validatePasswordSpecialChar = r'[!@#$%^&*(),.?":{}|<>]';
String validationName = r'^[a-z A-Z]+$';
String validationPhone = r'^01(0|1|2|5)[0-9]{8}$';

String validateNationalId = r'^[1-2]\d{12}[0-9]$';
String validationLink =
    r'^(https?://)?(www\.)?[A-Za-z0-9]+\.[A-Za-z]{2,}(\S*)$';
String userAccessToken = '';
