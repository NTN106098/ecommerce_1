class RequestAPP {
  static signUpRequest(
      {required fullName,
      required phone,
      required is_style,
      required birthday}) {
    return {
      'fullName': fullName,
      'phone': phone,
      'is_style': is_style,
      'birthday': birthday
    };
  }
}
