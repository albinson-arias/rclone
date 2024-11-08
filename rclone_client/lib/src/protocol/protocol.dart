/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'board.dart' as _i2;
import 'board_pixel.dart' as _i3;
import 'protocol.dart' as _i4;
export 'board.dart';
export 'board_pixel.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Board) {
      return _i2.Board.fromJson(data) as T;
    }
    if (t == _i3.BoardPixel) {
      return _i3.BoardPixel.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Board?>()) {
      return (data != null ? _i2.Board.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.BoardPixel?>()) {
      return (data != null ? _i3.BoardPixel.fromJson(data) : null) as T;
    }
    if (t == List<_i4.BoardPixel>) {
      return (data as List).map((e) => deserialize<_i4.BoardPixel>(e)).toList()
          as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Board) {
      return 'Board';
    }
    if (data is _i3.BoardPixel) {
      return 'BoardPixel';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Board') {
      return deserialize<_i2.Board>(data['data']);
    }
    if (data['className'] == 'BoardPixel') {
      return deserialize<_i3.BoardPixel>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
