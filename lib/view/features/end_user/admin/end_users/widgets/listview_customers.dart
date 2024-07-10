import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/admin/end_users/widgets/custom_container_endusers.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/suspend_user/suspend_user_cubit.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/unsuspend_user/un_suspend_user_cubit.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/users/users_cubit.dart';

class ListViewCustomers extends StatefulWidget {
  const ListViewCustomers({
    super.key,
  });

  @override
  State<ListViewCustomers> createState() => _ListViewCustomersState();
}

class _ListViewCustomersState extends State<ListViewCustomers> {
  @override
  void initState() {
    debugPrint("setstate2");
    context.read<UsersCubit>().fetchUsers(user, 'customer');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fetchUsers();
    debugPrint("setstate");
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        // print(state.users);
        if (state is UsersSuccess) {
          return ListView.builder(
            itemBuilder: (BuildContext context, index) {
              return SizedBox(
                child: Stack(
                  children: [
                    CustomContainerEndusers(
                      user: state.users[index],
                    ),
                    Positioned(
                      top: 3,
                      right: 20,
                      child: CustomButton(
                          fontsize: 10,
                          onPressed: () {
                            if (state.users[index].suspended) {
                              context
                                  .read<UnSuspendUserCubit>()
                                  .fetchUnSuspendUser(
                                      user, state.users[index].id!);
                              setState(() {});
                            } else {
                              context.read<SuspendUserCubit>().fetchSuspendUser(
                                  user, state.users[index].id!);
                              setState(() {});
                            }
                          },
                          text: state.users[index].suspended
                              ? 'Unsuspend'
                              : 'Suspend',
                          color: AppTheme.grey,
                          radius: 15,
                          height: 32,
                          width: 85,
                          textColor: AppTheme.white),
                    )
                  ],
                ),
              );
            },
            itemCount: state.users.length,
          );
        } else if (state is UsersFailure) {
          return Text(state.errMessage,
              style: Theme.of(context).textTheme.bodyLarge);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  void fetchUsers() async {
    await Future.delayed(Duration(seconds: 1));
    await context.read<UsersCubit>().fetchUsers(user, 'customer');
    await Future.delayed(Duration(seconds: 1));
  }
}
