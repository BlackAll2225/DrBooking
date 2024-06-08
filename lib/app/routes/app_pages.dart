import 'package:get/get.dart';

import '../modules/booking/booking_general/bindings/booking_general_binding.dart';
import '../modules/booking/booking_general/views/booking_general_view.dart';
import '../modules/booking/booking_medical_serivce/bindings/booking_medical_serivce_binding.dart';
import '../modules/booking/booking_medical_serivce/views/booking_medical_serivce_view.dart';
import '../modules/booking/booking_process_clinic/bindings/booking_process_clinic_binding.dart';
import '../modules/booking/booking_process_clinic/views/booking_process_clinic_view.dart';
import '../modules/booking/booking_process_confirm/bindings/booking_process_confirm_binding.dart';
import '../modules/booking/booking_process_confirm/views/booking_process_confirm_view.dart';
import '../modules/booking/booking_process_main/bindings/booking_process_main_binding.dart';
import '../modules/booking/booking_process_main/views/booking_process_main_view.dart';
import '../modules/booking/booking_process_patient/bindings/booking_process_patient_binding.dart';
import '../modules/booking/booking_process_patient/views/booking_process_patient_view.dart';
import '../modules/booking/booking_process_service/bindings/booking_process_service_binding.dart';
import '../modules/booking/booking_process_service/views/booking_process_service_view.dart';
import '../modules/booking/booking_process_time/bindings/booking_process_time_binding.dart';
import '../modules/booking/booking_process_time/views/booking_process_time_view.dart';
import '../modules/booking_detail/bindings/booking_detail_binding.dart';
import '../modules/booking_detail/views/booking_detail_view.dart';
import '../modules/change-password/bindings/change_password_binding.dart';
import '../modules/change-password/views/change_password_view.dart';
import '../modules/check_permission/bindings/check_permission_binding.dart';
import '../modules/check_permission/views/check_permission_view.dart';
import '../modules/doctor/bindings/doctor_binding.dart';
import '../modules/doctor/views/doctor_view.dart';
import '../modules/doctor_detail/bindings/doctor_detail_binding.dart';
import '../modules/doctor_detail/views/doctor_detail_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/map-explore/bindings/map_explore_binding.dart';
import '../modules/map-explore/views/map_explore_view.dart';
import '../modules/medical_record/bindings/medical_record_binding.dart';
import '../modules/medical_record/views/medical_record_view.dart';
import '../modules/new_profile/bindings/new_profile_binding.dart';
import '../modules/new_profile/views/new_profile_view.dart';
import '../modules/patient_detail/bindings/patient_detail_binding.dart';
import '../modules/patient_detail/views/patient_detail_view.dart';
import '../modules/personal-information/bindings/personal_information_binding.dart';
import '../modules/personal-information/views/personal_information_view.dart';
import '../modules/sign_in/bindings/sign_in_binding.dart';
import '../modules/sign_in/views/sign_in_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/tab-patient/views/tab_patient_view.dart';
import '../modules/tab_account/views/tab_account_view.dart';
import '../modules/tab_calendar/views/tab_calendar_view.dart';
import '../modules/tab_history/views/tab_history_view.dart';
import '../modules/tab_home_view/views/tab_home_view_view.dart';
import '../modules/verify_otp/bindings/verify_otp_binding.dart';
import '../modules/verify_otp/views/verify_otp_view.dart';
import '../modules/welcome_board/bindings/welcome_board_binding.dart';
import '../modules/welcome_board/views/splash_screen.dart';

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
      page: () => const SplashView(),
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
      name: _Paths.TAB_PATIENT,
      page: () => const TabPatientView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_PROCESS_PATIENT,
      page: () => const BookingProcessPatientView(),
      binding: BookingProcessPatientBinding(),
    ),
    GetPage(
        name: _Paths.BOOKING_PROCESS_MAIN,
        page: () => const BookingProcessMainView(),
        binding: BookingProcessMainBinding(),
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
      page: () => const PatientDetailView(),
      binding: ProfileDetailBinding(),
    ),
    GetPage(
        name: _Paths.BOOKING_PROCESS_CLINIC,
        page: () => const BookingProcessClinicView(),
        binding: BookingProcessClinicBinding(),
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
    GetPage(
      name: _Paths.MEDICAL_RECORD,
      page: () => const MedicalRecordView(),
      binding: MedicalRecordBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_GENERAL,
      page: () => const BookingGeneralView(),
      binding: BookingGeneralBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_MEDICAL_SERIVCE,
      page: () => const BookingMedicalSerivceView(),
      binding: BookingMedicalSerivceBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHECK_PERMISSION,
      page: () => const CheckPermissionView(),
      binding: CheckPermissionBinding(),
    ),
  ];
}
