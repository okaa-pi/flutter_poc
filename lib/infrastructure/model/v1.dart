import 'package:json_annotation/json_annotation.dart';
import 'package:time_machine/time_machine.dart';
import 'package:vidis/infrastructure/model/converters.dart';

part 'v1.g.dart';

@JsonSerializable()
class SuccessfulOperation {
  String? code;
  String? message;

  SuccessfulOperation({
    this.code,
    this.message
  });

  factory SuccessfulOperation.fromJson(Map<String, dynamic> json) =>
      _$SuccessfulOperationFromJson(json);

}

@JsonSerializable()
class Error {
  String code;
  String? message;
  String? additionalIdentifier;

  Error({
    required this.code,
    this.message,
    this.additionalIdentifier
  });

  factory Error.fromJson(Map<String, dynamic> json) =>
      _$ErrorFromJson(json);
}

@JsonSerializable()
class TranslatedField {
  String value;
  String? lang;

  TranslatedField({
    this.lang,
    required this.value
  });

  factory TranslatedField.fromJson(Map<String, dynamic> json) =>
      _$TranslatedFieldFromJson(json);
}

@JsonSerializable()
class Address {
  String? lang;
  String? street;
  String? houseNumber;
  String? zipCode;
  String city;
  String? country;

  Address({
    this.lang,
    this.street,
    this.houseNumber,
    this.zipCode,
    required this.city,
    this.country
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@JsonSerializable()
class Person {
  String ssin;
  String fullname;

  Person({
    required this.ssin,
    required this.fullname
  });

  factory Person.fromJson(Map<String, dynamic> json) =>
      _$PersonFromJson(json);
}

@JsonSerializable()
class Practitioner {
  String nihdi;
  String fullname;

  Practitioner({
    required this.nihdi,
    required this.fullname
  });

  factory Practitioner.fromJson(Map<String, dynamic> json) =>
      _$PractitionerFromJson(json);
}

@JsonSerializable()
class ValueAndUnit {
  double value;
  String? unit;

  ValueAndUnit({required this.value, unit});

  factory ValueAndUnit.fromJson(Map<String, dynamic> json) =>
      _$ValueAndUnitFromJson(json);
}

@JsonSerializable()
class MedicationGalenicForm {
  String? code;
  List<TranslatedField>? text;

  MedicationGalenicForm({this.code, this.text});

  factory MedicationGalenicForm.fromJson(Map<String, dynamic> json) =>
      _$MedicationGalenicFormFromJson(json);
}

@JsonSerializable()
class MedicationIngredient {
  List<TranslatedField>? name;
  List<TranslatedField>? leaflet;
  double? value;
  String? prefix;
  String? unit;

  MedicationIngredient({this.name, this.leaflet, this.value, this.prefix,
      this.unit});

  factory MedicationIngredient.fromJson(Map<String, dynamic> json) =>
      _$MedicationIngredientFromJson(json);

}

@JsonSerializable()
@OffsetTimeConverter()
class RegimenPosologyDaytime {

  OffsetTime? time;
  String? dayperiod;

  RegimenPosologyDaytime({this.time, this.dayperiod});

  factory RegimenPosologyDaytime.fromJson(Map<String, dynamic> json) =>
      _$RegimenPosologyDaytimeFromJson(json);
}

@JsonSerializable()
@LocalDateConverter()
class RegimenPosologyDay {
  int? daynumber;
  LocalDate? date;

  RegimenPosologyDay({this.daynumber, this.date});

  factory RegimenPosologyDay.fromJson(Map<String, dynamic> json) =>
      _$RegimenPosologyDayFromJson(json);
}

@JsonSerializable()
class RegimenPosology {
  ValueAndUnit? quantity;
  RegimenPosologyDaytime? daytime;
  RegimenPosologyDay? day;

  RegimenPosology({this.quantity, this.daytime, this.day});
  
  factory RegimenPosology.fromJson(Map<String, dynamic> json) =>
      _$RegimenPosologyFromJson(json);
}

@JsonSerializable()
@OffsetDateTimeConverter()
class Medication {
  List<TranslatedField>? name;
  ValueAndUnit? quantity;
  bool compound;
  ValueAndUnit? size;
  MedicationGalenicForm? galenicForm;
  List<MedicationIngredient>? ingredients;
  OffsetDateTime? treatmentStartDate;
  OffsetDateTime? treatmentEndDate;
  List<TranslatedField>? posology;
  List<RegimenPosology>? regimenPosology;
  ValueAndUnit? duration;
  List<TranslatedField>? instructions;
  List<TranslatedField>? leaflet;

  Medication({
      this.name,
      this.quantity,
      required this.compound,
      this.size,
      this.galenicForm,
      this.ingredients,
      this.treatmentStartDate,
      this.treatmentEndDate,
      this.posology,
      this.regimenPosology,
      this.duration,
      this.instructions,
      this.leaflet
  });

  factory Medication.fromJson(Map<String, dynamic> json) =>
      _$MedicationFromJson(json);
}

@JsonSerializable()
class Pharmacy {
  List<TranslatedField> name;
  String nihdi;
  List<Address>? address;

  Pharmacy({
    required this.name,
    required this.nihdi,
    this.address});

  factory Pharmacy.fromJson(Map<String, dynamic> json) =>
      _$PharmacyFromJson(json);
}

@JsonSerializable()
@OffsetDateTimeConverter()
class Prescription {
  String ridCode;
  Error? error;
  Person? patient;
  Practitioner? practitioner;
  List<Medication>? medications;
  OffsetDateTime? creationDate;
  OffsetDateTime? deliveryDate;
  OffsetDateTime? validityDate;
  String? visibility;
  Pharmacy? visibilityPharmacy;
  Pharmacy? reservationPharmacy;
  OffsetDateTime? reservationDate;

  Prescription({
      required this.ridCode,
      this.error,
      this.patient,
      this.practitioner,
      this.medications,
      this.creationDate,
      this.deliveryDate,
      this.validityDate,
      this.visibility,
      this.visibilityPharmacy,
      this.reservationPharmacy,
      this.reservationDate
  });

  factory Prescription.fromJson(Map<String, dynamic> json) =>
    _$PrescriptionFromJson(json);
}
