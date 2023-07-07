import 'package:get_storage/get_storage.dart';

class StorageService {
  static final _storage = GetStorage();
  static void setToken(String token) {
    _storage.write("token", token);
  }
  static String getToken() {
    return _storage.read("token") ?? "";
  }

  static void setFirstName(String firstName){
    _storage.write("firstName", firstName);
  }
  static String getFirstName() {
    return _storage.read("firstName");
  }

  static void setLastName(String lastName){
    _storage.write("lastName", lastName);
  }
  static String getLastName() {
    return _storage.read("lastName");
  }

  static void setEmail(String email){
    _storage.write("email", email);
  }
  static String getEmail() {
    return _storage.read("email");
  }

  static void logout(){
    _storage.remove("token");
    _storage.remove("email");
    _storage.remove("firstName");
    _storage.remove("lastName");
  }


}