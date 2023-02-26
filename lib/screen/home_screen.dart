import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_model.dart';
import '../provider/all_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersData = ref.watch(usersProvider.future);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(ref.read(titleProvider))),
      ),
      body: FutureBuilder(
        future: usersData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<UserModel> users = snapshot.data;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(users[index].username),
                  subtitle: Text(users[index].email),
                  leading: CircleAvatar(
                    child: Text(users[index].id.toString()),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
