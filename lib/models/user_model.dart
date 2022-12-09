class User {
  int? iD;
  String? name;
  String? email;
  int? permission;
  String? cinema;

  User({this.iD, this.name, this.email, this.permission, this.cinema});

  User.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['name'];
    email = json['email'];
    permission = json['permission'];
    cinema = json['cinema'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['name'] = name;
    data['email'] = email;
    data['permission'] = permission;
    data['cinema'] = cinema;
    return data;
  }
}
