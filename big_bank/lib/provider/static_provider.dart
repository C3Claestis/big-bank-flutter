import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberProvider = StateProvider<String>((ref) => '');
final codeProvider = StateProvider<String>((ref) => '');
final password1Provider = StateProvider<String>((ref) => '');
final password2Provider = StateProvider<String>((ref) => '');
final showPasswordProvider = StateProvider<bool>((ref) => false);
