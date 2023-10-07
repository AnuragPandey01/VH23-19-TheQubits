class Group {
  final String? id;
  final String? name;
  final String? description;
  final String? grpIcon;
  final int? members;
  final bool? verified;
  final Object? createdAt;

  Group({
    this.id,
    this.name,
    this.description,
    this.grpIcon,
    this.members,
    this.verified,
    this.createdAt,
  });

  Group.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        grpIcon = json['grpIcon'],
        members = json['members'],
        verified = json['verified'],
        createdAt = json['createdAt'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'grpIcon': grpIcon,
        'members': members,
        'verified': verified,
        'createdAt': createdAt,
      };
}
