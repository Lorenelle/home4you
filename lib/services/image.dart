import 'package:firebase_storage/firebase_storage.dart';

class ImageStorage {
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  addProfileImage(imageFile) async {
    String path = "profile/${DateTime.now()}.png";
    if (imageFile != null) {
      try {
        var snap = await _firebaseStorage.ref(path).putFile(imageFile);
      } catch (e) {}
    }
  }
}
