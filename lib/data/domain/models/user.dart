import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

class User {
  String login;
  String avatarUrl;
  String name;
  String company;

  User({
    required this.login,
    required this.avatarUrl,
    required this.name,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        login: json["login"],
        avatarUrl: json["avatar_url"],
        name: json["name"],
        company: json["company"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "avatar_url": avatarUrl,
        "name": name,
        "company": company,
      };

  @override
  String toString() {
    return 'User{login: $login, avatarUrl: $avatarUrl, name: $name, company: $company}';
  }
}
