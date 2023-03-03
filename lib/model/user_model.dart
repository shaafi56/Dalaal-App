class UserModel{
  String? uid;
  String? email;
  String? fullname;
  String? phone;

  UserModel({this.uid, this.email, this.fullname, this.phone});

  //receiving data from server;
  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      fullname: map['fullname'],
      phone: map['phone'],

    );
  }

//sending data to our server;
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullname': fullname,
      'phone': phone,
      'role': 'user',
    };
  }
}
