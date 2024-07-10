import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/features/end_user/customer/activity/views/curreent_request_screen.dart';
import 'package:furni_move/view/features/end_user/customer/activity/views/moves_history_screen.dart';

class CustomerActivityScreen extends StatelessWidget {
  const CustomerActivityScreen({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ContainedTabBarView(
              tabs: const [
                Text(
                  'Current Request',
                ),
                Text(
                  'Moves History',
                ),
              ],
              views: const [
                CurrentRequestScreen(),
                MovesHistoryScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
