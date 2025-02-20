class User {
   int id;
   String name;
   String phone;
   String gender;
   int isActive;
   int goal;
   String createdAt;
   String updatedAt;
   String fcmToken;
   String? email;
   int? ageRange;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.gender,
    required this.isActive,
    required this.goal,
    required this.createdAt,
    required this.updatedAt,
    required this.fcmToken,
    this.email,
    this.ageRange,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      gender: json['gender'],
      isActive: json['is_active'],
      goal: json['goal'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      fcmToken: json['fcm_token'],
      email: json['email'],
      ageRange: json['age_range'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'gender': gender,
      'is_active': isActive,
      'goal': goal,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'fcm_token': fcmToken,
      'email': email,
      'age_range': ageRange,
    };
  }
}