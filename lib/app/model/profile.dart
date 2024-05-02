
// // To parse this JSON data, do
// //
// //     final profile = profileFromJson(jsonString);

// import 'dart:convert';

// Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

// String profileToJson(Profile data) => json.encode(data.toJson());

// class Profile {
//     String? id;
//     String? email;
//     String? phoneNumber;
//     String? fullname;
//     DateTime? dateOfBirth;
//     int? height;
//     int? weight;
//     String? avatarUrl;
//     int? biologicalGender;
//     String? patientCode;
//     String? healthInsuranceCode;
//     DateTime? expiredDate;
//     String? hiIssuedPlace;
//     String? idCode;
//     DateTime? idIssuedDate;
//     String? idIssuedPlace;
//     String? nameAddress;

//     Profile({
//         this.id,
//         this.email,
//         this.phoneNumber,
//         this.fullname,
//         this.dateOfBirth,
//         this.height,
//         this.weight,
//         this.avatarUrl,
//         this.biologicalGender,
//         this.patientCode,
//         this.healthInsuranceCode,
//         this.expiredDate,
//         this.hiIssuedPlace,
//         this.idCode,
//         this.idIssuedDate,
//         this.idIssuedPlace,
//         this.nameAddress,
//     });

//     Profile copyWith({
//         String? id,
//         String? email,
//         String? phoneNumber,
//         String? fullname,
//         DateTime? dateOfBirth,
//         int? height,
//         int? weight,
//         String? avatarUrl,
//         int? biologicalGender,
//         String? patientCode,
//         String? healthInsuranceCode,
//         DateTime? expiredDate,
//         String? hiIssuedPlace,
//         String? idCode,
//         DateTime? idIssuedDate,
//         String? idIssuedPlace,
//         String? nameAddress,
//     }) => 
//         Profile(
//             id: id ?? this.id,
//             email: email ?? this.email,
//             phoneNumber: phoneNumber ?? this.phoneNumber,
//             fullname: fullname ?? this.fullname,
//             dateOfBirth: dateOfBirth ?? this.dateOfBirth,
//             height: height ?? this.height,
//             weight: weight ?? this.weight,
//             avatarUrl: avatarUrl ?? this.avatarUrl,
//             biologicalGender: biologicalGender ?? this.biologicalGender,
//             patientCode: patientCode ?? this.patientCode,
//             healthInsuranceCode: healthInsuranceCode ?? this.healthInsuranceCode,
//             expiredDate: expiredDate ?? this.expiredDate,
//             hiIssuedPlace: hiIssuedPlace ?? this.hiIssuedPlace,
//             idCode: idCode ?? this.idCode,
//             idIssuedDate: idIssuedDate ?? this.idIssuedDate,
//             idIssuedPlace: idIssuedPlace ?? this.idIssuedPlace,
//             nameAddress: nameAddress ?? this.nameAddress,
//         );

//     factory Profile.fromJson(Map<String, dynamic> json) => Profile(
//         id: json["id"],
//         email: json["email"],
//         phoneNumber: json["phoneNumber"],
//         fullname: json["fullname"],
//         dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
//         height: json["height"],
//         weight: json["weight"],
//         avatarUrl: json["avatarUrl"],
//         biologicalGender: json["biologicalGender"],
//         patientCode: json["patientCode"],
//         healthInsuranceCode: json["healthInsuranceCode"],
//         expiredDate: json["expiredDate"] == null ? null : DateTime.parse(json["expiredDate"]),
//         hiIssuedPlace: json["hiIssuedPlace"],
//         idCode: json["idCode"],
//         idIssuedDate: json["idIssuedDate"] == null ? null : DateTime.parse(json["idIssuedDate"]),
//         idIssuedPlace: json["idIssuedPlace"],
//         nameAddress: json["nameAddress"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "email": email,
//         "phoneNumber": phoneNumber,
//         "fullname": fullname,
//         "dateOfBirth": dateOfBirth?.toIso8601String(),
//         "height": height,
//         "weight": weight,
//         "avatarUrl": avatarUrl,
//         "biologicalGender": biologicalGender,
//         "patientCode": patientCode,
//         "healthInsuranceCode": healthInsuranceCode,
//         "expiredDate": expiredDate?.toIso8601String(),
//         "hiIssuedPlace": hiIssuedPlace,
//         "idCode": idCode,
//         "idIssuedDate": idIssuedDate?.toIso8601String(),
//         "idIssuedPlace": idIssuedPlace,
//         "nameAddress": nameAddress,
//     };
// }


// class Gender {
//   int id;
//   String name;
//   Gender({required this.id,required this.name});
// }
//  List<Gender> listGender = [
//   Gender(id: 0, name: 'Nam'),
//   Gender(id: 1, name: 'Nữ'),
//   Gender(id: 2, name: 'Khác'),
// ];