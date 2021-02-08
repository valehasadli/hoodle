import 'package:form_validator/form_validator.dart';

import '../../common/utils/error_constants.dart';

extension ConfirmPasswordValidator on ValidationBuilder {
  confirm(String password) => add(
        (value) {
          if (password != value) {
            return kMatchPassError;
          }
          return null;
        },
      );
}
