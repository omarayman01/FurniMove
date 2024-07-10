import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:furni_move/view/core/custom_widgets/logo_column.dart';
import 'package:furni_move/view/features/end_user/admin/end_users/widgets/listview_customers.dart';
import 'package:furni_move/view/features/end_user/admin/end_users/widgets/listview_serviceproviders.dart';

class EndUsersScreen extends StatelessWidget {
  const EndUsersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const LogoColumn(),
        Expanded(
          child: ContainedTabBarView(
            tabs: const [
              Text('Customers'),
              Text('Service Providers'),
            ],
            views: const [
              ListViewCustomers(),
              ListViewServiceProviders(),
            ],
            // onChange: (index) => print(index),
          ),
        ),
      ],
    );
  }
}
