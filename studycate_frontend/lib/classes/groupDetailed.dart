import 'dart:ffi';

class GroupDetailed {
  final String? id;
  final String? name;
  final String? description;
  final String? grpIcon;
  final int? memberC;
  final bool? verified;
  final Object? createdAt;
  final List<String>? members;
  final List<String>? admin;

  GroupDetailed({
    this.id,
    this.name,
    this.description,
    this.grpIcon,
    this.memberC,
    this.verified,
    this.createdAt,
    this.members,
    this.admin,
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
        admin = List<String>.from(json['admin']);

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
        'admin': admin,
      };
}
