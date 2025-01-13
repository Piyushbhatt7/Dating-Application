import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/global.dart';
import 'package:dating_app/tabScreens/user_details_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PushNotificationSystem {

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // notifactuion arrived / re3ceived

  Future whenNotificationReceived(BuildContext context) async
{
  //1. terminated
  // when the app is completely closed and opened directly from the push notofication

  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? remoteMessage)
  {
     if(remoteMessage != null)
   {
      // open app and show notofication data
      openAppAndShowNotificatioData(
        remoteMessage.data["userID"],
        remoteMessage.data["senderID"],
        context,
      );
   }   
  });

  // 2. Foreground
  // when the app is open and it received a push notificaton

  FirebaseMessaging.onMessage.listen((RemoteMessage? remoteMessage)
  {
    
    if(remoteMessage != null)
   {
      // open app and show notofication data
      openAppAndShowNotificatioData(
        remoteMessage.data["userID"],
        remoteMessage.data["senderID"],
        context,
      );
   } 
  });

   // 3. background
   // when the app is in the background and opened directly from the push notification.

   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? remoteMessage)
   {
    
    if(remoteMessage != null)
   {
      // open app and show notofication data
      openAppAndShowNotificatioData(
        remoteMessage.data["userID"],
        remoteMessage.data["senderID"],
        context,
      );
   }
   });

  }
    openAppAndShowNotificatioData(receiverID, senderID, contex) async
    {
       await FirebaseFirestore
       .instance
       .collection("users")
       .doc(senderID)
       .get()
       .then((snapshot)
       {
         String profileImage = snapshot.data()!["imageProfile"].toString();
         String name = snapshot.data()! ["name"].toString();
         String age = snapshot.data()! ["age"].toString();
         String city = snapshot.data()! ["city"].toString();
         String country = snapshot.data()! ["country"].toString();
         String proffesion = snapshot.data()! ["proffesion"].toString();
        
        showDialog(
          context: contex,
          builder: (contex)
          {
            return notificationDialogBox(
              
              senderID,
              profileImage,
              name,
              age,
              city,
              country,
              proffesion,
              contex,
            );
          }
        );

         
        
       });
    }

    notificationDialogBox(senderID, profileImage, name, age, city, country, proffesion, context)
    {
            return Dialog(
              child: GridTile(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SizedBox(
                    height: 300,
                    child: Card(
                      color: Colors.blue.shade200,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(profileImage),
                            fit: BoxFit.cover                    
                            )
                        ),
                        
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name + "• " +  age.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(
                                  height: 8.0,
                                ),

                                //2. buttons 

                                Row(
                                  children: [

                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.white,
                                      size: 16,
                                    ),

                                    const SizedBox(
                                      width: 2.0,
                                    ),
                                      
                                      Expanded(
                                        child: Text(
                                          city + ", " + country.toString(),
                                          maxLines: 4,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        )
                                      ),
                                  ],
                                ),
                             
                             
                              const Spacer(),

                             Row(
                              children: [
                                Center(
                                   child: ElevatedButton(
                                    onPressed: ()
                                    {
                                       Get.back();

                                       Get.to(UserDetailsScreen(userID: senderID,));
                                    }, 
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                    ),
                                    child: const Text(
                                      "View Profile "
                                    ),
                                    ),
                                ),
                              
                                  Center(
                                   child: ElevatedButton(
                                    onPressed: ()
                                    {
                                       Navigator.pop(context);
                                    }, 
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.redAccent,
                                    ),
                                    child: const Text(
                                      "Close"
                                    ),
                                    ),
                                )
                              
                              ],
                             )
                             
                              ],
                            ),
                          ),
                          
                          ),
                      
                      ),
                      
                      
                  
                    ),
                  ),
                  ),
                  ),
            );
    }

   
    Future generateDeviceRegistrationToken() async
    {
      String? deviceToken = await messaging.getToken();

      await FirebaseFirestore
      .instance 
      .collection("users")
      .doc(currentUserID)
      .update(
        {
            "userDeviceToken": deviceToken,
      });
    }



}