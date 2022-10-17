import 'package:socket_io_client/socket_io_client.dart';

import '../clients/socket_client.dart';

class SocketServices {
  final _socketClient = SocketClient.instance.socket!;
  Socket get socketClient => _socketClient;
}
