// import 'package:get/get.dart';
// import 'package:mdigiseva/models/services/service_list_model.dart';
// import 'package:mdigiseva/view/create_appln/cat_details_screen.dart';
// import 'package:mdigiseva/view/create_appln/req_proposal_screen.dart';
// import 'package:mdigiseva/view/create_appln/services_list_screen.dart';
// import 'package:mdigiseva/view/create_appln/upload_docs/send_docs_form_screen.dart';
// import 'package:mdigiseva/view/nav_bar/mani_nav_screen.dart';
// import 'package:mdigiseva/view/nav_bar/my_applications_screen.dart';
// import 'package:mdigiseva/view/nav_bar/profile/edit_user_screen.dart';
// import 'package:mdigiseva/view/nav_bar/my_orders_screen.dart';
// import 'package:mdigiseva/view/onboarding/forgotpass_screen.dart';
// import 'package:mdigiseva/view/onboarding/login_screen.dart';
// import 'package:mdigiseva/view/onboarding/onboarding_screen.dart';
// import 'package:mdigiseva/view/onboarding/otp_verify_screen.dart';
// import 'package:mdigiseva/view/onboarding/reset_pass_screen.dart';
// import 'package:mdigiseva/view/onboarding/signup_screen.dart';
// import 'package:mdigiseva/view/nav_bar/profile/profile_screen.dart';
// import 'package:mdigiseva/view/side_drawer/my_docs_screen.dart';
// import 'package:mdigiseva/view/side_drawer/notification_screen.dart';
// import 'package:mdigiseva/view/side_drawer/querry_screen.dart';
// import 'package:mdigiseva/view/side_drawer/aboutus_screen.dart';
// import 'package:mdigiseva/view/side_drawer/faq_screen.dart';
// import 'package:mdigiseva/view/side_drawer/privacy_policy_screen.dart';
// import 'package:mdigiseva/view/side_drawer/terms_screen.dart';

// import '../../view/create_appln/service_detail_screen.dart';
// import '../../view/create_appln/upload_docs/loc_form_screen.dart';
// import '../../view/nav_bar/home_screen.dart';
// import '../../view/nav_bar/orders/order_details_screen.dart';
// import 'route_names.dart';

// class AppRoutes {
//   static appRoutes() => [
//         GetPage(
//           name: RouteName.onBoarding,
//           page: () => const OnboardingScreen(),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.loginView,
//           page: () => const LoginScreen(),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.signupView,
//           page: () => const SignupScreen(),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.otpVerifyView,
//           page: () => OTPVerifyScreen(
//             isLogin: Get.arguments['isLog'],
//             pass: Get.arguments['pass'],
//             mail: Get.arguments['mail'],
//           ),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.forgotPassView,
//           page: () => const ForgotPassScreen(),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.resetPassView,
//           page: () => const ResetPassScreen(),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.mainNavView,
//           page: () => const MainNavScreen(
//             currentTab: "1",
//           ),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.homeView,
//           page: () => const HomeScreen(),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.myApplicationsView,
//           page: () => const MyApplicationsScreen(),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.profileView,
//           page: () => const MyProfileScreen(),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.editUserView,
//           page: () => EditUserDataScreen(
//             updItem: Get.arguments['updItem'],
//             refreshCallback: Get.arguments['refreshCallback'],
//           ),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.myDocsView,
//           page: () => const MyDocsScreen(),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.termsView,
//           page: () => const TermsScreen(),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.privacyView,
//           page: () => const PrivacyPolicyScreen(),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.faqView,
//           page: () => const FAQScreen(),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.aboutusView,
//           page: () => const AboutUsScreen(),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.catView,
//           page: () => CatDetailsScreen(
//             catId: Get.arguments['catId'].toString(),
//             catSlug: Get.arguments['catSlug'].toString(),
//           ),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.servicesView,
//           page: () => ServicesListScreen(
//             catid: Get.arguments['catid'].toString(),
//           ),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.serviceDetailView,
//           page: () => ServiceDetailScreen(
//             app: Get.arguments['app'],
//           ),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.myOrdersView,
//           page: () => const MyOrdersScreen(),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.orderDetView,
//           page: () => OrderDetailScreen(
//             orderId: Get.arguments['orderId'].toString(),
//           ),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.reqProposalView,
//           page: () => ReqProposalScreen(
//             catid: Get.arguments['catid'],
//             tickedServices:
//                 Get.arguments['tickedservices'] as List<ServiceListModel>,
//           ),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.querryView,
//           page: () => const QuerryScreen(),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.notifView,
//           page: () => const NotificationsScreen(),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.saveLocView,
//           page: () => LocFormScreen(
//             app: Get.arguments['app'],
//             refreshCallback: Get.arguments['refreshCallback'],
//           ),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//         GetPage(
//           name: RouteName.sendDocsView,
//           page: () => SendDocsScreen(
//             app: Get.arguments['app'],
//             refreshCallback: Get.arguments['refreshCallback'],
//           ),
//           transitionDuration: const Duration(milliseconds: 250),
//           transition: Transition.leftToRightWithFade,
//         ),
//       ];
// }
