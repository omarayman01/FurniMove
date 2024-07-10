import 'package:flutter/material.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/features/end_user/admin/account/views/admin_account_screen.dart';
import 'package:furni_move/view/features/end_user/admin/end_users/views/end_users_screen.dart';
import 'package:furni_move/view/features/end_user/admin/reports/views/reports_screen.dart';
import 'package:furni_move/view/features/end_user/customer/account/views/customer_account_screen.dart';
import 'package:furni_move/view/features/end_user/customer/activity/views/customer_activity_screen.dart';
import 'package:furni_move/view/features/end_user/customer/home/views/customer_home_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/account/views/provider_account_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/activity/views/provider_activity_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/add_truck/views/add_truck.dart';
import 'package:furni_move/view/features/end_user/service_provider/add_truck/views/truck_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/requests/views/provider_request_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

List<Widget> customerTabs = [
  CustomerHomeScreen(user: user),
  CustomerActivityScreen(user: user),
  CustomerAccountScreen(user: user)
];
List<Widget> serviceProviderTabs = const [
  RequestsScreen(),
  ProviderActivityScreen(),
  TruckScreen(),
  ProviderAccountScreen()
];
List<Widget> adminTabs = const [
  ReportsScreen(),
  EndUsersScreen(),
  AdminAccountScreen()
];
late UserModel user;
int selectedIndex = 0;

class _BaseScreenState extends State<BaseScreen> {
  @override
  void initState() {
    selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // user = ModalRoute.of(context)?.settings.arguments as UserModel;

    return Scaffold(
      body: displaybody(user.role!)[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          items: displaynav(user.role!)),
    );
  }

  dynamic displaynav(String value) {
    if (value == 'Customer') {
      return customer;
    } else if (value == 'ServiceProvider') {
      return serviceProvider;
    } else if (value == 'Admin') {
      return admin;
    }
    setState(() {});
  }

  dynamic displaybody(String value) {
    if (value == 'Customer') {
      return customerTabs;
    } else if (value == 'ServiceProvider') {
      return serviceProviderTabs;
    } else if (value == 'Admin') {
      return adminTabs;
    }
    setState(() {});
  }
}

List<BottomNavigationBarItem> customer = const [
  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
  BottomNavigationBarItem(
      icon: Icon(Icons.library_books_outlined), label: 'Moves'),
  BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded), label: 'Account'),
];
List<BottomNavigationBarItem> admin = const [
  BottomNavigationBarItem(
      icon: Icon(Icons.insert_chart_outlined_outlined), label: 'Reports'),
  BottomNavigationBarItem(
      icon: Icon(Icons.groups_outlined), label: 'End Users'),
  BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded), label: 'Account'),
];
List<BottomNavigationBarItem> serviceProvider = const [
  BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Requests'),
  BottomNavigationBarItem(
      icon: Icon(Icons.library_books_outlined), label: 'Activity'),
  BottomNavigationBarItem(icon: Icon(Icons.fire_truck_sharp), label: 'Truck'),
  BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded), label: 'Account'),
];
