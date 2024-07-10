import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/core/custom_widgets/logo_column.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/admin/reports/widgets/listview_reports.dart';
import 'package:furni_move/view/features/end_user/admin/reports/widgets/requests/complained_requests.dart';
import 'package:furni_move/view/features/end_user/admin/reports/widgets/requests/completed_requests.dart';
import 'package:furni_move/view/features/end_user/admin/reports/widgets/requests/created_requests.dart';
import 'package:furni_move/view/features/end_user/admin/reports/widgets/requests/ongoing_requests.dart';
import 'package:furni_move/view/features/end_user/admin/reports/widgets/requests/waiting_requests.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/all_requests/all_requests_cubit.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/completed_requests/completed_requests_cubit.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/created_requests/created_requests_cubit.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/ongoing_requests/on_going_requests_cubit.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/waiting_requests/waiting_requests_cubit.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({
    super.key,
  });

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  late Widget _activeWidget;
  late Widget _sizedWidget;

  String text = 'Requests';

  @override
  void initState() {
    context.read<CompletedRequestsCubit>().fetchCompletedRequests(user);
    context.read<AllRequestsCubit>().fetchAllRequests(user);
    context.read<OnGoingRequestsCubit>().fetchOnGoingRequests(user);
    context.read<CreatedRequestsCubit>().fetchCreatedRequests(user);
    context.read<WaitingRequestsCubit>().fetchWaitingRequests(user);

    _activeWidget = const ListViewReports();
    _sizedWidget = const SizedBox(width: 80);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 3,
                color: AppTheme.lightGrey,
              ),
            ),
            const SizedBox(height: 30),
            ListTile(
              title: Text(
                'Completed',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              leading: const Icon(Icons.check_box),
              onTap: () {
                setState(() {
                  _activeWidget = CompletedRequests(
                    user: user,
                  );
                  text = 'Completed Requests';
                  _sizedWidget = const SizedBox(width: 40);

                  Navigator.pop(context);
                });
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                'On Going',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              leading: const Icon(Icons.departure_board_outlined),
              onTap: () {
                setState(() {
                  _activeWidget = OnGoingRequests(
                    user: user,
                  );
                  text = 'On Going Requests';
                  _sizedWidget = const SizedBox(width: 40);
                  Navigator.pop(context);
                });
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                'Waiting',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              leading: const Icon(Icons.watch_later_outlined),
              onTap: () {
                setState(() {
                  _activeWidget = const WaitingRequestsListView();
                  text = 'Waiting Requests';
                  _sizedWidget = const SizedBox(width: 40);
                  Navigator.pop(context);
                });
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                'Created',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              leading: const Icon(Icons.start),
              onTap: () {
                setState(() {
                  _activeWidget = const CreatedRequestsListView();
                  text = 'Created Requests';
                  _sizedWidget = const SizedBox(width: 30);

                  Navigator.pop(context);
                });
              },
            ),
            const SizedBox(height: 10),
            // ListTile(
            //   title: Text(
            //     'Complains',
            //     style: Theme.of(context).textTheme.headlineLarge,
            //   ),
            //   leading: const Icon(Icons.report_problem_outlined),
            //   onTap: () {
            //     setState(() {
            //       _activeWidget = const ComplainedRequests();
            //       text = 'Complained Requests';
            //       _sizedWidget = const SizedBox(width: 30);

            //       Navigator.pop(context);
            //     });
            //   },
            // )
          ],
        ),
      ),
      key: scaffoldkey,
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const LogoColumn(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    scaffoldkey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.list, size: 34)),
              _sizedWidget,
              Text(
                text,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
          Expanded(
            child: _activeWidget,
          ),
        ],
      ),
    );
  }
}
