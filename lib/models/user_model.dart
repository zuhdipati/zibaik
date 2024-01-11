// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String status;
  UserModel result;

  User({
    required this.status,
    required this.result,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        status: json["status"],
        result: UserModel.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result.toJson(),
      };
}

class UserModel {
  String? name;
  int? income;
  int? expense;
  int? totalBalance;

  UserModel({
    this.name,
    this.income,
    this.expense,
    this.totalBalance,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        income: json["income"],
        expense: json["expense"],
        totalBalance: json["total_balance"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "income": income,
        "expense": expense,
        "total_balance": totalBalance,
      };
}
