String phoneNumberValidator(String value) {
  Pattern pattern = r'^[6-9][0-9]{9}$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value)) return 'Invalid phone number!';
  return null;
}

String otpValidator(String value) {
  Pattern pattern = r'^[0-9]{6}$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value)) return 'Invalid OTP!';
  return null;
}
