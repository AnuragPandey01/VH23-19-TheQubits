class User {
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
      : firstName = json['firstName'],
        lastName = json['lastName'],
        email = json['email'],
        profileImg = json['profileImg'],
        instName = json['institutionName'],
        isClgStud = json['isClgStud'],
        branch = json['branch'],
        year = json['year'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
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
