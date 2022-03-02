import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:port_hub/utils/styles/color_constants.dart';

import '../models/user.dart';
import '../utils/widgets/message_toast.dart';

class DatabaseMethods {
  CollectionReference myDatabase =
      FirebaseFirestore.instance.collection('users');
  DocumentReference<Map<String, dynamic>> myDatabaseDocument =
      FirebaseFirestore.instance.collection("users").doc(uid);

  // saves user details to firebase approach 1
  // the method takes it in as a map
  uploadUserInfo(Map userDetails) async {
    uid = FirebaseAuth.instance.currentUser?.uid;
    await myDatabase.doc(uid).set(userDetails).catchError((error) {
      showErrorToast('Failed to add user: $error');
    });
  }

  // saves user details to firebase approach 2
  // study and master this approach
  addUserInfo(Users userInfo) {
    return myDatabase
        .doc(uid)
        .set(userInfo.toJson())
        .then((value) => print('worked'))
        .catchError((error) => (showErrorToast('Error')));
  }

  // returns instance of future, not the value
  Future<String> getName2() async {
    uid = FirebaseAuth.instance.currentUser?.uid;
    var x = await myDatabase.doc(uid).get();
    var result = (x.data() as Map)["firstName"];
    return result.toString();
  }

  //get weights
  //  Stream<List<Users>> streamWeights() async* {
  //   yield* myDatabase.snapshots().map((event) {
  //     List<Users> userDetails = event.docs.map((doc) {
  //       return Users.fromJson(doc.data())..id = doc.id as int?;
  //     }).toList();
  //     // weights.sort((a, b) => b.dateAdded.compareTo(a.dateAdded));
  //     return userDetails;
  //   });
  // }

  // String getFirstName() {
  //   DocumentReference documentReference = myDatabase.doc(uid);
  //   String? firstName;
  //   documentReference.get() => then(document)
  //   return firstName!;
  // }

  // getName() {  --- this is a colletion reference
  //   DocumentReference documentReference = myDatabase.doc(uid);
  //   myDatabase.doc.(uid).get().then((QuerySnapshot querySnapshot) {
  //     String nnn = (querySnapshot.docs.first.data() as Map)["firstName"];
  //     print(nnn);
  //     // for (var doc in querySnapshot.docs) {
  //     //   (doc.data() as Map)["firstName"];
  //     //   // Map.from(doc.data()!["firstName"]);
  //     //   print(doc["firstName"]);
  //     // }
  //   });
  // }

}
