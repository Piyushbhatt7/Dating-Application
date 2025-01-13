import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/global.dart';
import 'package:dating_app/tabScreens/favorite_sent_favorite_received_screen.dart';
import 'package:dating_app/tabScreens/like_sent_like_received_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:dating_app/models/person.dart';

class ProfileController extends GetxController{

  final Rx<List<Person>> usersProfileList = Rx<List<Person>>([]);
  List<Person> get allUsersProfileList => usersProfileList.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit(); 

    usersProfileList.bindStream(
      FirebaseFirestore.instance
      .collection("users")
      .where("uid", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots()
      .map((QuerySnapshot queryDataSnapshot) 
      {
           List<Person> profilesList = [];

           for(var eachProfile in queryDataSnapshot.docs)
           {
            profilesList.add(Person.fromDataSnapshot(eachProfile));
            print('Profile fetched: ${eachProfile.data()}');
           }
           return profilesList;
      })
    );
  }

  FavoriteSentFavoriteReceivedScreen(String toUserID, String senderName)
  async {
     var document = await FirebaseFirestore
     .instance
     .collection("users")
     .doc(toUserID)
     .collection("favoriteReceived")
     .doc(currentUserID)
     .get();

// remove the favorite
     if(document.exists)
     {
     
     // removed currentID user from the favorite received list to that profile person
     await FirebaseFirestore
     .instance
     .collection("users")
     .doc(toUserID)
     .collection("favoriteReceived")
     .doc(currentUserID)
     .delete();

      // remove the profile person t userID to currentuserID
      
      await FirebaseFirestore
     .instance
     .collection("users")
     .doc(currentUserID)
     .collection("favoriteSent")
     .doc(toUserID)
     .delete();
     }

     else // mark as favorite in database
     {
            // add currentID user from the favorite received list to that profile person
     await FirebaseFirestore
     .instance
     .collection("users")
     .doc(toUserID)
     .collection("favoriteReceived")
     .doc(currentUserID)
     .set({});

      // add the profile person to userID to currentuserID
      
      await FirebaseFirestore
     .instance
     .collection("users")
     .doc(currentUserID)
     .collection("favoriteSent")
     .doc(toUserID)
     .set({});

     // send notification

     sendNotificationtToUser(toUserID, "Favorite", senderName);


     }
       update();
     }
  
  LikeSentLikeReceived(String toUserID, String senderName)
  async {
     var document = await FirebaseFirestore
     .instance
     .collection("users")
     .doc(toUserID)
     .collection("likeReceived")
     .doc(currentUserID)
     .get();

// remove the like from database
     if(document.exists)
     {
     
     // removed currentID user from the likeReceived  list to that profile person
     await FirebaseFirestore
     .instance
     .collection("users")
     .doc(toUserID)
     .collection("likeReceived")
     .doc(currentUserID)
     .delete();

      // remove the profile person of likeSent to userID to currentuserID
      
      await FirebaseFirestore
     .instance
     .collection("users")
     .doc(currentUserID)
     .collection("likeSent")
     .doc(toUserID)
     .delete();
     }

     else // mark as favorite in database
     {
            // add currentID user from the likeReceived list to that profile person
     await FirebaseFirestore
     .instance
     .collection("users")
     .doc(toUserID)
     .collection("likeReceived")
     .doc(currentUserID)
     .set({});

      // add the profile person to userID to currentuserID
      
      await FirebaseFirestore
     .instance
     .collection("users")
     .doc(currentUserID)
     .collection("likeSent")
     .doc(toUserID)
     .set({});

     // send notification

     sendNotificationtToUser(toUserID, "Like", senderName);

     }
       update();
     }
  

   viewsentviewReceived(String toUserID, String senderName)
  async {
     var document = await FirebaseFirestore
     .instance
     .collection("users")
     .doc(toUserID)
     .collection("viewReceived")
     .doc(currentUserID)
     .get();

// remove the like from database
     if(document.exists)
     {
     
         print("Already in View list");
     }

     else // mark as view in database
     {
            // add currentID user from the viewreceived list to that profile person
     await FirebaseFirestore
     .instance
     .collection("users")
     .doc(toUserID)
     .collection("viewReceived")
     .doc(currentUserID)
     .set({});

      // add the profile person to userID to currentuserID
      
      await FirebaseFirestore
     .instance
     .collection("users")
     .doc(currentUserID)
     .collection("viewSent")
     .doc(toUserID)
     .set({});

     // send notification
     sendNotificationtToUser(toUserID, "view", senderName);

     }
       update();
     }
  
  sendNotificationtToUser(receiverID, featureType, senderName) async
  {
       String userDeviceToken = "";

       await FirebaseFirestore.instance
       .collection("users")
       .doc(receiverID).get().then((snapshot)
       {
          if(snapshot.data()! ["userDeviceToken"] != null)
          {
             String deviceToken = snapshot.data()! ["userDeviceToken"].toString();
          }
       });

      //  notificationFormat(

      //   userDeviceToken,
      //   receiverID,
      //   featureType,
      //   senderName,

      //  );
  }
  
  notificationFormat(receiverID, featureType, senderName)
  {
     Map<String, String> headerNotification = 
     {
      "Content-Type": "application/json",
      "Authorization" : fmcServerToken
     };
  }
 
 
  }



