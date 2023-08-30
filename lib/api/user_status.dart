import 'package:get_storage/get_storage.dart';

class LocalUserStatus {
  final _localUserStorage = GetStorage();

  Future<void> addCurrentUserData(String userID) async {
    await _localUserStorage.write('userID', userID);
  }

  bool isUserLogged() => _localUserStorage.hasData('userID');

  Future<void> removeCurrentUSer() async {
    await _localUserStorage.erase();
  }

}
