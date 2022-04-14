import 'package:firebase_auth/firebase_auth.dart';
import 'package:port_hub/utils/widgets/message_toast.dart';

import '../utils/styles/color_constants.dart';

class Auth {
  static Future<void> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      showToast(error.toString());
    }
  }

  static Future<void> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      uid = userCredential.user!.uid;
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        showErrorToast('No user found for that email');
      } else if (error.code == 'wrong-password') {
        showErrorToast('Username or password incorrect \nplease check details');
      }
    }
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  // attempt for the user profile image feature
  // Future<bool> downloadUserPhotoUrl(File img) async {
  //   try {
  //     FirebaseStorage storage = FirebaseStorage.instance;
  //     uid = FirebaseAuth.instance.currentUser?.uid;
  //     TaskSnapshot shot =
  //         await storage.ref("name of storage path/" + uid!).putFile(img);
  //     String urlImage = await shot.ref.getDownloadURL();
  //     // auth.currentUser.updatePhotoURL(url);
  //     // await users.doc(auth.currentUser.uid).update({"photo": url});
  //     showToast('Uploaded successfully');
  //     return true;
  //   } catch (e) {
  //     showErrorToast("Unable to upload");
  //     return false;
  //   }
  // }
}
