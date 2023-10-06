class Group {
  final String? id;
  final String? name;
  final String? description;
  final String? grpIcon;
  final int? members;
  final bool? verified;

  Group({
    this.id,
    this.name,
    this.description,
    this.grpIcon,
    this.members,
    this.verified,
  });

  Group.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['email'],
        grpIcon = json['grpIcon'],
        members = json['members'],
        verified = json['verified'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'grpIcon': grpIcon,
        'members': members,
        'verified': verified,
      };
}
