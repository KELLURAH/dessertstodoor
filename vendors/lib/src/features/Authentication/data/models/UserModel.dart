class UserModel {
  String? email;
  String? password;
  String? firstname;
  String? lastname;
  int? pin;

  UserModel(
      {this.email, this.password, this.lastname, this.firstname, this.pin});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'lastname': lastname,
      'firstname': firstname,
      'pin': pin
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'lastname': lastname,
      'firstname': firstname,
      'pin': pin
    };
  }

  @override
  String toString() {
    return 'UserModel{email: $email, password: $password, firstname: $firstname, lastname: $lastname, pin: $pin}';
  }
}
