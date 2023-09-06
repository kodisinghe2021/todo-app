import 'package:get_storage/get_storage.dart';

class LocalUserStatus {
  final _localUserStorage = GetStorage();

  // add new user data
  Future<void> addCurrentUserData(String userID) async {
    await _localUserStorage.write('userID', userID);
  }

  // giving current user status
  bool isUserLogged() => _localUserStorage.hasData('userID');

  // remove current user
  Future<void> removeCurrentUSer() async {
    await _localUserStorage.erase();
  }

  // giving user id of the current user
  Future<String> getUserID() async {
    String uID = await _localUserStorage.read('userID');
    return uID;
  }
}
