import 'package:get_storage/get_storage.dart';

class Pref{
  late String _key;

  Pref.userId(): _key = "userId";

  get() => GetStorage().read(_key);
  set(String value) => GetStorage().write(_key, value);
  has() => GetStorage().hasData(_key);
  del() => GetStorage().remove(_key);

  
}