class Users {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? profilePhoto;

  Users(
      {this.id, this.firstName, this.lastName, this.profilePhoto, this.email});

  factory Users.fromJson(Map<String, dynamic> map) {
    return Users(
        firstName: map["firstName"],
        lastName: map["lastName"],
        email: map["email"],
        profilePhoto: map["profilePhoto"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
    };
  }

  static List<Users?> generateUsers() {
    return [
      Users(
        id: 1,
        firstName: 'Nifesi',
        lastName: 'Odumirin',
        profilePhoto: 'assets/images/nifesi1.JPG',
      ),
      Users(
        id: 2,
        firstName: 'Adebayo',
        lastName: 'Tantoluwa',
        profilePhoto: 'assets/images/tanto.jpg',
      ),
      Users(
        id: 3,
        firstName: 'Amuson',
        lastName: 'Tony',
        profilePhoto: 'assets/images/nifesi2.jpg',
      ),
      Users(
        id: 4,
        firstName: 'Omoleye',
        lastName: 'Samuel',
        profilePhoto: 'assets/images/baba.jpg',
      ),
      Users(
        id: 5,
        firstName: 'Maakinwa',
        lastName: 'Morexx',
        profilePhoto: 'assets/images/nifesi2.jpg',
      ),
    ];
  }
}
