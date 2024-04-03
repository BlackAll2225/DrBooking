// To parse this JSON data, do
//
//     final dutySchedule = dutyScheduleFromJson(jsonString);

import 'dart:convert';

DutySchedule dutyScheduleFromJson(String str) => DutySchedule.fromJson(json.decode(str));

String dutyScheduleToJson(DutySchedule data) => json.encode(data.toJson());

class DutySchedule {
    String dutyScheduleId;
    DateTime startTime;
    DateTime endTime;
    int slotNumber;
    bool isAvaiable;
    int countAppointment;

    DutySchedule({
        required this.dutyScheduleId,
        required this.startTime,
        required this.endTime,
        required this.slotNumber,
        required this.isAvaiable,
        required this.countAppointment,
    });

    DutySchedule copyWith({
        String? dutyScheduleId,
        DateTime? startTime,
        DateTime? endTime,
        int? slotNumber,
        bool? isAvaiable,
        int? countAppointment,
    }) => 
        DutySchedule(
            dutyScheduleId: dutyScheduleId ?? this.dutyScheduleId,
            startTime: startTime ?? this.startTime,
            endTime: endTime ?? this.endTime,
            slotNumber: slotNumber ?? this.slotNumber,
            isAvaiable: isAvaiable ?? this.isAvaiable,
            countAppointment: countAppointment ?? this.countAppointment,
        );

    factory DutySchedule.fromJson(Map<String, dynamic> json) => DutySchedule(
        dutyScheduleId: json["dutyScheduleId"],
        startTime: DateTime.parse(json["startTime"]),
        endTime: DateTime.parse(json["endTime"]),
        slotNumber: json["slotNumber"],
        isAvaiable: json["isAvaiable"],
        countAppointment: json["countAppointment"],
    );
     factory DutySchedule.emtyObject() => DutySchedule(
        dutyScheduleId: '',
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        slotNumber: 1,
        isAvaiable: false,
        countAppointment: 1,
    );

    Map<String, dynamic> toJson() => {
        "dutyScheduleId": dutyScheduleId,
        "startTime": startTime.toIso8601String(),
        "endTime": endTime.toIso8601String(),
        "slotNumber": slotNumber,
        "isAvaiable": isAvaiable,
        "countAppointment": countAppointment,
    };
}
