import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_move/view/constants/app_theme.dart';
import 'package:furni_move/view/constants/routes.dart';
import 'package:furni_move/view/core/custom_widgets/editprofile_screen.dart';
import 'package:furni_move/view/features/base/views/base_screen.dart';
import 'package:furni_move/view/features/end_user/admin/account/views/admin_account_screen.dart';
import 'package:furni_move/view/features/end_user/customer/home/views/map_location_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/activity/views/request_map_screen.dart';
import 'package:furni_move/view/features/end_user/service_provider/requests/views/request_details_screen.dart';
import 'package:furni_move/view/features/registration/views/login_screen.dart';
import 'package:furni_move/view/features/registration/views/signup_screen.dart';
import 'package:furni_move/view/features/registration/views/welcome_screen.dart';
import 'package:furni_move/view/features/splash_screen.dart';
import 'package:furni_move/view_model/cubits/account_cubits/login/login_cubit.dart';
import 'package:furni_move/view_model/cubits/account_cubits/signup/signup_cubit.dart';
import 'package:furni_move/view_model/cubits/account_cubits/update/update_cubit.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/all_requests/all_requests_cubit.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/completed_requests/completed_requests_cubit.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/created_requests/created_requests_cubit.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/offers/offers_cubit.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/ongoing_requests/on_going_requests_cubit.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/suspend_user/suspend_user_cubit.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/unsuspend_user/un_suspend_user_cubit.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/users/users_cubit.dart';
import 'package:furni_move/view_model/cubits/admin_cubits/waiting_requests/waiting_requests_cubit.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/add_applaince/add_appliance_cubit.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/create_location/create_location_cubit.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/create_location2/create_location2_cubit.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/create_move_request/create_move_request_cubit.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/current_move/customer_current_move_cubit.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/customer_accept_move_offer/customer_accept_move_offer_cubit.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/customer_get_address/customer_get_address_cubit.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/customer_get_offers/customer_get_offers_cubit.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/customer_history/customer_history_cubit.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/get_truck_location/get_truck_location_cubit.dart';
import 'package:furni_move/view_model/cubits/customer_cubits/rate/rate_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/add_truck/add_truck_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/create_offer/create_offer_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/current_move/current_move_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/end_move/end_move_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/get_appliances/get_appliances_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/get_truck/get_truck_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/moves_history/moves_history_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/service_provider_all_offers/serviceprovider_all_offers_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/start_move/start_move_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/update_truck/update_truck_cubit.dart';
import 'package:furni_move/view_model/cubits/service_provider_cubits/update_truck_location/update_truck_location_cubit.dart';
import 'package:furni_move/view_model/database/network/dio_helper.dart';
import 'package:furni_move/view_model/repos/account/account_repo_impl.dart';
import 'package:furni_move/view_model/repos/admin/admin_repo_impl.dart';
import 'package:furni_move/view_model/repos/customer/customer_repo_impl.dart';
import 'package:furni_move/view_model/repos/service_provider/serviceprovider_repo_impl.dart';

