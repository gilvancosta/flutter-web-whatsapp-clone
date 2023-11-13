// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class UserEntity {
  String uid;
  String name;
  String email;
  String password;
  String image;


  UserEntity(
    this.uid,
    this.name,
    this.email,
    this.password, {
    this.image = '',
  });



 Map<String, dynamic> toJson()
  {
    return
      {
        "uid": uid,
        "name": name,
        "email": email,
        "password": password,
        "image": image,
      };
  }

}
