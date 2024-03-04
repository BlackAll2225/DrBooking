import 'package:drbooking/app/modules/personal-information/bindings/personal_information_binding.dart';
import 'package:drbooking/app/modules/personal-information/views/personal_information_view.dart';
import 'package:get/get.dart';

import '../modules/booking/bindings/booking_binding.dart';
import '../modules/booking/views/booking_view.dart';
import '../modules/booking_detail/bindings/booking_detail_binding.dart';
import '../modules/booking_detail/views/booking_detail_view.dart';
import '../modules/booking_process/bindings/booking_process_binding.dart';
import '../modules/booking_process/views/booking_process_view.dart';
import '../modules/booking_process_branch/bindings/booking_process_branch_binding.dart';
import '../modules/booking_process_branch/views/booking_process_branch_view.dart';
import '../modules/booking_process_confirm/bindings/booking_process_confirm_binding.dart';
import '../modules/booking_process_confirm/views/booking_process_confirm_view.dart';
import '../modules/booking_process_service/bindings/booking_process_service_binding.dart';
import '../modules/booking_process_service/views/booking_process_service_view.dart';
import '../modules/booking_process_time/bindings/booking_process_time_binding.dart';
import '../modules/booking_process_time/views/booking_process_time_view.dart';
import '../modules/change-password/bindings/change_password_binding.dart';
import '../modules/change-password/views/change_password_view.dart';
import '../modules/doctor/bindings/doctor_binding.dart';
import '../modules/doctor/views/doctor_view.dart';
import '../modules/doctor_detail/bindings/doctor_detail_binding.dart';
import '../modules/doctor_detail/views/doctor_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/map-explore/bindings/map_explore_binding.dart';
import '../modules/map-explore/views/map_explore_view.dart';
import '../modules/new_profile/bindings/new_profile_binding.dart';
import '../modules/new_profile/views/new_profile_view.dart';
import '../modules/profile_detail/bindings/profile_detail_binding.dart';
import '../modules/profile_detail/views/profile_detail_view.dart';
import '../modules/sign_in/bindings/sign_in_binding.dart';
import '../modules/sign_in/views/sign_in_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/tab-profile/views/tab_profile_view.dart';
import '../modules/tab_account/views/tab_account_view.dart';
import '../modules/tab_calendar/views/tab_calendar_view.dart';
import '../modules/tab_history/views/tab_history_view.dart';
import '../modules/tab_home_view/views/tab_home_view_view.dart';
import '../modules/verify_otp/bindings/verify_otp_binding.dart';
import '../modules/verify_otp/views/verify_otp_view.dart';
import '../modules/welcome_board/bindings/welcome_board_binding.dart';
import '../modules/welcome_board/views/welcome_board_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME_BOARD;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME_BOARD,
      page: () => const WelcomeBoardView(),
      binding: WelcomeBoardBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
        name: _Paths.SIGN_UP,
        page: () => const SignUpView(),
        binding: SignUpBinding(),
        transition: Transition.rightToLeft),
    GetPage(
      name: _Paths.TAB_HOME_VIEW,
      page: () => const TabHomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TAB_CALENDAR,
      page: () => const TabCalendarView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TAB_HISTORY,
      page: () => const TabHistoryView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TAB_ACCOUNT,
      page: () => const TabAccountView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DOCTOR_DETAIL,
      page: () => const DoctorDetailView(),
      binding: DoctorDetailBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_DETAIL,
      page: () => const BookingDetailView(),
      binding: BookingDetailBinding(),
    ),
    GetPage(
      name: _Paths.TAB_PROFILE,
      page: () => const TabProfileView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING,
      page: () => const BookingView(),
      binding: BookingBinding(),
    ),
    GetPage(
        name: _Paths.BOOKING_PROCESS,
        page: () => const BookingProcessView(),
        binding: BookingProcessBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _Paths.BOOKING_PROCESS_TIME,
        page: () => const BookingProcessTimeView(),
        binding: BookingProcessTimeBinding(),
        transition: Transition.downToUp),
    GetPage(
      name: _Paths.NEW_PROFILE,
      page: () => const NewProfileView(),
      binding: NewProfileBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_OTP,
      page: () => const VerifyOtpView(),
      binding: VerifyOtpBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_DETAIL,
      page: () => const ProfileDetailView(),
      binding: ProfileDetailBinding(),
    ),
    GetPage(
        name: _Paths.BOOKING_PROCESS_BRANCH,
        page: () => const BookingProcessBranchView(),
        binding: BookingProcessBranchBinding(),
        transition: Transition.rightToLeft),
    GetPage(
      name: _Paths.BOOKING_PROCESS_SERVICE,
      page: () => const BookingProcessServiceView(),
      binding: BookingProcessServiceBinding(),
    ),
    GetPage(
        name: _Paths.DOCTOR,
        page: () => const DoctorView(),
        binding: DoctorBinding(),
        transition: Transition.downToUp),
    GetPage(
      name: _Paths.BOOKING_PROCESS_CONFIRM,
      page: () => const BookingProcessConfirmView(),
      binding: BookingProcessConfirmBinding(),
    ),
    GetPage(
      name: _Paths.MAP_EXPLORE,
      page: () => const MapExploreView(),
      binding: MapExploreBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_INFORMATION,
      page: () => const PersonalInformationView(),
      binding: PersonalInformationBinding(),
    ),
  ];
}
