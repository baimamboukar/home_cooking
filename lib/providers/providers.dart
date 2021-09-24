import 'package:flutter_riverpod/flutter_riverpod.dart';

export 'user_provider.dart';

final navigationIndexProvider = StateProvider<int>((ref) => 0);
