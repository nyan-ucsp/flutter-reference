import 'package:encrypt/encrypt.dart' as encryptService;

class EncryptionService {
  static final key = encryptService.Key.fromUtf8(
      'arktoon@anandaark@encryption@nls'); //Key Need length 32
  static final iv = encryptService.IV.fromLength(16);
  static final encrypter = encryptService.Encrypter(
    encryptService.AES(key),
  );

  static String encrypt({required String text}) {
    return encrypter.encrypt(text, iv: iv).base64;
  }

  static String decrypt({required String text}) {
    return encrypter.decrypt(encryptService.Encrypted.fromBase64(text), iv: iv);
  }
}
