import 'dart:convert';

TripsModel tripsModelFromJson(Map<String, dynamic>? data) =>
    TripsModel.fromJson(data!);

String tripsModelToJson(TripsModel data) => json.encode(data.toJson());

class TripsModel {
  TripsModel({
    required this.driver,
    required this.riders,
  });

  final Driver driver;
  final List<Rider> riders;

  factory TripsModel.fromJson(Map<String, dynamic> json) => TripsModel(
        driver: Driver.fromJson(json["driver"]),
        riders: List<Rider>.from(json["riders"].map((x) => Rider.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "driver": driver.toJson(),
        "riders": List<dynamic>.from(riders.map((x) => x.toJson())),
      };
}

class Driver {
  Driver({
    required this.driveId,
    required this.driverUid,
    required this.status,
  });

  final String driveId;
  final String driverUid;
  final String status;

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        driveId: json["driveId"],
        driverUid: json["driverUid"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "driveId": driveId,
        "driverUid": driverUid,
        "status": status,
      };
}

class Rider {
  Rider({
    required this.riderUid,
    required this.rideId,
    required this.status,
  });

  final String riderUid;
  final String rideId;
  final String status;

  factory Rider.fromJson(Map<String, dynamic> json) => Rider(
        riderUid: json["riderUid"],
        rideId: json["rideId"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "riderUid": riderUid,
        "rideId": rideId,
        "status": status,
      };
}
