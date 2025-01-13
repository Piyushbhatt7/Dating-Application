import 'dart:io';
import 'package:dating_app/controllers/authentication_controller.dart';
import 'package:dating_app/widgets/custom_text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}




class _RegistrationScreenState extends State<RegistrationScreen> {

//personal info 
  TextEditingController nameTextEditingController = TextEditingController(); 
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController ageTextEditingController = TextEditingController();
  TextEditingController phoneNoTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
  TextEditingController profileHeadingTextEditingController = TextEditingController();
  TextEditingController lookingForInaPartnerTextEditingController = TextEditingController();
  

  // Appreance

  TextEditingController heightTextEditingController = TextEditingController();
  TextEditingController weightTextEditingController = TextEditingController();
  TextEditingController bodyTypeTextEditingController = TextEditingController();


  
  // Life style
  
  TextEditingController drinkTextEditingController = TextEditingController();
  TextEditingController smokeTextEditingController = TextEditingController();
  TextEditingController martialstatusTextEditingController = TextEditingController();
  TextEditingController haveChildrenTextEditingController = TextEditingController();
  TextEditingController noOfChildrenTextEditingController = TextEditingController();
  TextEditingController professionTextEditingController = TextEditingController();
  TextEditingController employmentStatusTextEditingController = TextEditingController();
  TextEditingController incomeTextEditingController = TextEditingController();
  TextEditingController livingSituationTextEditingController = TextEditingController();
  TextEditingController willingToRelocateTextEditingController = TextEditingController();
  TextEditingController relationshipYouAreLookingForTextEditingController = TextEditingController();

  // Background - cultural values
  
  TextEditingController nationalityTextEditingController = TextEditingController();
  TextEditingController educationTextEditingController = TextEditingController();
  TextEditingController languageTextEditingController = TextEditingController();
  TextEditingController religionTextEditingController = TextEditingController();
  TextEditingController ethnicityTextEditingController = TextEditingController();
  
  bool showProgressBar = false;
     // String? imageProfile;

  var authenticationController = AuthenticationController.authController;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

          const SizedBox(
            height: 100,
          ),


        const  Text(
            "Create Account",
            style: TextStyle(
              fontSize: 22,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),


          const SizedBox(height: 8,),

          const  Text(
            "to get Started Now",
            style: TextStyle(
              fontSize: 22,
              color: Colors.grey,
              // fontWeight: FontWeight.bold,
            ),
          ),

           const SizedBox(height: 15,),

           authenticationController.imageFile == null ?

           const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("images/profile_avatar.png"),
              backgroundColor: Colors.black,
              
            ) : Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
                image: DecorationImage(fit: BoxFit.fitHeight,
                image: FileImage(
                  File(
                    authenticationController.imageFile!.path,
                  ),
                ),
                
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async
                  {
                    await authenticationController.pickImageFileFromGallery();
                    
                    setState(() {
                      authenticationController.imageFile;
                    });

                  },

                  icon: Icon(
                    Icons.image_outlined,
                    color: Colors.grey,
                    size: 30,
                    
                    ),
                  
                  ),

                
                const SizedBox(
                  width: 10, 
                ),

