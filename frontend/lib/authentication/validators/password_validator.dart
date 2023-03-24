String? passwordValidator(String? value) {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  if (value == null || value.isEmpty) {
    return "Please enter your password.";
  }
  if (!regex.hasMatch(value)) {
    return "Enter a valid password: \n At least - 1 uppercase, 1 lowercase, 1 number, 1 special character\n At least 8 characters long";
  }
  return null;
}
