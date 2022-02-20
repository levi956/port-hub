class User {
  int? id;
  String? firstName;
  String? lastName;
  String? profilePhoto;

  User({this.id, this.firstName, this.lastName, this.profilePhoto});

  static List<User?> generateUsers() {
    return [
      User(
        id: 1,
        firstName: 'Nifesi',
        lastName: 'Odumirin',
        profilePhoto: 'assets/images/nifesi1.JPG',
      ),
      User(
        id: 2,
        firstName: 'Adebayo',
        lastName: 'Tantoluwa',
        profilePhoto: 'assets/images/tanto.jpg',
      ),
      User(
        id: 3,
        firstName: 'Amuson',
        lastName: 'Tony',
        profilePhoto: 'assets/images/nifesi2.jpg',
      ),
      User(
        id: 4,
        firstName: 'Omoleye',
        lastName: 'Samuel',
        profilePhoto: 'assets/images/baba.jpg',
      ),
      User(
        id: 5,
        firstName: 'Maakinwa',
        lastName: 'Morexx',
        profilePhoto: 'assets/images/nifesi2.jpg',
      ),
    ];
  }
}
