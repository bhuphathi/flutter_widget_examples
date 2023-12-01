import 'package:flutter_widget_examples/core/constants/firebase_constants.dart';
import 'package:flutter_widget_examples/controller/providers/userinfo_model_provider.dart';
import 'package:flutter_widget_examples/controller/role_controller.dart';

import 'package:flutter_widget_examples/controller/models/userinfo_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final permissionControllerProvider = Provider((ref) {
  return PermissionController(user: ref.watch(authUserProvider));
});

enum Permissions {
  create,
  read,
  readOwnDocs,
  update,
  delete,
}

final collectionRules = {
  Collections.users: {
    Role.admin: [Permissions.read, Permissions.create, Permissions.update, Permissions.delete],
    Role.systemadmin: [Permissions.read, Permissions.create, Permissions.update, Permissions.delete],
    Role.manager: [Permissions.read, Permissions.create, Permissions.update],
    Role.supervisor: [Permissions.readOwnDocs, Permissions.update],
  },
};

final fieldRules = {
  FieldName.photoURL: {
    Role.admin: [Permissions.read, Permissions.create, Permissions.update, Permissions.delete],
    Role.manager: [Permissions.read, Permissions.create, Permissions.update],
    Role.supervisor: [Permissions.read, Permissions.create, Permissions.update],
  }
};

class PermissionController {
  final UserInfoModel _user;
  const PermissionController({
    required UserInfoModel user,
  }) : _user = user;

  bool hasCreateAccess(Collections collections) => _hasAccess(collections, Permissions.create);
  bool hasReadAccess(Collections collections) => _hasAccess(collections, Permissions.read);
  bool hasOwnDocReadAccess(Collections collections) => _hasAccess(collections, Permissions.readOwnDocs);
  bool hasUpdateAccess(Collections collections) => _hasAccess(collections, Permissions.update);
  bool hasDeleteAccess(Collections collections) => _hasAccess(collections, Permissions.delete);
  bool hasAccess(Collections collections, {Permissions checkPermission = Permissions.read}) =>
      _hasAccess(collections, checkPermission);

  bool _hasAccess(Collections collections, Permissions checkPermission) {
    bool hasAccess = false;
    final permissions = collectionRules[collections]?[_user.role];

    if (permissions != null) {
      for (var permission in permissions) {
        if (permission == checkPermission) {
          hasAccess = true;
          break;
        }
      }
    }
    return hasAccess;
  }
}
