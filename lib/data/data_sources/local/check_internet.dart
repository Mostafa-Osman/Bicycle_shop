import 'dart:io';

class CheckInternet {
  Future<bool> checkInternet() async {
    bool connection = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connection = true;
      }
    } on SocketException catch (_) {
      connection = false;
    }
    return connection;
  }
}
