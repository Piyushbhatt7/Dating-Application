import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/accountSettingScreen/account_settings_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../global.dart';

class UserDetailsScreen extends StatefulWidget {

  String? userID;
  
   UserDetailsScreen({super.key, this.userID,});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {

  // personal info

  String name = '';
  String age = '';
  String phoneNo = '';
  String city = '';
  String country = '';
  String profileHeading = '';
  String lookingForInapartner = '';
  
  // appereance
  String height = '';
  String weight = '';
  String bodyType = '';

    // life style
  String drink = '';
  String smoke = '';
  String martialStatus = '';
  String haveChildren = '';
  String noOfChildren = '';
  String proffesion = '';         // 11
  String employmentStatus = '';
  String income = '';
  String livingSituation = '';
  String willingToRelocate = '';
  String relationshipYouAreLookingFor = '';

  // cultural values
  String nationality = '';
  String education = '';
  String languageSpoken = '';   // 5
  String religion = '';
  String ethnicity = '';

   String urlImage1 = "https://firebasestorage.googleapis.com/v0/b/soulmingle-5d95a.appspot.com/o/Place%20Holder%2Fperson.jpg?alt=media&token=0c8cb93e-c4a9-40b9-a1e7-13933405f20e";
   String urlImage2 = "https://firebasestorage.googleapis.com/v0/b/soulmingle-5d95a.appspot.com/o/Place%20Holder%2Fperson.jpg?alt=media&token=0c8cb93e-c4a9-40b9-a1e7-13933405f20e";
   String urlImage3 = "https://firebasestorage.googleapis.com/v0/b/soulmingle-5d95a.appspot.com/o/Place%20Holder%2Fperson.jpg?alt=media&token=0c8cb93e-c4a9-40b9-a1e7-13933405f20e";
   String urlImage4 = "https://firebasestorage.googleapis.com/v0/b/soulmingle-5d95a.appspot.com/o/Place%20Holder%2Fperson.jpg?alt=media&token=0c8cb93e-c4a9-40b9-a1e7-13933405f20e";
   String urlImage5 = "https://firebasestorage.googleapis.com/v0/b/soulmingle-5d95a.appspot.com/o/Place%20Holder%2Fperson.jpg?alt=media&token=0c8cb93e-c4a9-40b9-a1e7-13933405f20e";


retrieveUserInfo() async
{
  await FirebaseFirestore.instance
  .collection("users")
  .doc(widget.userID)
  .get()
  .then((snapshot)

  {
       if(snapshot.exists)
       {
           if(snapshot.data()!["urlImage1"] != null)
           {
                setState(() {
             urlImage1 = snapshot.data()!["urlImage1"];
             urlImage2 = snapshot.data()!["urlImage2"];
             urlImage3 = snapshot.data()!["urlImage3"];
             urlImage4 = snapshot.data()!["urlImage4"];
             urlImage5 = snapshot.data()!["urlImage5"];
            
            });
           }
                setState(() {

                  // personal info
                   name = snapshot.data()!["name"];
                   age = snapshot.data()!["age"].toString();
                   phoneNo = snapshot.data()!["phoneNo"];
                   city = snapshot.data()!["city"];
                   country = snapshot.data()!["country"];
                   profileHeading = snapshot.data()!["profileHeading"];
                   lookingForInapartner = snapshot.data()!["lookingForInaPartner"];
                   
                  //appereance
                   height = snapshot.data()!["height"];
                   weight = snapshot.data()!["weight"];
                   bodyType = snapshot.data()!["bodyType"];

                   // life style

                   drink = snapshot.data()!["drink"];
                   smoke = snapshot.data()!["smoke"];
                   martialStatus = snapshot.data()!["martialStatus"];
                   haveChildren = snapshot.data()!["haveChildren"];
                   noOfChildren = snapshot.data()!["noOfChildren"];
                   proffesion = snapshot.data()!["proffesion"];
                   employmentStatus = snapshot.data()!["name"];
                   income = snapshot.data()!["income"];
                   willingToRelocate = snapshot.data()!["willingToRelocate"];
                   relationshipYouAreLookingFor = snapshot.data()!["relationshipYouAreLookingFor"];

                   // background and cultural values

                   nationality = snapshot.data()!["nationality"];
                   education = snapshot.data()!["education"];
                   languageSpoken = snapshot.data()!["languageSpoken"];
                   religion = snapshot.data()!["religion"];
                   ethnicity = snapshot.data()!["ethnicity"];
          
                });

       }

  });

}

 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    retrieveUserInfo();
  }


  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    
  
    leading: Padding(
    padding: const EdgeInsets.only(left: 10.0), // Adjust the left padding
    child: SizedBox(
      height: 70, // Set the height of the image
      child: Image.asset('images/logolove.png'),
    ),
  ),
    title: Text(
      "User Profile",
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    centerTitle: true,
     automaticallyImplyLeading: widget.userID == currentUserID ? false : true ,
    
    // leading : widget.userID != currentUserID ? IconButton(
    //   onPressed: ()
    //   {
    //   Get.back();
    // }, 

    // icon: const Icon(
    //   Icons.arrow_back_ios_new_outlined,
    //   size: 30,
    // ),
    // ) : Container(),
    
    
    actions: [
      widget.userID == currentUserID ?
      Row(
        children: [

        IconButton(onPressed: ()
        {
           Get.to(AccountSettingsScreen());
        }, 
        
        icon: const Icon(
            Icons.settings,
            size: 30,
            ),
        
        ),


          
          IconButton(
            onPressed: ()
          {
              FirebaseAuth.instance.signOut();
          }, icon: const Icon(
            Icons.logout,
            size: 30,
            ),
            ),
        ],
      ): Container(),
    ],
  ),
     
      body: SingleChildScrollView(
        child:  Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
             children: [

              // image slider

              SizedBox(height: MediaQuery.of(context).size.height*0.5, 
              width: MediaQuery.of(context).size.width,

              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Carousel(
                  indicatorBarColor: Colors.black.withOpacity(0.3),
                  autoScrollDuration: const Duration(seconds: 2),
                  animationPageDuration: const Duration(milliseconds: 500),
                  activateIndicatorColor: Colors.black,
                  animationPageCurve: Curves.bounceIn,
                  indicatorBarHeight: 30,
                  indicatorHeight: 10,
                  indicatorWidth: 10,
                  unActivatedIndicatorColor: Colors.grey,
                  stopAtEnd: false,
                  autoScroll: true,
                  items: [
                    Image.network(urlImage1, fit: BoxFit.cover,),
                    Image.network(urlImage2, fit: BoxFit.cover,),
                    Image.network(urlImage3, fit: BoxFit.cover,),
                    Image.network(urlImage4, fit: BoxFit.cover,),
                    Image.network(urlImage5, fit: BoxFit.cover,), 
                  ],

                 ),
              
              ),
              
              ),

                 SizedBox(height: 15,),
        

                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     
                     Text(
                      name + ",  " + age ,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold
                      ),
                     ),


                  ],
                 )
               

             ],
           
          )
        )
      )
);
      
   
   
  
    }
}