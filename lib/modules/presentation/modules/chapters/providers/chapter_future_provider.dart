import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/chapters/chapter.dart';
import '../../../../injection_container.dart';

final chapterListProvider = FutureProvider<List<Chapter>>(
    (ref) => ref.read(chapterRepositoryProvider).getChapters());