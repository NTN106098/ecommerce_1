class User {
  String? name;
  String? phone;
  String? is_style;
  String? birthday;

  User({this.name, this.phone, this.is_style, this.birthday});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    is_style = json['is_style'];
    birthday = json['birthday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['phone'] = phone;
    data['is_style'] = is_style;
    data['birthday'] = birthday;

    return data;
  }
}
