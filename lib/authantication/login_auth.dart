import 'package:local_auth/local_auth.dart';

class Authantication {
  static final _auth = LocalAuthentication();

  static Future<bool> canAuthenticat() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
  static Future<bool> authentication() async {
    try {
      if (!await canAuthenticat()) return false;
      return await _auth.authenticate(
          localizedReason: "Scan Your FingerPrint To Login",
          options:
              AuthenticationOptions(useErrorDialogs: true, stickyAuth: true));
    } catch (e) {
      print("${e}");
      return false;
    }
  }
}
