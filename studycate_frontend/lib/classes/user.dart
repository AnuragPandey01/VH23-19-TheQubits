// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profileImg;
  final String? instName;
  final bool? isClgStud;
  final String? branch;
  final int? year;
  final String? password;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.profileImg,
    this.instName,
    this.isClgStud,
    this.branch,
    this.year,
    this.password,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        email = json['email'],
        profileImg = json['profileImg'],
        instName = json['institutionName'],
        isClgStud = json['isClgStud'],
        branch = json['branch'],
        year = json['year'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'profileImg': profileImg,
        'institutionName': instName,
        'isClgStud': isClgStud,
        'branch': branch,
        'year': year,
        'password': password,
      };
}
