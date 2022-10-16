import 'package:flutter/material.dart';

import '../../../models/user.dart';
import '../../../services/auth_services.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User _user = AuthService.instance.user;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () => AuthService.instance.logOut(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
