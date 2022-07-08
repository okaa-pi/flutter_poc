import 'package:time_machine/time_machine.dart';

class SuccessfulOperation {
  String? code;
  String? message;

  SuccessfulOperation({
    this.code,
    this.message
  });
}

class Error {
  String code;
  String? message;
  String? additionalIdentifier;

  Error({
    required this.code,
    this.message,
    this.additionalIdentifier
  });
}

class TranslatedField {
  String value;
  String? lang;

  TranslatedField({
    this.lang,
    required this.value
  });
}

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
}

class Person {
  String ssin;
  String fullname;

  Person({
    required this.ssin,
    required this.fullname
  });
}

class Practitioner {
  String nihdi;
  String fullname;

  Practitioner({
    required this.nihdi,
    required this.fullname
  });
}

class ValueAndUnit {
  double value;
  String? unit;

  ValueAndUnit({required this.value, unit});
}

class MedicationGalenicForm {
  String? code;
  List<TranslatedField>? text;

  MedicationGalenicForm({this.code, this.text});
}

class MedicationIngredient {
  List<TranslatedField>? name;
  List<TranslatedField>? leaflet;
  double? value;
  String? prefix;
  String? unit;

  MedicationIngredient({this.name, this.leaflet, this.value, this.prefix,
      this.unit});

}

class RegimenPosologyDaytime {
  OffsetTime? time;
  String? dayperiod;

  RegimenPosologyDaytime({this.time, this.dayperiod});
}

class RegimenPosologyDay {
  int? daynumber;
  LocalDate? date;

  RegimenPosologyDay({this.daynumber, this.date});
}

class RegimenPosology {
  ValueAndUnit? quantity;
  RegimenPosologyDaytime? daytime;
  RegimenPosologyDay? day;

  RegimenPosology({this.quantity, this.daytime, this.day});
}

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
}

class Pharmacy {
  List<TranslatedField> name;
  String nihdi;
  List<Address>? address;

  Pharmacy({
    required this.name,
    required this.nihdi,
    this.address});
}

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
}

