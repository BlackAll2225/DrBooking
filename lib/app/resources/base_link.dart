class BaseLink {
  static const domain = 'https://be-graduation-thesis.azurewebsites.net';

  //Auth
  static const login = '$domain/api/v1/authention/client-sign-in';
  static const register = '$domain/api/v1/authention/client-register';
  static const getInformation = '$domain/api/v1/client/get-single-by-id';

  static String getClinic = '$domain/api/v1/clinic/get-many-active/';


  static String getSpecials = '$domain/api/v1/medical-specialty/get-many-by-clinic-id/';

  static String getDoctorsByClinic = '$domain/api/v1/employee/doctor-by-clinic/';
  static String getDoctorById = '$domain/api/v1/employee/doctor/';

  static String getClientsByIdAccount = '$domain/api/v1/patient-profile/get-many-by-client-id';


  static String createPatient = '$domain/api/v1/patient-profile/create-patient-profile-async';
  static String updatePatient = '$domain/api/v1/patient-profile/update';
  static String getPatients = '$domain/api/v1/patient-profile/get-many-by-client-id';
  static String getPatientById = '$domain/api/v1/patient-profile/get-patientprofile-by-id';

//Appointment
  static String getAppointmentComming= '$domain/api/v1/appointment/get-many-list-up-coming-appointment-by-client-id';
  static String getAppointmentFinish= '$domain/api/v1/appointment/get-many-list-finish-appointment-by-client-id';
  static String getAppointmentById = '$domain/api/v1/appointment/get-appointment-detail-for-mobile-by-appointment-id-async';
  static String createAppointment = '$domain/api/v1/appointment/booking';
  static String checkinAppointment = '$domain/api/v1/appointment/check-in';
//
  //DutySchedule
  static String checkDutyScheduleTest = '$domain/api/v1/duty-schedule/get-many-by-doctor/';
  static String checkDutyScheduleGeneral = '$domain/api/v1/slot/search-duty-schedule-get-slot';
  static String checkDutyScheduleMedicalService = '$domain/api/v1/slot/search-slot-by-medical-service-date-clinic-id';
  static String checkDutyScheduleSpecialty =  '$domain/api/v1/slot/search-slot-for-demand-based';


  //Medical-service
  static String getVaccinationService = '$domain/api/v1/medical-service/get-vaccination-services';
  static String getExaminationService = '$domain/api/v1/medical-service/get-examination-services';
  static String getPsychologicalService = '$domain/api/v1/medical-service/get-psychological-services';


  //Address
  static String getProvinces = 'https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/province';
  static String getDistrict = 'https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/district';
  static String getWard = 'https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/ward?district_id=';
  
  //Medical-Records
  static String getMedicalRecordsByIdPatient = '$domain/api/v1/medical-record/get-all-medical-records-by-patient-profile-id';
}
