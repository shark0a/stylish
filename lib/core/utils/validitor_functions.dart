class ValiditorFunctions {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'This filed required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please check your email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'This filed required';
    }
    if (value.length < 6) {
      return 'password ca\'nt less than 6 letter';
    }
    return null;
  }
}
