import 'package:connectivity_plus/connectivity_plus.dart';

class Connection {
  Future<bool> isConnected() async {
    var connectivity = await Connectivity().checkConnectivity();
    if (connectivity == ConnectivityResult.mobile) {
      return true;
    } else if (connectivity == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
