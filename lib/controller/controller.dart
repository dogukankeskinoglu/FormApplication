String textValidator(int number, String value) {
  switch (number) {
    case 0:
      return value.length <= 0 ? "Lütfen ilgili alanı doldurunuz" : null;
      break;

    case 1:
      return value.length < 11 ? "TC NO 11 Haneden düşük olamaz" : null;
      break;

    case 2:
      return validateEmail(value);

    
  }
}



String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(value)) ? "Lütfen Geçerli email giriniz" : null;
}
