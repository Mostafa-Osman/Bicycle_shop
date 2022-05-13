import 'dart:developer';

bool checkPhoneValidate({required String phoneNumber}) {
  if (phoneNumber[0] == '0' && phoneNumber[1] == '1' && phoneNumber[2] == '0' ||
      phoneNumber[0] == '0' && phoneNumber[1] == '1' && phoneNumber[2] == '1' ||
      phoneNumber[0] == '0' && phoneNumber[1] == '1' && phoneNumber[2] == '2' ||
      phoneNumber[0] == '0' && phoneNumber[1] == '1' && phoneNumber[2] == '5') {
    if (RegExp('^(?:[+0]9)?[0-9]{11}').hasMatch(phoneNumber)) {
      log('true');
      return true;
    }
  }
  log('false');

  return false;
}
