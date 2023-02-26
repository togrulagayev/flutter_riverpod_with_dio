import '../service/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleProvider = Provider<String>((ref) => 'Title');
final apiProvider = Provider<ApiService>((ref) => ApiService());
final usersProvider = FutureProvider((ref) => ApiService().getAllUser());
