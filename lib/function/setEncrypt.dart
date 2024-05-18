import 'package:encrypt/encrypt.dart' as en;
import 'package:flutter_dotenv/flutter_dotenv.dart';

String setEncrypt(String str)
{
  final key = en.Key.fromUtf8(dotenv.get("qrKey"));
  final iv = en.IV.fromLength(16);
  final encrypter = en.Encrypter(en.AES(key));

  return encrypter.encrypt(str,iv : iv).base64;
}