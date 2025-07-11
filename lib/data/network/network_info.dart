import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker _internetConnectionChecker;

  NetworkInfoImpl(
      {required InternetConnectionChecker internetConnectionChecker})
      : _internetConnectionChecker = internetConnectionChecker;
  @override
  Future<bool> get isConnected  async =>
     await  _internetConnectionChecker.hasConnection;



}
