import 'package:flutter_widget_examples/controller/providers/userinfo_model_provider.dart';
import 'package:flutter_widget_examples/controller/models/userinfo_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final roleControllerProvider = Provider((ref) {
  return RoleController(user: ref.watch(authUserProvider));
});

enum Role {
  anonymous,
  systemadmin,
  admin,
  manager,
  supervisor,
}

// enum Role {
//   anonymous([Permissions.read]),
//   systemadmin([Permissions.create, Permissions.read, Permissions.update, Permissions.delete]),
//   admin([Permissions.create, Permissions.read, Permissions.update, Permissions.delete]),
//   manager([Permissions.create, Permissions.read, Permissions.update]),
//   supervisor([Permissions.create, Permissions.read]);

//   final List<Permissions> permissions;
//   const Role(this.permissions);
// }

class RoleController {
  final UserInfoModel _user;
  const RoleController({
    required UserInfoModel user,
  }) : _user = user;

  bool isAdmin() => _user.role == Role.admin;
  bool isAnonymous() => _user.role == Role.anonymous;
  bool isManager() => _user.role == Role.manager;
  bool isSystemAdmin() => _user.role == Role.systemadmin;
  bool isSupervisor() => _user.role == Role.supervisor;
}
