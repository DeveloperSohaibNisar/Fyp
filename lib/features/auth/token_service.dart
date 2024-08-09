import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt/encrypt.dart';

final tokenServiceProvider = Provider((ref) => TokenService());

class TokenService {
  final key = Key.fromUtf8('my32lengthsupersecretnooneknows1');
  final iv = IV.fromLength(16);
  late SharedPreferences pref;
  // Save the result locally using shared_preference

   Future<void> setToken(String resultString) async {
     final encrypter = Encrypter(AES(key));
    pref = await SharedPreferences.getInstance();
    final encrypted = encrypter.encrypt(resultString,iv: iv);
    print("token: "+ resultString+ " ==> encrypted: "+encrypted.base64.toString());
    pref.setString('authToken', encrypted.base64);
    //print ("pref token: "+pref!.get('authToken').toString());
  print('Result stored locally:'+ pref.get('authToken').toString());
}

Future<String?> getToken() async{
       try{
         final decrypter = Encrypter(AES(key));
         pref = await SharedPreferences.getInstance();
         final encrypted = pref.get('authToken') as String;
         final decrypt = Encrypted.fromBase64(encrypted);
         final decrypted = decrypter.decrypt(decrypt,iv:iv);
         print("t test: "+ decrypted);
         return decrypted;
       }
       catch(e){
         print ('error: $e');
         return "empty";
       }




}

}