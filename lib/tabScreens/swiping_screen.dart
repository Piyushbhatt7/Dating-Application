import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/controllers/profile-controller.dart';
import 'package:dating_app/global.dart';
import 'package:dating_app/tabScreens/user_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwippingScreen extends StatefulWidget {
  const SwippingScreen({super.key});

  @override
  State<SwippingScreen> createState() => _SwippingScreenState();
}

class _SwippingScreenState extends State<SwippingScreen> {


  ProfileController profileController = Get.put(ProfileController());
  String senderName = "";

  readCurrentUserData() async
  {
    await FirebaseFirestore.instance.collection("users").doc(currentUserID).get().then((dataSnapshot)
    
    {
      setState(() {
        senderName = dataSnapshot.data()!["name"].toString();
      });
    });
  }

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    readCurrentUserData();
  }

  @override
  Widget build(BuildContext context) {
      return  Scaffold(
        body: Obx((){

        return PageView.builder(
        itemCount: profileController.allUsersProfileList.length,
        controller: PageController(
          initialPage: 0,
          viewportFraction: 1,
        ),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final eachProfileInfo = profileController.allUsersProfileList[index];

          return DecoratedBox(
            decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                eachProfileInfo.imageProfile.toString()
                ),

                fit: BoxFit.cover
                ),
          ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [

                
                 // filter icon button
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),

                      child: IconButton(
                        onPressed: ()
                      {
                        
                      },
                      
                      icon: const Icon(Icons.filter_list, size: 30,),
                      
                      ),
                      
                      
                      ),
                  ),
                 
                 const Spacer(),
                 
                 GestureDetector(

                  onTap: () {
                     // send user to [profile person] user deatail screen
                     profileController.viewsentviewReceived(
                      eachProfileInfo.uid.toString(), senderName,
                      );
                      // send user to person datail screen
                      Get.to(UserDetailsScreen(userID: eachProfileInfo.uid.toString(),
                      ));
                  },
                  child: Column(
                    children: [

                      // name
                      Text(
                        eachProfileInfo.name.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                        ),
                      ),


                      // age
                      Text(
                        eachProfileInfo.age.toString() + " ⦿" + eachProfileInfo.city.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          //fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                        ),
                      ),

                      const SizedBox(
                        height: 4,
                      ),

                     // proffesion and religion
                     
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white30,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)
                              )
                            ),

                            child: Text(
                              eachProfileInfo.proffesion.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),

                          SizedBox(width: 7,),

                          // religion

                           ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white30,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)
                              )
                            ),

                            child: Text(
                              eachProfileInfo.religion.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),

                        // country and ethnicity
                        
                        Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white30,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)
                              )
                            ),

                            child: Text(
                              eachProfileInfo.country.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),

                          SizedBox(width: 7,),

                          // religion

                           ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white30,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)
                              )
                            ),

                            child: Text(
                              eachProfileInfo.ethnicity.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
   
                    ],
                  ),

                 ),
                
                
                // image buttons

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                             
                    // favorite button
                    GestureDetector(
                      onTap: () {
                        profileController.FavoriteSentFavoriteReceivedScreen(
                          eachProfileInfo.uid.toString(),
                          senderName ,
                          );
                      },
                      child: Image.asset(
                        "images/star.png",
                        width: 55,
                      ),
                    ),
                 
                 
                      GestureDetector(
                      onTap: () {
                        
                      },
                      child: Image.asset(
                        "images/chat.png",
                        width: 68,
                      ),
                    ),

                    
                     GestureDetector(
                      onTap: () {
                        profileController.LikeSentLikeReceived(
                          eachProfileInfo.uid.toString(),
                          senderName ,
                          );
                      },
                      child: Image.asset(
                        "images/like.png",
                        width: 70,
                      ),
                    ),
                  ],
                )



                ],
              ),
              
              ),
          
           );
        },
        
      );     
        }
        ),
     );  
    }
}