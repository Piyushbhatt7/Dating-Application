import 'package:dating_app/controllers/authentication_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'authenticationScreen/login_screen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  
 await Firebase.initializeApp().then((value){

  Get.put(AuthenticationController());

 });


  Get.put(AuthenticationController());


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      title: 'Soul Mingle',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black
      ),
      debugShowCheckedModeBanner: false,
         home: LoginScreen(),
    );
  }
}