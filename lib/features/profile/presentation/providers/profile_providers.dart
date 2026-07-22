import 'package:flutter_riverpod/legacy.dart';

import '../../domain/profile_info.dart';

/// Current user profile, seeded from [ProfileRepository.load] at startup
/// (see `main.dart`). Updated in-place by the Profile screen after saving.
final profileProvider = StateProvider<ProfileInfo>((ref) => const ProfileInfo());
