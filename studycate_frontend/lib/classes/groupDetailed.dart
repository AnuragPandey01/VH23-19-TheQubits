import 'dart:convert';
import 'dart:ffi';

import 'package:studycate/classes/user.dart';

class GroupDetailed {
  final String? id;
  final String? name;
  final String? description;
  final String? grpIcon;
  final int? memberC;
  final bool? verified;
  final Object? createdAt;
  final List<String>? members;
  final String? creatorName;

  GroupDetailed({
    this.id,
    this.name,
    this.description,
    this.grpIcon,
    this.memberC,
    this.verified,
    this.createdAt,
    this.members,
    this.creatorName,
  });

  GroupDetailed.fromJson(Map<String, dynamic> json)
      : id = json['detail']['id'],
        name = json['detail']['name'],
        description = json['detail']['description'],
        grpIcon = json['detail']['grpIcon'],
        memberC = json['detail']['members'],
        verified = json['detail']['verified'],
        createdAt = json['detail']['createdAt'],
        members = List<String>.from(json['members']),
        creatorName = json['creatorName'];

  Map<String, dynamic> toJson() => {
        'detail': {
          'id': id,
          'name': name,
          'description': description,
          'grpIcon': grpIcon,
          'members': memberC,
          'verified': verified,
          'createdAt': createdAt,
        },
        'members': members,
        'creatorName': creatorName,
      };
}
