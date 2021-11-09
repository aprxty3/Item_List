class loginRespon {
  final String token;
  final String error;

  loginRespon({this.token, this.error});

  factory loginRespon.fromJson(Map<String, dynamic> json) {
    return loginRespon(
        token: json['token'] != null ? json['token'] : "",
        error: json['error'] != null ? json['error'] : "");
  }
}

class loginRequest {
  String email;
  String password;

  loginRequest({this.email, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim()
    };

    return map;
  }
}
