// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tiktok_clone/authentication/authentication_controller.dart';
// import 'package:tiktok_clone/authentication/login_screen.dart';

// void main() async {
//   // Ensure Flutter is initialized.
//   WidgetsFlutterBinding.ensureInitialized();

//   // Initialize Firebase with configuration options.
//   try {
//     await Firebase.initializeApp(
//         options: FirebaseOptions(
//         apiKey: "AIzaSyCHeB1zr51xFhNvTNGnxU7oZJgitdI6Tas",
//         authDomain: "tiktok-clone-8081f.firebaseapp.com",
//         projectId: "tiktok-clone-8081f",
//         storageBucket: "tiktok-clone-8081f.appspot.com",
//         messagingSenderId: "852593864831",
//         appId: "1:852593864831:android:05ba132db33132f9a28f4a",
//       ),
//     );
//   } catch (e) {
//     print("Error initializing Firebase: $e");
//   }

//   // Initialize the AuthenticationController.
//   Get.put(AuthenticationController());

//   // Run the Flutter app.
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'TikTok Clone',
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: Colors.black,
//       ),
//       home: const LoginScreen(),
//     );
//   }
// }
