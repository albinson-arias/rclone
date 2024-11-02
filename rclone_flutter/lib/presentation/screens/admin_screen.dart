import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rclone_flutter/core/routing/app_routes.dart';
import 'package:rclone_flutter/presentation/cubits/users_cubit/users_cubit.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          return switch (state) {
            UsersLoading() => Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            UsersLoaded(:final users) => ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  title: Text(users[index]),
                  trailing: Icon(Icons.chevron_right_rounded),
                  onTap: () => context.pushNamed(
                    AppRoutes.userBoard.name,
                    pathParameters: {
                      'id': users[index],
                    },
                  ),
                ),
                itemCount: users.length,
              ),
          };
        },
      ),
    );
  }
}
