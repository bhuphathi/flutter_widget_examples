enum Collections { users }

enum FieldName { photoURL }

class FirebaseConstants {
  static final usersCollection = Collections.users.name.toString();
  static final usersPhotoURLField = FieldName.photoURL.name.toString();
  static const userPhotoStoragePath = 'user_photos';
}