                  IconButton(
                  onPressed: () async
                  {
                    await authenticationController.captureImageFromPhoneCamera();
                    
                    setState(() {
                      authenticationController.imageFile;
                    });
                  },

                  icon: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.grey,
                    size: 30,
                    
                    ),
                  
                  )
              ],
            ),
           

           const SizedBox(height: 30,),

          // name
          // personal info 

        const  Text(
            "Personal Info:",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),

           const SizedBox(height: 12,),

          // Name

          SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: nameTextEditingController,
              labelText: "Name",
              iconData: Icons.person_outline,
              isObscure: false,
            ),
          ),
        
      
         const SizedBox(
              height: 18,
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

           const SizedBox(
              height: 18,
            ),

            
            // age
            
            SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: ageTextEditingController,
              labelText: "Age",
              iconData: Icons.numbers,
              isObscure: false,
            ),
          ),

          
            const SizedBox(
              height: 18,
            ),


            // phoneNo
 
            SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: phoneNoTextEditingController,
              labelText: "PhoneNo",
              iconData: Icons.phone_outlined,
              isObscure: false,
            ),
          ),

            const SizedBox(
              height: 18,
            ),

            // city

          SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: cityTextEditingController,
              labelText: "City",
              iconData: Icons.location_city_outlined,
              isObscure: false,
            ),
          ),


            const SizedBox(
              height: 18,
            ),

            // country

          SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: countryTextEditingController,
              labelText: "Country",
              iconData: Icons.location_city_sharp,
              isObscure: false,
            ),
          ),

            const SizedBox(
              height: 18,
            ),

            // profileHeading

          SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: profileHeadingTextEditingController,
              labelText: "Profile Heading",
              iconData: Icons.text_fields_outlined,
              isObscure: false,
            ),
          ),

            const SizedBox(
              height: 18,
            ),

            // lookingforpartner

          SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: lookingForInaPartnerTextEditingController,
              labelText: "What you're looking for in a partner",
              iconData: Icons.face_outlined,
              isObscure: false,
            ),
          ), 


            const SizedBox(
              height: 24,
            ),


         
         
         
         
            // Appereance
        const  Text(
            "Appereance:",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),

           const SizedBox(height: 12,),

          // height

          SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: heightTextEditingController,
              labelText: "Height",
              iconData: Icons.insert_chart_outlined,
              isObscure: false,
            ),
          ),
        
         
            const SizedBox(
              height: 18,
            ),

          // weight
     
            SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: weightTextEditingController,
              labelText: "Weight",
              iconData: Icons.table_chart_outlined,
              isObscure: false,
            ),
          ),
        
         
            const SizedBox(
              height: 18,
            ),
          

          // body Type
            
            SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: bodyTypeTextEditingController,
              labelText: "Body Type",
              iconData: Icons.type_specimen_outlined,
              isObscure: false,
            ),
          ),
        
         
            const SizedBox(
              height: 18,
            ),

            
            
                // Life style


        const  Text(
            "Life Style:",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),

           const SizedBox(height: 12,),

          // drink

          SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: drinkTextEditingController,
              labelText: "Drink",
              iconData: Icons.local_drink_outlined,
              isObscure: false,
            ),
          ),
        
         
            const SizedBox(
              height: 18,
            ),

          // Smoke
     
            SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: smokeTextEditingController,
              labelText: "Smoke",
              iconData: Icons.smoking_rooms_outlined,
              isObscure: false,
            ),
          ),
        
         
            const SizedBox(
              height: 18,
            ),
          

          // martial status
            
            SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: martialstatusTextEditingController,
              labelText: "Material Status",
              iconData: CupertinoIcons.person_2_alt,
              isObscure: false,
            ),
          ),
        
         
            const SizedBox(
              height: 18,
            ),
            
            
           // have children
            SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: haveChildrenTextEditingController,
              labelText: "Do you have Children?",
              iconData: CupertinoIcons.person_3_fill,
              isObscure: false,
            ),
          ),
        
         
            const SizedBox(
              height: 18,
            ),


            // no of children if any 
            SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: noOfChildrenTextEditingController,
              labelText: "Number of Children",
              iconData: Icons.child_care_outlined,
              isObscure: false,
            ),
          ),
        
         
            const SizedBox(
              height: 18,
            ),


            // Proffesion
            SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: professionTextEditingController,
              labelText: "Proffesion",
              iconData: Icons.business_center_rounded,
              isObscure: false,
            ),
          ),
        
         
            const SizedBox(
              height: 18,
            ),


            //employment
            SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: employmentStatusTextEditingController,
              labelText: "Employment Status",
              iconData:   CupertinoIcons.rectangle_stack_person_crop_fill,
              isObscure: false,
            ),
          ),
        
         
            const SizedBox(
              height: 18,
            ),


            // income
            SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: incomeTextEditingController,
              labelText: "Income",
              iconData: CupertinoIcons.money_dollar,
              isObscure: false,
            ),
          ),
        
         
            const SizedBox(
              height: 18,
            ),


           // living situatiuon
            SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: livingSituationTextEditingController,
              labelText: "Living Situation",
              iconData: CupertinoIcons.home,
              isObscure: false,
            ),
          ),
        
         
            const SizedBox(
              height: 18,
            ),


            // willing to relocate
            SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: willingToRelocateTextEditingController,
              labelText: "Are you Willing to Relocate",
              iconData: Icons.person_2,
              isObscure: false,
            ),
          ),
        
         
            const SizedBox(
              height: 18,
            ),


            // relationship
            SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: relationshipYouAreLookingForTextEditingController,
              labelText: "What relationship you are looking for?",
              iconData: Icons.person_2_outlined,
              isObscure: false,
            ),
          ),
        
         
            const SizedBox(
              height: 18,
            ),






                      
        // background - cultural values


        const  Text(
            "Background - Cultural Values:",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),

           const SizedBox(height: 12,),

          // nationality

          SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: nationalityTextEditingController,
              labelText: "Nationality",
              iconData: Icons.flag_circle_outlined,
              isObscure: false,
            ),
          ),
        
         
            const SizedBox(
              height: 18,
            ),

          // education
     
            SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: educationTextEditingController,
              labelText: "Education",
              iconData: Icons.history_edu_outlined,
              isObscure: false,
            ),
          ),
        
         
            const SizedBox(
              height: 18,
            ),
          

          // language spoken
            
            SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: languageTextEditingController,
              labelText: "Language Spoken",
              iconData: CupertinoIcons.person_badge_plus_fill,
              isObscure: false,
            ),
          ),
        
         
            const SizedBox(
              height: 18,
            ),
            
            
           // religion
            SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: religionTextEditingController,
              labelText: "Religion",
              iconData: CupertinoIcons.checkmark_seal_fill,
              isObscure: false,
            ),
          ),
        
         
            const SizedBox(
              height: 18,
            ),


            // Ethnicity  
            SizedBox(
            width: MediaQuery.of(context).size.width - 36,
            height: 55,
            child: CustomTextFieldWidget(
              editingController: ethnicityTextEditingController,
              labelText: "Ethnicity",
              iconData: CupertinoIcons.eye,
              isObscure: false,
            ),
          ),
        
         
            const SizedBox(
              height: 30,
            ),



            // create account button 

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
  onTap: () async 
  {
    if (authenticationController.profileImage != null) {
      // Check if all fields are empty
      if (
        // Personal info
        emailTextEditingController.text.trim().isNotEmpty &&
        passwordTextEditingController.text.trim().isNotEmpty &&
        nameTextEditingController.text.trim().isNotEmpty &&
        ageTextEditingController.text.trim().isNotEmpty &&
        phoneNoTextEditingController.text.trim().isNotEmpty &&              /// 9
        cityTextEditingController.text.trim().isNotEmpty &&
        countryTextEditingController.text.trim().isNotEmpty &&
        profileHeadingTextEditingController.text.trim().isNotEmpty &&
        lookingForInaPartnerTextEditingController.text.trim().isNotEmpty &&

        // Appearance
        heightTextEditingController.text.trim().isNotEmpty &&
        weightTextEditingController.text.trim().isNotEmpty &&             // 3
        bodyTypeTextEditingController.text.trim().isNotEmpty &&

        // Lifestyle
        drinkTextEditingController.text.trim().isNotEmpty &&
        smokeTextEditingController.text.trim().isNotEmpty &&
        martialstatusTextEditingController.text.trim().isNotEmpty &&  // Corrected typo
        haveChildrenTextEditingController.text.trim().isNotEmpty &&
        noOfChildrenTextEditingController.text.trim().isNotEmpty &&
        professionTextEditingController.text.trim().isNotEmpty &&                    // 11
        employmentStatusTextEditingController.text.trim().isNotEmpty &&
        incomeTextEditingController.text.trim().isNotEmpty &&
        livingSituationTextEditingController.text.trim().isNotEmpty &&
        willingToRelocateTextEditingController.text.trim().isNotEmpty &&
        relationshipYouAreLookingForTextEditingController.text.trim().isNotEmpty &&

        // Cultural values
        nationalityTextEditingController.text.trim().isNotEmpty &&
        educationTextEditingController.text.trim().isNotEmpty &&
        languageTextEditingController.text.trim().isNotEmpty &&             // 5 
        religionTextEditingController.text.trim().isNotEmpty &&
        ethnicityTextEditingController.text.trim().isNotEmpty ) 
      {
        // Call the createNewUserAccount method
        setState(() {
          showProgressBar = true;
        });
        

        await authenticationController.createNewUserAccount(
          // Personal info
          authenticationController.profileImage!,
          emailTextEditingController.text.trim(),
          passwordTextEditingController.text.trim(),
          nameTextEditingController.text.trim(),    
          ageTextEditingController.text.trim(),
          phoneNoTextEditingController.text.trim(),
          cityTextEditingController.text.trim(),
          countryTextEditingController.text.trim(),
          profileHeadingTextEditingController.text.trim(),
          lookingForInaPartnerTextEditingController.text.trim(),

          // Appearance
          heightTextEditingController.text.trim(),
          weightTextEditingController.text.trim(),
          bodyTypeTextEditingController.text.trim(),

          // Lifestyle
          drinkTextEditingController.text.trim(),
          smokeTextEditingController.text.trim(),
          martialstatusTextEditingController.text.trim(),  
          haveChildrenTextEditingController.text.trim(),
          noOfChildrenTextEditingController.text.trim(),
          professionTextEditingController.text.trim(),
          employmentStatusTextEditingController.text.trim(),
          incomeTextEditingController.text.trim(),
          livingSituationTextEditingController.text.trim(),
          willingToRelocateTextEditingController.text.trim(),
          relationshipYouAreLookingForTextEditingController.text.trim(),

          // Cultural values
          nationalityTextEditingController.text.trim(),
          educationTextEditingController.text.trim(),
          languageTextEditingController.text.trim(),
          religionTextEditingController.text.trim(),
          ethnicityTextEditingController.text.trim(),
          "defult value",
        );

      

        setState(() {
          showProgressBar = false;
          authenticationController.imageFile == null;

        });


       } 
       else {
        Get.snackbar("Field is Empty", "Please fill out all fields in text field.");
      }
    } 
    else {
      Get.snackbar("Image File Missing", "Please pick an image from Gallery or capture with Camera.");
    }         
             
  },

              child: const Center(
                child: Text(
                  "Create Acoount",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
    ),
             

          ),

             const SizedBox(
              height: 16,
            ),

            // already have an account login here
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Text(
                  "Already have an account? ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey

                  ),
                ),

                InkWell(
                  onTap: () {
                    Get.back();
                  },

                  child: const Text(
                    "Login Account",
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
        )
        
      ),
    );
  }
}