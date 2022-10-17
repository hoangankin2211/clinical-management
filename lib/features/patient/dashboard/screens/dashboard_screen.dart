import 'package:clinic_manager/common/widgets/custom_button.dart';
import 'package:clinic_manager/constants/api_link.dart';
import 'package:flutter/material.dart';

import '../../../../models/user.dart';
import '../../../../services/auth_services.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  late IO.Socket socket;
  int _counter = 0;

  void connect() {
    // ignore: avoid_print
    print("Connecting socket");
    socket = IO.io(ApiLink.uri, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    socket.onConnect((data) => print('connected'));
    // ignore: avoid_print
    print("connect socket: ${socket.connected}");
    socket.emit("/test", "Hello world");
    socket.on('fromServer', (data) {
      print(data);
    });
  }

  @override
  void initState() {
    super.initState();
    connect();
  }

  @override
  Widget build(BuildContext context) {
    final User _user = AuthService.instance.user;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () => AuthService.instance.logOut(context),
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _counter.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            CustomButton(
                text: 'Counter',
                onTap: () => {
                      socket.emit('fromClient', _counter),
                      socket.on('fromServer', (data) {
                        print(data);
                      })
                    })
          ],
        ),
      ),
    );
  }
}