void main() {
  DioHelper.init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (context) => CurrentMoveCubit(ServiceProviderRepoImpl())),
      BlocProvider(
          create: (context) =>
              ServiceproviderAllOffersCubit(ServiceProviderRepoImpl())),
      BlocProvider(
          create: (context) => MovesHistoryCubit(ServiceProviderRepoImpl())),
      BlocProvider(create: (context) => LoginCubit(AccountRepoImpl())),
      BlocProvider(create: (context) => SignupCubit(AccountRepoImpl())),
      BlocProvider(create: (context) => UpdateCubit(AccountRepoImpl())),
      BlocProvider(create: (context) => AllRequestsCubit(AdminRepoImpl())),
      BlocProvider(create: (context) => OffersCubit(AdminRepoImpl())),
      BlocProvider(create: (context) => UsersCubit(AdminRepoImpl())),
      BlocProvider(create: (context) => OnGoingRequestsCubit(AdminRepoImpl())),
      BlocProvider(create: (context) => CreatedRequestsCubit(AdminRepoImpl())),
      BlocProvider(create: (context) => WaitingRequestsCubit(AdminRepoImpl())),
      BlocProvider(create: (context) => SuspendUserCubit(AdminRepoImpl())),
      BlocProvider(create: (context) => UnSuspendUserCubit(AdminRepoImpl())),
      BlocProvider(
          create: (context) => CompletedRequestsCubit(AdminRepoImpl())),
      BlocProvider(
          create: (context) =>
              CustomerAcceptMoveOfferCubit(CustomerRepoImpl())),
      BlocProvider(create: (context) => RateCubit(CustomerRepoImpl())),
      BlocProvider(
          create: (context) => GetTruckLocationCubit(CustomerRepoImpl())),
      BlocProvider(create: (context) => AddApplianceCubit(CustomerRepoImpl())),
      BlocProvider(
          create: (context) => CustomerGetOffersCubit(CustomerRepoImpl())),
      BlocProvider(
          create: (context) => CustomerGetAddressCubit(CustomerRepoImpl())),
      BlocProvider(
          create: (context) => CreateMoveRequestCubit(CustomerRepoImpl())),
      BlocProvider(
          create: (context) => CustomerCurrentMoveCubit(CustomerRepoImpl())),
      BlocProvider(
          create: (context) => CustomerHistoryCubit(CustomerRepoImpl())),
      BlocProvider(
          create: (context) => CreateLocationCubit(CustomerRepoImpl())),
      BlocProvider(
          create: (context) => CreateLocation2Cubit(CustomerRepoImpl())),
      BlocProvider(
          create: (context) => AddTruckCubit(ServiceProviderRepoImpl())),
      BlocProvider(
          create: (context) => EndMoveCubit(ServiceProviderRepoImpl())),
      BlocProvider(
          create: (context) => StartMoveCubit(ServiceProviderRepoImpl())),
      BlocProvider(
          create: (context) => GetAppliancesCubit(ServiceProviderRepoImpl())),
      BlocProvider(
          create: (context) => GetTruckCubit(ServiceProviderRepoImpl())),
      BlocProvider(
          create: (context) =>
              UpdateTruckLocationCubit(ServiceProviderRepoImpl())),
      BlocProvider(
          create: (context) => CreateOfferCubit(ServiceProviderRepoImpl())),
      BlocProvider(
          create: (context) => UpdateTruckCubit(ServiceProviderRepoImpl())),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      routes: {
        Routes.splashRoute: (context) => const SplashScreen(),
        Routes.welcomeRoute: (context) => const WelcomeScreen(),
        Routes.loginRoute: (context) => const LoginScreen(),
        Routes.signUpRoute: (context) => const SignUpScreen(),
        Routes.baseRoute: (context) => const BaseScreen(),
        Routes.editProfile: (context) => const EditProfileScreen(),
        Routes.adminAccountRoute: (context) => const AdminAccountScreen(),
        Routes.providerRequestDetailsRoute: (context) =>
            const RequestDetailsScreen(),
        Routes.providerRequestMapRoute: (context) => const RequestMapScreen(),
        Routes.customerMapLocationRoute: (context) => const MapLocation(),

        // Routes.homeRoute: (context) => const HomeScreen(),
        // Routes.clientActivityRoute: (context) => const ClientActivityScreen(),
        // Routes.clientAccountRoute: (context) => const ClientAccountScreen(),
        // Routes.adminAccountRoute: (context) => const AdminAccountScreen(),
        // Routes.adminEndUsersRoute: (context) => const EndUsersScreen(),
        // Routes.adminReportsRoute: (context) => const ReportsScreen(),
        // Routes.providerAccountRoute: (context) => const ProviderAccountScreen(),
        // Routes.providerActivityRoute: (context) =>
        //     const ProviderActivityScreen(),
        // Routes.providerRequestsRoute: (context) => const RequestsScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashRoute,
    );
  }
}
