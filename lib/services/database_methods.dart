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
  addUserInfo(Users userInfo) async {
    uid = FirebaseAuth.instance.currentUser?.uid;
    await myDatabase
        .doc(uid)
        .set(userInfo.toJson())
        // .then((value) => print('worked'))
        .catchError((error) => (showErrorToast('Error')));
  }

  // returns instance of future of user first name, not the value
  // furture builder used to get the value
  Future<String> getName2() async {
    uid = FirebaseAuth.instance.currentUser?.uid;
    var x = await myDatabase.doc(uid).get();
    var result = (x.data() as Map)["firstName"];
    return result.toString();
  }

  // creating the stream here
  Stream<List<Users>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      // modify where to user itself field
      // .where('firstName', isNotEqualTo: funcThatMakesAsyncCall())
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Users.fromJson(doc.data())).toList());
}
