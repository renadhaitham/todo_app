class UserModel {
  String id;
  String name;
  int age;
  String email;

  UserModel({required this.id,
    required this.name,
    required this.age,
    required this.email});

  UserModel.fromJson(Map<String, dynamic>json) :this(
    id: json['id'],
    name: json['name'],
    age: json['age'],
    email: json['email'],
  );

  Map<String, dynamic> toJson() {
    return {
      " id": id,
      " name": name,
      "age": age,
      "email": email,
    };
  }

}
