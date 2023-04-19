class RequestAPP {
  static signUpRequest(
      {required name, required phone, required is_style, required birthday}) {
    return {
      'fullName': name,
      'phone': phone,
      'is_style': is_style,
      'birthday': birthday
    };
  }
}
