import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/global.dart';
import 'package:dating_app/homeScreen/home_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/custom_text_field_widget.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
 
 bool uploading = false , next = false;
 final List<File> _image = [];
 List<String> urlsList = [];
 double val = 0;

 //personal info 
  TextEditingController nameTextEditingController = TextEditingController(); 
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

 String name = "";
 String age = "";
 String phoneNo = "";
 String city = "";
 String country = "";
 String profileHeading = "";
 String lookingForInaPartner = "";

 // appereance

 String height = "";
 String weight = "";
 String bodyType = "";

 // life style

 String drink = "";
 String smoke = "";
 String martialStatus = "";
 String haveChildren = "";
 String noOfChildren = "";
 String proffesion = "";
 String employmentStatus = "";
 String income = "";
 String livingSituation = "";
 String willingToRelocate = "";
 String relationshipYouAreLookingFor = "";

//  background and cultural values

String nationality = "";
String education = "";
String languageSpoken = "";
String religion = "";
String ethnicity = "";


 chooseImage() async
 {
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      
      _image.add(File(pickedFile!.path));
    }); 
 }

 uploadImage() async
 {
  int i = 1;
  for(var img in _image)
  {
    setState(() {
      val = i / _image.length;
    });

    var refImages = FirebaseStorage.instance.ref()
    .child("images/${DateTime.now().microsecondsSinceEpoch.toString()}.jpg");

    await refImages.putFile(img).whenComplete(() async
    {
      await refImages.getDownloadURL().then((urlImage) {

          urlsList.add(urlImage);
          i++;
      });
   });
  }
 }

 retrieveUserData() async
{
  await FirebaseFirestore
  .instance
  .collection("users")
  .doc(currentUserID)
  .get()
  .then((snapShot)
  {
     if(snapShot.exists)
     {
       setState(() {
         
         // personal info

         name = snapShot.data()!['name'];
         nameTextEditingController.text = name;
         age = snapShot.data()!['age'].toString();
         ageTextEditingController.text = age;
         phoneNo = snapShot.data()!['phoneNo'];
         phoneNoTextEditingController.text = phoneNo;
         city = snapShot.data()!['city'];
         cityTextEditingController.text = city;
         country = snapShot.data()!['country'];
         countryTextEditingController.text = country;
         profileHeading = snapShot.data()!['profileHeading'];
         professionTextEditingController.text = profileHeading;
         lookingForInaPartner = snapShot.data()!['lookingForInaPartner'];
         lookingForInaPartnerTextEditingController.text = lookingForInaPartner;

         // apperance
         height = snapShot.data()!['height'];
         heightTextEditingController.text = height;
         weight = snapShot.data()!['weight'];
         weightTextEditingController.text = weight;
         bodyType = snapShot.data()!['bodyType'];
         bodyTypeTextEditingController.text = bodyType;

         // life style
         drink = snapShot.data()!['drink'];
         drinkTextEditingController.text = drink;
         smoke = snapShot.data()!['smoke']; 
         smokeTextEditingController.text = smoke;
         martialStatus = snapShot.data()!['martialStatus'];
         martialstatusTextEditingController.text = martialStatus;
         haveChildren = snapShot.data()!['haveChildren'];
         haveChildrenTextEditingController.text = haveChildren;
         noOfChildren = snapShot.data()!['noOfChildren'];
         noOfChildrenTextEditingController.text = noOfChildren;
         proffesion = snapShot.data()!['proffesion'];
         professionTextEditingController.text = proffesion;
         employmentStatus = snapShot.data()!['employmentStatus'];
         employmentStatusTextEditingController.text = employmentStatus;
         income = snapShot.data()!['income'];
         incomeTextEditingController.text = income;
         livingSituation = snapShot.data()!['livingSituation'];
         livingSituationTextEditingController.text = livingSituation;
         willingToRelocate = snapShot.data()!['willingToRelocate'];
         willingToRelocateTextEditingController.text = willingToRelocate;
         relationshipYouAreLookingFor = snapShot.data()!['relationshipYouAreLookingFor'];
         relationshipYouAreLookingForTextEditingController.text = relationshipYouAreLookingFor;

         // background cultural values
         nationality = snapShot.data()!['nationality'];
         nationalityTextEditingController.text = nationality;
         education = snapShot.data()!['education'];
         educationTextEditingController.text = education;
         languageSpoken = snapShot.data()!['languageSpoken'];
         languageTextEditingController.text = languageSpoken;
         religion = snapShot.data()!['religion'];
         religionTextEditingController.text = religion;
         ethnicity = snapShot.data()!['ethnicity'];
         ethnicityTextEditingController.text = ethnicity;

       });

     }
  });
}
   
 
updateUserDataToFirestoreDatabase(

   // personal info
  String name,
  String age,              // 9
  String phoneNo,
  String city,
  String country,
  String profileHeading,
  String lookingForInaPartner,
  String publishedDateTime,

  // appereance
  String height,           // 3
  String weight,
  String bodyType,

  
  // life style
  String drink,
  String smoke,
  String martialStatus,
  String haveChildren,
  String noOfChildren,
  String proffesion,           // 11
  String employmentStatus,
  String income,
  String livingSituation,
  String willingToRelocate,
  String relationshipYouAreLookingFor,

  // cultural values
  String nationality,
  String education,
  String languageSpoken,    // 5
  String religion,
  String ethnicity,
) async
{

        showDialog(
              context: context, 
              builder: (context)
              {
              return const AlertDialog(
                content: SizedBox(
                  height: 200,
                  child: const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10,),
                        Text(
                          "uploading images..."
                        )
                      ],
                    ),
                    
                    ),
                ),
              );
             }
          );
             
          await  uploadImage();

          await FirebaseFirestore.instance.collection("users").doc(currentUserID).update(
           {

             // personal info
             'name': name,
             'age': int.parse(age),
             'phoneNo': phoneNo,
             'city': city,
             'country': country,
             'profileHeading' : profileHeading,
             'lookingForInaPartner': profileHeading,

             // apperance

             'height': height,
             'weight': weight,
             'bodyType': bodyType,

             // life style

             'drink': drink,
             'smoke': smoke,
             'martialStatus': martialStatus,
             'haveChildren': haveChildren,
             'noOfChildren': noOfChildren,
             'proffesion': proffesion,
             'employmentStatus': employmentStatus,
             'income': income,
             'livingSituation': livingSituation,
             'willingToRelocate': willingToRelocate,
             'relationshipYouAreLookingFor': relationshipYouAreLookingFor,

             // backgroung and cutural values

             'nationality': nationality,
             'education': education,
             'languageSpoken': languageSpoken,
             'religion': religion,
             'ethnicity': ethnicity,

             // images

             'urlImage1': urlsList[0].toString(),
             'urlImage2': urlsList[1].toString(),
             'urlImage3': urlsList[2].toString(),
             'urlImage4': urlsList[3].toString(),
             'urlImage5': urlsList[4].toString(),
             

           });
         
         Get.snackbar("Updated", "your account has been updated successful. ");

         Get.to(HomeScreen());

         setState(() {
           uploading = false;
           urlsList.clear();
           _image.clear();

         });

}


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    retrieveUserData();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          next ? "Profile Information" : "choose 5 Images",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
          
        ),
        
        actions: [
          next
          ? Container()
          : IconButton(
            onPressed: ()
          {
             if(_image.length == 5)
             {
               setState(() {
                 uploading = true;
                 next = true;
               });
             }
             else
             {
               Get.snackbar("5 Images", "Please choose 5 images");
             }
          }, 
          icon: Icon(Icons.navigate_next_outlined, size: 36,)
          ),
        ],
      
      ),
      
      body: next 
      ? SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              
              const SizedBox(height: 2,),
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


            // relationship you are looking for
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
      if (
        // Personal info
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
        
       _image.length > 0 ? 
        await updateUserDataToFirestoreDatabase(
          // Personal info
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
          
          
        ) : null ;

       } 
       else {
        Get.snackbar("Field is Empty", "Please fill out all fields in text field.");
      }   
             
  },

              child: const Center(
                child: Text(
                  "Update",
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






            ],
          ),
          
          ),
      ) 
      : Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            child: GridView.builder(
              itemCount: _image.length + 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,

              
              ),

              itemBuilder: (context, index) {
                return index == 0
                 ? Container(
                  color: Colors.white30,
                  child: IconButton(
                    onPressed: ()
                    {
                      if(_image.length < 5)
                      {
                         !uploading ? chooseImage() : null;
                      }
                      else
                      {
                        setState(() {
                          uploading == true;
                        });

                        Get.snackbar("5 Images choosen", "5 Images Already Selected ");
                      }
                       
                    }, 
                    icon: const Icon(Icons.add)),
                 ) 
                
                
                 : Container(
                  margin: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    image: DecorationImage(image:  FileImage(
                      _image[index - 1],
                      
                    ),

                    fit: BoxFit.cover,
                 )
                  ),
                 );
              },
            ),
          )
        ],
      ),
   
   
    );
  }
}