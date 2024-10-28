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
import '../endpoints/board_endpoint.dart' as _i2;
import 'package:rclone_server/src/generated/board_pixel.dart' as _i3;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'board': _i2.BoardEndpoint()
        ..initialize(
          server,
          'board',
          null,
        )
    };
    connectors['board'] = _i1.EndpointConnector(
      name: 'board',
      endpoint: endpoints['board']!,
      methodConnectors: {
        'writePixel': _i1.MethodConnector(
          name: 'writePixel',
          params: {
            'pixel': _i1.ParameterDescription(
              name: 'pixel',
              type: _i1.getType<_i3.BoardPixel>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['board'] as _i2.BoardEndpoint).writePixel(
            session,
            params['pixel'],
          ),
        ),
        'getUsers': _i1.MethodConnector(
          name: 'getUsers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['board'] as _i2.BoardEndpoint).getUsers(session),
        ),
        'listenToBoard': _i1.MethodStreamConnector(
          name: 'listenToBoard',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['board'] as _i2.BoardEndpoint).listenToBoard(session),
        ),
        'listenToUserBoard': _i1.MethodStreamConnector(
          name: 'listenToUserBoard',
          params: {
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['board'] as _i2.BoardEndpoint).listenToUserBoard(
            session,
            params['username'],
          ),
        ),
      },
    );
  }
}
