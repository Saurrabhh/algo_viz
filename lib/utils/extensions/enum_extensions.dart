import 'package:algo_viz/utils/extensions/extensions.dart';
import 'package:recase/recase.dart';

extension EnumIterableX<E extends Enum> on Iterable<E> {
  E? fromString(String? enumString) {
    return firstWhereOrNull(
      (element) => element.name == enumString?.camelCase,
    );
  }
}
