import 'dart:convert';

class UserModel {
  final String name;
  final String avatar_url;
  final String bio;
  UserModel({
    required this.name,
    required this.avatar_url,
    required this.bio,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'avatar_url': avatar_url,
      'bio': bio,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      avatar_url: map['avatar_url'] ?? '',
      bio: map['bio'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(name: $name, avatar_url: $avatar_url, bio: $bio)';

  UserModel copyWith({
    String? name,
    String? avatar_url,
    String? bio,
  }) {
    return UserModel(
      name: name ?? this.name,
      avatar_url: avatar_url ?? this.avatar_url,
      bio: bio ?? this.bio,
    );
  }
}
