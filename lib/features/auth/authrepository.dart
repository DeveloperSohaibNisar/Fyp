
import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_application/models/user_model.dart';

class AuthRepository{

  final FirebaseFirestore _fireStore;
  final FirebaseAuth _auth;

  AuthRepository(
  {
    required firebaseAuth,
    required fireStore,
  }) : _auth =  firebaseAuth, _fireStore = fireStore;

  var acs = ActionCodeSettings(
    // URL you want to redirect back to. The domain (www.example.com) for this
    // URL must be whitelisted in the Firebase Console.
      url: 'https://www.example.com/finishSignUp?cartId=1234',
      // This must be true
      handleCodeInApp: true,
      iOSBundleId: 'com.example.ios',
      androidPackageName: 'com.example.android',
      // installIfNotAvailable
      androidInstallApp: true,
      // minimumVersion
      androidMinimumVersion: '12');


  void SignUpWithEmail(int uid, String userName, DateTime creationDate, String password, bool isGuest, String email){

    _auth.sendSignInLinkToEmail(email: email, actionCodeSettings: acs);

    Users().UsersData.add(UsersList(uid: uid, userName: userName, creationDate: creationDate, password: password, isGuest: isGuest, email: email));

  }

   void Signin(String email, String password) async {

     try{

       final credential = await _auth.signInWithEmailAndPassword(email: email, password: password);

     } on FirebaseAuthException catch (e){

       if (e.code == 'user-not-found') {
         print('No user found for that email.');
       } else if (e.code == 'wrong-password') {
         print('Wrong password provided for that user.');
       }


     }

   }

}