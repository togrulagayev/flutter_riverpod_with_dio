import 'package:dio/dio.dart';
import '../model/user_model.dart';

class ApiService {
  Future<List<UserModel>> getAllUser() async {
    try {
      var response = await Dio().get('https://fakestoreapi.com/users');
      var users = (response.data as List);
      List<UserModel> allUsers =
          users.map((user) => UserModel.fromJson(user)).toList();
      if (response.statusCode == 200) {
        return allUsers;
      }
      return [];
    } on DioError catch (e) {
      return Future.error(e.message.toString());
    }
  }
}
