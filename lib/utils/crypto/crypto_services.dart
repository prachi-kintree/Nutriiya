import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as en;

class CryptoServices {
  static const appKeyBase64 = 'q0RaKiwQZOXMFvV/6thBVQjx7SpuOImfbD0VQiPb+gA='; // from Laravel (without "base64:")

  static String deterministicEncrypt(String plainText) {
    if(plainText == "") {
      return plainText;
    }
    // Decode base64 Laravel key (32 bytes)
    final keyBytes = base64.decode(appKeyBase64);
    final key = en.Key(Uint8List.fromList(keyBytes));

    // Derive IV: SHA-256 of key, take first 16 bytes
    final ivHash = sha256.convert(keyBytes).bytes;
    final iv = en.IV(Uint8List.fromList(ivHash.sublist(0, 16)));

    // Create AES encrypter
    final encrypter = en.Encrypter(en.AES(key, mode: en.AESMode.cbc, padding: 'PKCS7'));

    // Encrypt
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    print(encrypted.base64);
    return encrypted.base64;
  }

  static String deterministicDecrypt(String base64CipherText) {
    print(base64CipherText);
    if(base64CipherText == "") {
      return "";
    }
    final keyBytes = base64.decode(appKeyBase64);
    final key = en.Key(Uint8List.fromList(keyBytes));

    final ivHash = sha256.convert(keyBytes).bytes;
    final iv = en.IV(Uint8List.fromList(ivHash.sublist(0, 16)));

    final encrypter = en.Encrypter(en.AES(key, mode: en.AESMode.cbc, padding: 'PKCS7'));

    final decrypted = encrypter.decrypt64(base64CipherText, iv: iv);
    print(decrypted);
    return decrypted;
  }
}
