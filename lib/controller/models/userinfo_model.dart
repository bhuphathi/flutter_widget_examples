import 'dart:convert';

import 'package:flutter_widget_examples/controller/role_controller.dart';

class UserInfoModel {
  final String? displayName;
  final String? email;
  final bool? isEmailVerified;
  final String? phoneNumber;
  final String? photoURL;
  final String? uid;
  final Role? role; //must be an array for complex apps
  const UserInfoModel({
    required this.displayName,
    required this.email,
    required this.isEmailVerified,
    required this.phoneNumber,
    required this.photoURL,
    required this.uid,
    required this.role,
  });

  UserInfoModel copyWithString({
    String? displayName,
    String? email,
    String? isEmailVerified,
    String? phoneNumber,
    String? photoURL,
    String? uid,
    String? role,
  }) {
    bool? parseBoolean(String? boolValue) {
      if (boolValue == null) return null;
      return boolValue.toLowerCase() == "true";
    }

    Role? parseRole(String? role) {
      if (role == null) return null;
      return Role.values.firstWhere((e) => e.toString() == role);
    }

    return UserInfoModel(
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      isEmailVerified: parseBoolean(isEmailVerified) ?? this.isEmailVerified,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoURL: photoURL ?? this.photoURL,
      uid: uid ?? this.uid,
      role: parseRole(role) ?? this.role,
    );
  }

  UserInfoModel copyWith({
    String? displayName,
    String? email,
    bool? isEmailVerified,
    String? phoneNumber,
    String? photoURL,
    String? uid,
    Role? role,
  }) {
    return UserInfoModel(
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoURL: photoURL ?? this.photoURL,
      uid: uid ?? this.uid,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'email': email,
      'isEmailVerified': isEmailVerified,
      'phoneNumber': phoneNumber,
      'photoURL': photoURL,
      'uid': uid,
      //   'role': role?.toString(),
      'role': role?.toString(),
    };
  }

  factory UserInfoModel.init() {
    return const UserInfoModel(
      displayName: null,
      email: null,
      isEmailVerified: null,
      phoneNumber: null,
      photoURL: null,
      uid: null,
      role: null,
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (displayName != null) "displayName": displayName,
      if (email != null) 'email': email,
      if (isEmailVerified != null) 'isEmailVerified': isEmailVerified,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (photoURL != null) 'photoURL': photoURL,
      if (uid != null) 'uid': uid,
      if (role != null) 'role': role.toString(),
    };
  }

  static Role stringToRole(String role) {
    return Role.values.singleWhere(
      (e) => e.toString() == role,
      //if search string not in Role enum then return Role.anonymous
      orElse: () => Role.anonymous,
    );
  }

  factory UserInfoModel.fromMap(Map<String, dynamic> map) {
    return UserInfoModel(
      displayName: map['displayName'] != null ? map['displayName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      isEmailVerified: map['isEmailVerified'] != null ? map['isEmailVerified'] as bool : null,
      phoneNumber: map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      photoURL: map['photoURL'] != null ? map['photoURL'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      //   role: map['role'] != null ? Role.values.firstWhere((e) => e.toString() == map["role"]) : null,
      role: map['role'] != null ? stringToRole(map["role"]) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfoModel.fromJson(String source) =>
      UserInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserInfo(displayName: $displayName, email: $email, isEmailVerified: $isEmailVerified, phoneNumber: $phoneNumber, photoURL: $photoURL, uid: $uid, role: $role)';
  }

  @override
  bool operator ==(covariant UserInfoModel other) {
    if (identical(this, other)) return true;

    return other.displayName == displayName &&
        other.email == email &&
        other.isEmailVerified == isEmailVerified &&
        other.phoneNumber == phoneNumber &&
        other.photoURL == photoURL &&
        other.uid == uid &&
        other.role == role;
  }

  @override
  int get hashCode {
    return displayName.hashCode ^
        email.hashCode ^
        isEmailVerified.hashCode ^
        phoneNumber.hashCode ^
        photoURL.hashCode ^
        uid.hashCode ^
        role.hashCode;
  }
}
