import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityServiceProvider = Provider<ConnectivityService>((ref) {
  return ConnectivityService();
});

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  Stream<bool> get isOnlineStream {
    return _connectivity.onConnectivityChanged.map((results) {
      // Starting from connectivity_plus 6.0.0, it returns List<ConnectivityResult>
      // We check if it contains anything other than none
      if (results.isEmpty) return false;
      if (results.length == 1 && results.first == ConnectivityResult.none) return false;
      return true;
    });
  }

  Future<bool> checkConnectivity() async {
    final results = await _connectivity.checkConnectivity();
    if (results.isEmpty) return false;
    if (results.length == 1 && results.first == ConnectivityResult.none) return false;
    return true;
  }
}
