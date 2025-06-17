class UserInfo {
  final String username;
  final String? email;
  final String? phone;
  final String? bio;
  final String? avatar;

  UserInfo({
    required this.username,
    this.email,
    this.phone,
    this.bio,
    this.avatar,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      username: json['username'] ?? '',
      email: json['email'],
      phone: json['phone'],
      bio: json['bio'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'phone': phone,
      'bio': bio,
      'avatar': avatar,
    };
  }

  @override
  String toString() {
    return 'UserInfo(username: $username, email: $email, phone: $phone, bio: $bio, avatar: $avatar)';
  }
}