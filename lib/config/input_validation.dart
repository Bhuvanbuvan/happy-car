String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }
  String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  RegExp regex = RegExp(emailPattern);
  if (!regex.hasMatch(value)) {
    return 'Enter a valid email address';
  }
  return null;
}

String? validateOtp(String? value) {
  if (value == null || value.isEmpty) {
    return 'OTP is required';
  }
  if (value.length != 6) {
    return 'Enter a valid OTP';
  }
  return null;
}

String? validateString(String? value) {
  if (value == null || value.isEmpty) {
    return 'Field is required';
  }
  return null;
}
