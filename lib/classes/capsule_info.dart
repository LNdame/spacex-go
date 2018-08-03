import 'package:cherry/classes/vehicle.dart';
import 'package:intl/intl.dart';

// FILE NOT IN USE

class CapsuleInfo extends Vehicle {
  final int crew;
  final num launchMass;
  final num returnMass;
  final num height;
  final num diameter;

  CapsuleInfo(
      {id,
      name,
      type,
      isActive,
      this.crew,
      this.launchMass,
      this.returnMass,
      this.height,
      this.diameter})
      : super(id, name, type, isActive);

  factory CapsuleInfo.fromJson(Map<String, dynamic> json) {
    return CapsuleInfo(
        id: json['id'],
        name: json['name'],
        type: json['type'],
        isActive: json['active'],
        crew: json['crew_capacity'],
        launchMass: json['launch_payload_mass']['kg'],
        returnMass: json['return_payload_mass']['kg'],
        height: json['height_w_trunk']['meters'],
        diameter: json['diameter']['meters']);
  }

  String get status => isActive ? 'Capsule active' : 'Capsule not active';

  String get getCrew => crew == 0 ? 'No people' : '$crew people';

  String get getLaunchMass =>
      '${NumberFormat.decimalPattern().format(launchMass)} kg';

  String get getReturnMass =>
      '${NumberFormat.decimalPattern().format(returnMass)} kg';

  String get getHeight => '${NumberFormat.decimalPattern().format(height)} m';

  String get getDiameter =>
      '${NumberFormat.decimalPattern().format(diameter)} m';

  String get getDescription =>
      crew > 0 ? 'Cargo & crew capsule' : 'Only cargo capsule';
}