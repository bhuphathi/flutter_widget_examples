import 'package:flutter_widget_examples/core/exception/custom_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final errorProvider = StateProvider<CustomException?>((ref) {
  return null;
});
