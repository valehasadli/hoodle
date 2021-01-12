import 'package:form_validator/form_validator.dart';

import '../utils/constants.dart';

extension EmailValidator on ValidationBuilder {
  cEmail() => add(
        (value) {
          if (!emailValidatorRegExp.hasMatch(value)) {
            return kInvalidEmailError;
          }
          return null;
        },
      );
}
