class BaseLink {
  static const domain = 'https://be-graduation-thesis.azurewebsites.net';

  //Auth
  static const login = '$domain/api/v1/authention/client-sign-in';
  static const register = '$domain/api/v1/authention/client-register';
  static const refreshToken = '$domain/api/v1/authention/refresh-token';
  static const getInformation = '$domain/api/v1/client/get-single-by-id';
  static const sendOTP = '$domain/api/v1/authention/client/send-email-otp';
  static const confirmOTP = '$domain/api/v1/authention/client/confirm-email-otp';
  static const updateAvatar = '$domain/api/v1/client/update-avatar';
  static const changePassword = '$domain/api/v1/authention/client-change-password';
  static const updateForgotPass = '$domain/api/v1/authention/client/forgot-password';
  static const updateNameAccount = '$domain/api/v1/client/name';
  static const sendMailChangePhone = '$domain/api/v1/authention/client/send-email-otp-change';
  static const updatePhone = '$domain/api/v1/authention/client/change-phone';


  static String createPatient = '$domain/api/v1/patient-profile';
  static String updatePatient = '$domain/api/v1/patient-profile';
  static String getPatients = '$domain/api/v1/patient-profile/many-by-client/';
  static String getPatientById = '$domain/api/v1/patient-profile/single-by-id/';
  static String updatePatientImage = '$domain/api/v1/patient-profile/avatar/';
  static String deletePatient = '$domain/api/v1/patient-profile/soft-delete/';



  
  static String getClinic = '$domain/api/v1/clinic/get-many-active/';


  static String getSpecials = '$domain/api/v1/medical-specialty/many-by-clinic/';

  static String getDoctorsByClinic = '$domain/api/v1/employee/doctor-by-clinic/';
  static String getDoctorById = '$domain/api/v1/employee/doctor-mobile/';
  static String getListDoctorBySpecialAndClinic = '$domain/api/v1/employee/mobile-doctor/';
  static String getTop5Doctor = '$domain/api/v1/employee/top-doctors/';

  //api/v1/employee/mobile-doctor/

  static String getClientsByIdAccount = '$domain/api/v1/patient-profile/get-many-by-client-id';




//Appointment
  static String getAppointmentComming= '$domain/api/v1/appointment/many-up-coming/';
  static String getAppointmentFinish= '$domain/api/v1/appointment/many-completed/';
  static String getAppointmentById = '$domain/api/v1/appointment/single-appointment-mobile/appointmentId=';
  static String createAppointment = '$domain/api/v1/appointment/booking';
  static String createAppointmentHealthCheck = '$domain/api/v1/general-health-check/booking';
  static String checkinAppointment = '$domain/api/v1/appointment/check-in';
  static String cancelAppointment = '$domain/api/v1/appointment/cancel';
  static String feedbackAppointment = '$domain/api/v1/feedback';
  static String getFeedbackByIdDoctor = '$domain/api/v1/feedback/many-by-doctor/';
//
  //DutySchedule
  // static String checkDutyScheduleTest = '$domain/';
  static String checkDutyScheduleGeneral = '$domain/api/v1/duty-schedule/many-by-general-health-check/';
  static String checkDutyScheduleMedicalExamination = '$domain/api/v1/duty-schedule/many-by-examination/';
  static String checkDutyScheduleMedicalPsychology = '$domain/api/v1/duty-schedule/many-by-psychology/';
  static String checkDutyScheduleMedicalVacination = '$domain/api/v1/duty-schedule/many-by-vacination/';
  static String checkDutyScheduleSpecialty =  '$domain/api/v1/duty-schedule/many-by-specialty/';


  //Medical-service
  static String getVaccinationService = '$domain/api/v1/medical-service/vaccination';
  static String getExaminationService = '$domain/api/v1/medical-service/examination';
  static String getPsychologicalService = '$domain/api/v1/medical-service/psychological';


  //Address
  static String getProvinces = 'https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/province';
  static String getDistrict = 'https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/district';
  static String getWard = 'https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/ward?district_id=';
  
  //Medical-Records
  static String getMedicalRecordsByIdPatient = '$domain/api/v1/medical-record/get-all-medical-records-by-patient-profile-id';
}
