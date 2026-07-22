
class ProfileInfo {
  final String name;
  final String? photoPath;

  const ProfileInfo({this.name = '', this.photoPath});

  bool get isSet => name.trim().isNotEmpty || photoPath != null;

  ProfileInfo copyWith({String? name, String? photoPath, bool clearPhoto = false}) {
    return ProfileInfo(
      name: name ?? this.name,
      photoPath: clearPhoto ? null : (photoPath ?? this.photoPath),
    );
  }
}
