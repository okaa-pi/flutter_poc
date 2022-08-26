import 'package:json_annotation/json_annotation.dart';
import 'package:time_machine/time_machine.dart';
import 'package:time_machine/time_machine_text_patterns.dart';

class LocalDateConverter implements JsonConverter<LocalDate?, String?> {
  const LocalDateConverter();

  @override
  LocalDate? fromJson(String? json) => json == null ? null : LocalDatePattern.iso.parse(json).value;

  @override
  String? toJson(LocalDate? object) => object?.toString(LocalDatePattern.iso.patternText);
}

class OffsetTimeConverter implements JsonConverter<OffsetTime?, String?> {
  const OffsetTimeConverter();

  @override
  OffsetTime? fromJson(String? json) => json == null ? null : OffsetTimePattern.rfc3339.parse(json).value;

  @override
  String? toJson(OffsetTime? object) => object?.toString(OffsetTimePattern.rfc3339.patternText);
}

class OffsetDateTimeConverter implements JsonConverter<OffsetDateTime?, String?> {
  const OffsetDateTimeConverter();

  @override
  OffsetDateTime? fromJson(String? json) => json == null ? null : OffsetDateTimePattern.rfc3339.parse(json).value;

  @override
  String? toJson(OffsetDateTime? object) => object?.toString(OffsetDateTimePattern.rfc3339.patternText);
}