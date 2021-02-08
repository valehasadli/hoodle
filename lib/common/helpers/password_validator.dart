import 'package:form_validator/form_validator.dart';

import '../../common/utils/error_constants.dart';

extension PasswordValidator on ValidationBuilder {
  password() => add(
        (value) {
          if (value == 'password') {
            return kPassShouldNotPasswordError;
          }
          return null;
        },
      );
}
