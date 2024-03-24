import 'package:drbooking/app/model/clinic.dart';
import 'package:drbooking/app/model/doctor/doctor.dart';
import 'package:drbooking/app/model/doctor/specicalty.dart';
import 'package:drbooking/app/model/profile.dart';
import 'package:drbooking/app/model/service/button_service.dart';
import 'package:drbooking/app/model/slot.dart';
import 'package:drbooking/app/model/special.dart';

class RequestParamBooking {
    Clinic? clinic;
    Profile? profile;
    Doctor? doctor;
    Slot? slot;
    SpecialModule? special;
    String? description;
    ButtonService? dataButton;
    Specialty? specialty;
    RequestParamBooking({
      this.clinic,
      this.profile,
      this.doctor,
      this.special,
      this.description,
      this.dataButton,
      this.specialty,
      this.slot}
    );
   
}