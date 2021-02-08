// Form Errors

// email constants
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kLongEmailError = "Email is too long";

// password constants
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kLongPassError = "Password is too long";
const String kMatchPassError = "Passwords don't match";
const String kPassShouldNotPasswordError = "Password should not 'password'";

// name constants
const String kNameNullError = "Please Enter your name";
const String kShortNameError = "Name is too short";
const String kLongNameError = "Name is too long";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

// server errors
const String SERVER_FAILURE_MESSAGE = 'SERVER FAILURE';
const String CACHE_FAILURE_MESSAGE = 'CACHE FAILURE';
const String UNEXPECTED_FAILURE_MESSAGE = 'UNEXCEPTED FAILURE';
