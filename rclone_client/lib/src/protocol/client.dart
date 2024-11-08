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
import 'dart:async' as _i2;
import 'package:rclone_client/src/protocol/board_pixel.dart' as _i3;
import 'package:rclone_client/src/protocol/board.dart' as _i4;
import 'protocol.dart' as _i5;

/// {@category Endpoint}
class EndpointBoard extends _i1.EndpointRef {
  EndpointBoard(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'board';

  _i2.Future<void> writePixel(_i3.BoardPixel pixel) =>
      caller.callServerEndpoint<void>(
        'board',
        'writePixel',
        {'pixel': pixel},
      );

  /// Returns a stream of pixels. The first message will contain
  /// the full board. Sequential updates will contain a single updated pixel.
  _i2.Stream<_i4.Board> listenToBoard() =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i4.Board>, _i4.Board>(
        'board',
        'listenToBoard',
        {},
        {},
      );

  /// Returns a stream of pixels added by given user.
  /// The first message will contain the full board.
  /// Sequential updates will contain a single updated pixel.
  _i2.Stream<_i4.Board> listenToUserBoard(String username) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i4.Board>, _i4.Board>(
        'board',
        'listenToUserBoard',
        {'username': username},
        {},
      );

  _i2.Future<List<String>> getUsers() =>
      caller.callServerEndpoint<List<String>>(
        'board',
        'getUsers',
        {},
      );
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i5.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    board = EndpointBoard(this);
  }

  late final EndpointBoard board;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {'board': board};

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
