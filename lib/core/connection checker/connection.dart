


import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;

  NetworkInfo(this.internetConnectionChecker);

  Future<bool> isConnected() async {
    return await internetConnectionChecker.hasConnection;
  }
}
