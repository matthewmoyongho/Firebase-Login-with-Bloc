import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

import 'app/presentation/app.dart';
import 'app_bloc_observer.dart';

Future<void> main() {
  return BlocOverrides.runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    final authRepository = AuthenticationRepository();
    await authRepository.user.first;
    runApp(App(authRepository: authRepository));
  }, blocObserver: AppBlocObserver());
}
