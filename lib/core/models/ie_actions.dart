
import 'dart:convert';

class IEActions {
  /// otherNames: write
  final bool create;

  /// otherNames: view
  final bool read;
  final bool update;
  final bool delete;
  final bool download;
  IEActions({
    required this.create,
    required this.read,
    required this.update,
    required this.delete,
    required this.download,
  });

  IEActions copyWith({
    bool? create,
    bool? read,
    bool? update,
    bool? delete,
    bool? download,
  }) {
    return IEActions(
      create: create ?? this.create,
      read: read ?? this.read,
      update: update ?? this.update,
      delete: delete ?? this.delete,
      download: download ?? this.download,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'create': create,
      'read': read,
      'update': update,
      'delete': delete,
      'download': download,
    };
  }

  factory IEActions.fromMap(Map<String, dynamic> map) {
    return IEActions(
      create: map['create'] ?? false,
      read: map['read'] ?? false,
      update: map['update'] ?? false,
      delete: map['delete'] ?? false,
      download: map['download'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory IEActions.fromJson(String source) => IEActions.fromMap(json.decode(source));

  @override
  String toString() {
    return 'IEPermission(create: $create, read: $read, update: $update, delete: $delete, download: $download)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IEActions &&
        other.create == create &&
        other.read == read &&
        other.update == update &&
        other.delete == delete &&
        other.download == download;
  }

  @override
  int get hashCode {
    return create.hashCode ^ read.hashCode ^ update.hashCode ^ delete.hashCode ^ download.hashCode;
  }
}
