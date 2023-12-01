import 'package:flutter_widget_examples/controller/models/userinfo_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authUserProvider = StateProvider<UserInfoModel>((ref) {
  return UserInfoModel.init();
});
