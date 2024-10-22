/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class BoardPixel implements _i1.SerializableModel {
  BoardPixel._({
    this.id,
    required this.x,
    required this.y,
    required this.color,
  });

  factory BoardPixel({
    int? id,
    required double x,
    required double y,
    required String color,
  }) = _BoardPixelImpl;

  factory BoardPixel.fromJson(Map<String, dynamic> jsonSerialization) {
    return BoardPixel(
      id: jsonSerialization['id'] as int?,
      x: (jsonSerialization['x'] as num).toDouble(),
      y: (jsonSerialization['y'] as num).toDouble(),
      color: jsonSerialization['color'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  double x;

  double y;

  String color;

  BoardPixel copyWith({
    int? id,
    double? x,
    double? y,
    String? color,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'x': x,
      'y': y,
      'color': color,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BoardPixelImpl extends BoardPixel {
  _BoardPixelImpl({
    int? id,
    required double x,
    required double y,
    required String color,
  }) : super._(
          id: id,
          x: x,
          y: y,
          color: color,
        );

  @override
  BoardPixel copyWith({
    Object? id = _Undefined,
    double? x,
    double? y,
    String? color,
  }) {
    return BoardPixel(
      id: id is int? ? id : this.id,
      x: x ?? this.x,
      y: y ?? this.y,
      color: color ?? this.color,
    );
  }
}
