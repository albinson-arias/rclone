/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: invalid_use_of_visible_for_testing_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Pixel implements _i1.TableRow, _i1.ProtocolSerialization {
  Pixel._({
    this.id,
    required this.x,
    required this.y,
    required this.color,
  });

  factory Pixel({
    int? id,
    required int x,
    required int y,
    required String color,
  }) = _PixelImpl;

  factory Pixel.fromJson(Map<String, dynamic> jsonSerialization) {
    return Pixel(
      id: jsonSerialization['id'] as int?,
      x: jsonSerialization['x'] as int,
      y: jsonSerialization['y'] as int,
      color: jsonSerialization['color'] as String,
    );
  }

  static final t = PixelTable();

  static const db = PixelRepository._();

  @override
  int? id;

  int x;

  int y;

  String color;

  @override
  _i1.Table get table => t;

  Pixel copyWith({
    int? id,
    int? x,
    int? y,
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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'x': x,
      'y': y,
      'color': color,
    };
  }

  static PixelInclude include() {
    return PixelInclude._();
  }

  static PixelIncludeList includeList({
    _i1.WhereExpressionBuilder<PixelTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PixelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PixelTable>? orderByList,
    PixelInclude? include,
  }) {
    return PixelIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Pixel.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Pixel.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PixelImpl extends Pixel {
  _PixelImpl({
    int? id,
    required int x,
    required int y,
    required String color,
  }) : super._(
          id: id,
          x: x,
          y: y,
          color: color,
        );

  @override
  Pixel copyWith({
    Object? id = _Undefined,
    int? x,
    int? y,
    String? color,
  }) {
    return Pixel(
      id: id is int? ? id : this.id,
      x: x ?? this.x,
      y: y ?? this.y,
      color: color ?? this.color,
    );
  }
}

class PixelTable extends _i1.Table {
  PixelTable({super.tableRelation}) : super(tableName: 'pixels') {
    x = _i1.ColumnInt(
      'x',
      this,
    );
    y = _i1.ColumnInt(
      'y',
      this,
    );
    color = _i1.ColumnString(
      'color',
      this,
    );
  }

  late final _i1.ColumnInt x;

  late final _i1.ColumnInt y;

  late final _i1.ColumnString color;

  @override
  List<_i1.Column> get columns => [
        id,
        x,
        y,
        color,
      ];
}

class PixelInclude extends _i1.IncludeObject {
  PixelInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Pixel.t;
}

class PixelIncludeList extends _i1.IncludeList {
  PixelIncludeList._({
    _i1.WhereExpressionBuilder<PixelTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Pixel.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Pixel.t;
}

class PixelRepository {
  const PixelRepository._();

  Future<List<Pixel>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PixelTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PixelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PixelTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Pixel>(
      where: where?.call(Pixel.t),
      orderBy: orderBy?.call(Pixel.t),
      orderByList: orderByList?.call(Pixel.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Pixel?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PixelTable>? where,
    int? offset,
    _i1.OrderByBuilder<PixelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PixelTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Pixel>(
      where: where?.call(Pixel.t),
      orderBy: orderBy?.call(Pixel.t),
      orderByList: orderByList?.call(Pixel.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Pixel?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Pixel>(
      id,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Pixel>> insert(
    _i1.Session session,
    List<Pixel> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Pixel>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Pixel> insertRow(
    _i1.Session session,
    Pixel row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Pixel>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Pixel>> update(
    _i1.Session session,
    List<Pixel> rows, {
    _i1.ColumnSelections<PixelTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Pixel>(
      rows,
      columns: columns?.call(Pixel.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Pixel> updateRow(
    _i1.Session session,
    Pixel row, {
    _i1.ColumnSelections<PixelTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Pixel>(
      row,
      columns: columns?.call(Pixel.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Pixel>> delete(
    _i1.Session session,
    List<Pixel> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Pixel>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Pixel> deleteRow(
    _i1.Session session,
    Pixel row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Pixel>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Pixel>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PixelTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Pixel>(
      where: where(Pixel.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PixelTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Pixel>(
      where: where?.call(Pixel.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}
