String setEncrypt (String str)
{
  final key = en.Key.fromUtf8('HEPIHEPI');
  final iv = en.IV.fromLength(16);
  final encrypter = en.Encrypter(en.AES(key));

  return encrypter.encrypt(str,iv : iv).base64;
}