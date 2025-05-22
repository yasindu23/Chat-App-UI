import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seacre_t/controllers/auth_controller.dart';
import 'package:seacre_t/models/user_model.dart';
import 'package:seacre_t/pages/page_controller.dart';
import 'package:seacre_t/pages/sign_in_page.dart';
import 'package:seacre_t/providers/auth_provider.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Secret App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1A1A1B),
      ),
      home: ProviderScope(child: CustomUserStateController()),
    ),
  );
}

class CustomUserStateController extends ConsumerStatefulWidget {
  const CustomUserStateController({super.key});

  @override
  ConsumerState<CustomUserStateController> createState() =>
      _CustomUserStateControllerState();
}

class _CustomUserStateControllerState
    extends ConsumerState<CustomUserStateController> {
  @override
  void initState() {
    checkIsActive(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = ref.watch(userProvider);

    if (user.id != null) {
      return const CustomPageController();
    } else {
      return const SignInPage();
    }
  }
}
