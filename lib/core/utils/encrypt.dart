import 'package:encrypt/encrypt.dart';

const secretKey = "Your16CharacterK";

//https://stackoverflow.com/questions/72886971/i-want-to-decrypt-and-enccrypt-the-data-in-flutter
String decrypt(String keyString, String encryptedData) {
  final key = Key.fromUtf8(keyString);
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  final initVector = IV.fromUtf8(keyString.substring(0, 16));
  return encrypter.decrypt64(encryptedData, iv: initVector);
}

Encrypted encrypt(String keyString, plainText) {
  plainText = plainText.toString();
  final key = Key.fromUtf8(keyString);
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  final initVector = IV.fromUtf8(keyString.substring(0, 16));
  Encrypted encryptedData = encrypter.encrypt(plainText, iv: initVector);
  return encryptedData;
}
