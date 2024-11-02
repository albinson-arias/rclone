import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rclone_client/rclone_client.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this._client) : super(UsersLoading()) {
    initialCall();
  }

  final Client _client;
  Timer? _refreshTimer;

  @override
  Future<void> close() async {
    _refreshTimer?.cancel();
    super.close();
  }

  void initialCall() async {
    await loadUsers();
    _refreshTimer = Timer.periodic(
      Duration(seconds: 5),
      (_) => loadUsers(),
    );
  }

  Future<void> loadUsers() async {
    debugPrint('loadingUser');
    try {
      final result = await _client.board.getUsers();

      emit(UsersLoaded(result));
    } catch (_) {
      emit(UsersLoading());
    }
  }
}
