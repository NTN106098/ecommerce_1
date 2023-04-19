import 'package:ecommerce_app_fhh_02/widgets/my_text_field.dart';

class Validation {
  bool? _isError;
  String? _errorMessage;
  List<bool>? _validateError;
  List<String>? _validateMessages;

  Validation(int fieldNumber) {
    _isError = false;
    _errorMessage = '';
    _validateError = List.generate(fieldNumber, (index) => false);
    _validateMessages = List.generate(fieldNumber, (index) => '');
  }

  String? get errorMessage => _errorMessage;
  bool? get isError => _isError;
  bool error(index) => _validateError![index];
  String message(index) => _validateMessages![index];

  set errorMessage(String? value) {
    _errorMessage = value;
  }

  set isError(bool? value) {
    _isError = value;
  }

  _setMessage(index, message) {
    _validateMessages![index] = message;
  }

  _setError(index, error) {
    _validateError![index] = error;
  }

  showError(MyTextController state, String error, int index) {
    state.setError(error);
    state.alertError();
    _setError(index, true);
    _setMessage(index, error);
  }

  // clearError(MyTextController state, int index) {
  //   state.resetError();
  //   _setError(index, false);
  //   _setMessage(index, '');
  // }
}

bool validatePhone(String value) {
  String pattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return false;
  } else if (regExp.hasMatch(value)) {
    return true;
  }
  return false;
}
