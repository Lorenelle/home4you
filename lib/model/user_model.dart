class UserModel {
  String? uid;
  String? name;
  String? email;
  String? bio;
  String? profileImg;
  bool? isDarkMode;

  UserModel(
      {this.uid,
      this.name,
      this.email,
      this.bio,
      this.profileImg,
      this.isDarkMode});

  //data from server

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      bio: map['bio'],
      profileImg: map['profileImg'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'bio': bio,
      'profileImg': profileImg
    };
  }
}
