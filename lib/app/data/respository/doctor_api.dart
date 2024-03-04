import 'package:drbooking/app/model/doctor/doctor_preview.dart';

abstract class DoctorApi {
  Future<List<DoctorPreview>> getListDoctorRandom();
}