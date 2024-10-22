/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

abstract class Board
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  Board._({required this.pixels});

  factory Board({required List<_i2.BoardPixel> pixels}) = _BoardImpl;

  factory Board.fromJson(Map<String, dynamic> jsonSerialization) {
    return Board(
        pixels: (jsonSerialization['pixels'] as List)
            .map((e) => _i2.BoardPixel.fromJson((e as Map<String, dynamic>)))
            .toList());
  }

  List<_i2.BoardPixel> pixels;

  Board copyWith({List<_i2.BoardPixel>? pixels});
  @override
  Map<String, dynamic> toJson() {
    return {'pixels': pixels.toJson(valueToJson: (v) => v.toJson())};
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {'pixels': pixels.toJson(valueToJson: (v) => v.toJsonForProtocol())};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _BoardImpl extends Board {
  _BoardImpl({required List<_i2.BoardPixel> pixels}) : super._(pixels: pixels);

  @override
  Board copyWith({List<_i2.BoardPixel>? pixels}) {
    return Board(
        pixels: pixels ?? this.pixels.map((e0) => e0.copyWith()).toList());
  }
}
