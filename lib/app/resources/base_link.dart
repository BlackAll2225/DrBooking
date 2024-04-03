class BaseLink {
  static const domain = 'https://be-graduation-thesis.azurewebsites.net';

  //Auth
  static const login = '$domain/api/v1/authention/client-sign-in';
  static const register = '$domain/api/v1/authention/client-register';
  static const getInformation = '$domain/api/v1/client/get-single-by-id';

  static String getClinic = '$domain/api/v1/clinic/get-many-active/';
  static String getProfiles = '$domain/api/v1/patient-profile/get-many-by-client-id';
  static String getProfilesById = '$domain/api/v1/patient-profile/get-single-by-id';

  static String getSpecials = '$domain/api/v1/medical-specialty/get-many-by-clinic-id/';

  static String getDoctorsByClinic = '$domain/api/v1/employee/doctor-by-clinic/';
  static String getDoctorById = '$domain/api/v1/employee/doctor/';

  static String getClientsByIdAccount = '$domain/api/v1/patient-profile/get-many-by-client-id';

  static String dutySchedule = '$domain/api/v1/duty-schedule/get-many-by-doctor/';

  static String newPatient = '$domain/api/v1/patient-profile/add';
  static String updatePatient = '$domain/api/v1/patient-profile/update';

//Appointment
  static String getAppointments= '';
  static String getAppointmentById = '$domain/api/v1/appointment/get-single-by-id';

  //DutySchedule
  static String checkDutyScheduleGeneral = '$domain/api/v1/slot/check-duty-schedule-get-slot';


  //Medical-service
  static String getVaccinationService = '$domain/api/v1/medical-service/get-vaccination-services';
  static String getExaminationService = '$domain/api/v1/medical-service/get-examination-services';
  static String getPsychologicalService = '$domain/api/v1/medical-service/get-psychological-services';
  

}
