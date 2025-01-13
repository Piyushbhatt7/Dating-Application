import 'package:dating_app/authenticationScreen/registration_screen.dart';
import 'package:dating_app/controllers/authentication_controller.dart';
import 'package:dating_app/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 
 TextEditingController emailTextEditingController = TextEditingController();
 TextEditingController passwordTextEditingController = TextEditingController();
 bool showProgressBar = false;
 var controllerAuth = AuthenticationController.authController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

            const SizedBox(
              height: 80,
            ),

            Image.asset(
              "images/logolove.png",
              width: 250,
          ),


         const Text(
            "Welcome",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          
            const SizedBox(
              height: 10,
            ),


            const Text(
            "Login now to find your best Match",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

            const SizedBox(
              height: 28,
            ),

 //email

          SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: emailTextEditingController,
              labelText: "Email",
              iconData: Icons.email_outlined,
              isObscure: false,
            ),
          ),

           const SizedBox(
              height: 18,
            ),


  // password
          
          SizedBox(
             width: MediaQuery.of(context).size.width - 36,
             height: 55,
            child: CustomTextFieldWidget(
              editingController: passwordTextEditingController,
              labelText: "Password",
              iconData: Icons.lock_outline,
              isObscure: true,
            ),
          ),


          // login button

          const SizedBox(
              height: 30,
            ),

          Container(
             width: MediaQuery.of(context).size.width - 36,
             height: 50,
             decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
             ),

             child: InkWell(
              onTap:() async{
                if(
                  emailTextEditingController.text.trim().isNotEmpty && 
                  passwordTextEditingController.text.trim().isNotEmpty )
                  {
                     
                     setState(() {
                       showProgressBar = true;
                     });
                     
                     
                     await controllerAuth.loginUser( 
                     emailTextEditingController.text.trim(), 
                     passwordTextEditingController.text.trim()
                     );

                      setState(() {
                       showProgressBar = false;
                     });
                  }      
                  else
                  {
                    Get.snackbar("Email/Password is Missing", "Please fil all fields. ");
                  }                               
              },

              child: const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
             ),

          ),

             const SizedBox(
              height: 16,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey

                  ),
                ),

                InkWell(
                  onTap: () {
                    Get.to(RegistrationScreen());
                  },

                  child: const Text(
                    "Create Here",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),


           const SizedBox(
              height: 16,
            ),

            showProgressBar == true 
            ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
            ) 
            : Container(),


             const SizedBox(
              height: 30,
            ),










            ],
          ),
        ),
      ),
    );
  }
}