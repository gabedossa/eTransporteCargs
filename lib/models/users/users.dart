class Users {
  late String id;
  late String user_name;
  late String user_cargo;
  late String user_email;
  late String user_password;
  //commit teste

  Users(this.user_name, this.user_cargo, this.user_email, this.user_password);

  Users.fromMap(Map<String, dynamic> map)
      : user_name = map['user_name'],
        user_cargo = map['user_cargo'],
        user_email = map['user_email'],
        user_password = map['user_password'];

  Map<String, dynamic> toMap() {
    return {
      'user_name': user_name,
      'user_cargo': user_cargo,
      'user_mail': user_email,
      'user_password': user_password
    };
  }
}
