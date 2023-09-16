import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/authentication/login_screen.dart';
import 'package:tiktok_clone/authentication/registration_screen.dart';
import 'package:tiktok_clone/global.dart';
import 'user.dart' as userModel;

class AuthenticationController extends GetxController {
  static AuthenticationController get instanceAuth => Get.find();

  final Rx<File?> _pickedFile = Rx<File?>(null);
  File? get profileImage => _pickedFile.value;

  void chooseImageFromGallery() async {
    final pickedImageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImageFile != null) {
      Get.snackbar(
        "Profile Image",
        "You have successfully selected your profile image.",
      );
    }

    _pickedFile.value = File(pickedImageFile!.path);
  }

  void captureImagewithCamera() async {
    final pickedImageFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedImageFile != null) {
      Get.snackbar(
        "Profile Image",
        "You have successfully captured your profile image with the phone camera.",
      );
    }

    _pickedFile.value = File(pickedImageFile!.path);
  }

  void createAccountForNewUser(File imageFile, String userName, String userEmail,
      String userPassword) async {
    try {
      final UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      final String imageDownloadUrl = await uploadImageToStorage(imageFile);

      final userModel.User user = userModel.User(
        name: userName,
        email: userEmail,
        image: imageDownloadUrl,
        uid: credential.user!.uid,
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(credential.user!.uid)
          .set(user.toJson());

      Get.snackbar("Account Created Successfully", "Congratulations");
      showProgressBar = false;
      Get.to(const LoginScreen());
    } catch (error) {
      Get.snackbar("Account Creation Unsuccessful",
          "Error Occurred while creating an account. Try Again.");

      showProgressBar = false;
      Get.to(const LoginScreen());
    }
  }

  Future<String> uploadImageToStorage(File imageFile) async {
    final Reference reference = FirebaseStorage.instance
        .ref()
        .child("Profile Image")
        .child(FirebaseAuth.instance.currentUser!.uid);

    final UploadTask uploadTask = reference.putFile(imageFile);
    final TaskSnapshot taskSnapshot = await uploadTask;

    final String downloadUrlOfUploadedImage =
        await taskSnapshot.ref.getDownloadURL();

    return downloadUrlOfUploadedImage;
  }

  void loginUserNow(String userEmail, String userPassword) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
      Get.snackbar(
          "Logged-in Successful", "You're logged-in successfully");
      showProgressBar = false;
      Get.to(RegistrationScreen());
    } catch (error) {
      Get.snackbar("Login Unsuccessful",
          "Error occurred during sign-in authentication.");
      showProgressBar = false;
      Get.to(RegistrationScreen());
    }
  }
}
