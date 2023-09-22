import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';


///Boilerplate code for checking internet connection
class ConnectionUtil {
  static final ConnectionUtil _singleton =  ConnectionUtil._internal();
  ConnectionUtil._internal();

  static ConnectionUtil getInstance() => _singleton;

  bool hasConnection = false;

  StreamController connectionChangeController = StreamController();

  final Connectivity _connectivity = Connectivity();
  void initialize() {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
  }

  void _connectionChange(ConnectivityResult result) {
    hasInternetInternetConnection();
  }

  Stream get connectionChange => connectionChangeController.stream;
  Future<bool> hasInternetInternetConnection() async {
    bool previousConnection = hasConnection;
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      if (await DataConnectionChecker().hasConnection) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } else {
      hasConnection = false;
    }

    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }
    return hasConnection;
  }
}

enum NetworkStatus { online, offline }

class NetworkStatusService {
  StreamController<NetworkStatus> networkStatusController =
  StreamController<NetworkStatus>();

  NetworkStatusService() {
    Connectivity().onConnectivityChanged.listen((status) {
      networkStatusController.add(getNetworkStatus(status));
    });
  }

  NetworkStatus getNetworkStatus(ConnectivityResult status) {
    return status == ConnectivityResult.mobile ||
        status == ConnectivityResult.wifi
        ? NetworkStatus.online
        : NetworkStatus.offline;
  }
}
