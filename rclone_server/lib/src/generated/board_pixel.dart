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

abstract class BoardPixel implements _i1.TableRow, _i1.ProtocolSerialization {
  BoardPixel._({
    this.id,
    required this.x,
    required this.y,
    required this.color,
    String? username,
  }) : username = username ?? '';

  factory BoardPixel({
    int? id,
    required double x,
    required double y,
    required String color,
    String? username,
  }) = _BoardPixelImpl;

  factory BoardPixel.fromJson(Map<String, dynamic> jsonSerialization) {
    return BoardPixel(
      id: jsonSerialization['id'] as int?,
      x: (jsonSerialization['x'] as num).toDouble(),
      y: (jsonSerialization['y'] as num).toDouble(),
      color: jsonSerialization['color'] as String,
      username: jsonSerialization['username'] as String,
    );
  }

  static final t = BoardPixelTable();

  static const db = BoardPixelRepository._();

  @override
  int? id;

  double x;

  double y;

  String color;

  String username;

  @override
  _i1.Table get table => t;

  BoardPixel copyWith({
    int? id,
    double? x,
    double? y,
    String? color,
    String? username,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'x': x,
      'y': y,
      'color': color,
      'username': username,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'x': x,
      'y': y,
      'color': color,
      'username': username,
    };
  }

  static BoardPixelInclude include() {
    return BoardPixelInclude._();
  }

  static BoardPixelIncludeList includeList({
    _i1.WhereExpressionBuilder<BoardPixelTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BoardPixelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BoardPixelTable>? orderByList,
    BoardPixelInclude? include,
  }) {
    return BoardPixelIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BoardPixel.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(BoardPixel.t),
      include: include,
    );
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
    String? username,
  }) : super._(
          id: id,
          x: x,
          y: y,
          color: color,
          username: username,
        );

  @override
  BoardPixel copyWith({
    Object? id = _Undefined,
    double? x,
    double? y,
    String? color,
    String? username,
  }) {
    return BoardPixel(
      id: id is int? ? id : this.id,
      x: x ?? this.x,
      y: y ?? this.y,
      color: color ?? this.color,
      username: username ?? this.username,
    );
  }
}

class BoardPixelTable extends _i1.Table {
  BoardPixelTable({super.tableRelation}) : super(tableName: 'board_pixels') {
    x = _i1.ColumnDouble(
      'x',
      this,
    );
    y = _i1.ColumnDouble(
      'y',
      this,
    );
    color = _i1.ColumnString(
      'color',
      this,
    );
    username = _i1.ColumnString(
      'username',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnDouble x;

  late final _i1.ColumnDouble y;

  late final _i1.ColumnString color;

  late final _i1.ColumnString username;

  @override
  List<_i1.Column> get columns => [
        id,
        x,
        y,
        color,
        username,
      ];
}

class BoardPixelInclude extends _i1.IncludeObject {
  BoardPixelInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => BoardPixel.t;
}

class BoardPixelIncludeList extends _i1.IncludeList {
  BoardPixelIncludeList._({
    _i1.WhereExpressionBuilder<BoardPixelTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BoardPixel.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => BoardPixel.t;
}

class BoardPixelRepository {
  const BoardPixelRepository._();

  Future<List<BoardPixel>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BoardPixelTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BoardPixelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BoardPixelTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<BoardPixel>(
      where: where?.call(BoardPixel.t),
      orderBy: orderBy?.call(BoardPixel.t),
      orderByList: orderByList?.call(BoardPixel.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<BoardPixel?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BoardPixelTable>? where,
    int? offset,
    _i1.OrderByBuilder<BoardPixelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BoardPixelTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<BoardPixel>(
      where: where?.call(BoardPixel.t),
      orderBy: orderBy?.call(BoardPixel.t),
      orderByList: orderByList?.call(BoardPixel.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<BoardPixel?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<BoardPixel>(
      id,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<BoardPixel>> insert(
    _i1.Session session,
    List<BoardPixel> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<BoardPixel>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<BoardPixel> insertRow(
    _i1.Session session,
    BoardPixel row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<BoardPixel>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<BoardPixel>> update(
    _i1.Session session,
    List<BoardPixel> rows, {
    _i1.ColumnSelections<BoardPixelTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<BoardPixel>(
      rows,
      columns: columns?.call(BoardPixel.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<BoardPixel> updateRow(
    _i1.Session session,
    BoardPixel row, {
    _i1.ColumnSelections<BoardPixelTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<BoardPixel>(
      row,
      columns: columns?.call(BoardPixel.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<BoardPixel>> delete(
    _i1.Session session,
    List<BoardPixel> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<BoardPixel>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<BoardPixel> deleteRow(
    _i1.Session session,
    BoardPixel row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BoardPixel>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<BoardPixel>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BoardPixelTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<BoardPixel>(
      where: where(BoardPixel.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BoardPixelTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<BoardPixel>(
      where: where?.call(BoardPixel.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}
