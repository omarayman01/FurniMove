import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/custom_button.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/admin/end_users/widgets/custom_container_endusers.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/created_requests/created_requests_cubit.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/suspend_user/suspend_user_cubit.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/unsuspend_user/un_suspend_user_cubit.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/users/users_cubit.dart';
import 'package:furni_move/view_model/repos/admin/admin_repo_impl.dart';

class ListViewServiceProviders extends StatefulWidget {
  const ListViewServiceProviders({
    super.key,
  });

  @override
  State<ListViewServiceProviders> createState() =>
      _ListViewServiceProvidersState();
}

class _ListViewServiceProvidersState extends State<ListViewServiceProviders> {
  @override
  void initState() {
    debugPrint("");
    context.read<UsersCubit>().fetchUsers(user, 'serviceprovider');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fetchUsers();
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        if (state is UsersSuccess) {
          return ListView.builder(
            itemBuilder: (BuildContext context, index) {
              return Stack(
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
                          } else {
                            context
                                .read<SuspendUserCubit>()
                                .fetchSuspendUser(user, state.users[index].id!);
                          }
                          setState(() {});
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
    await context.read<UsersCubit>().fetchUsers(user, 'serviceprovider');
    await Future.delayed(Duration(seconds: 1));
  }
}
