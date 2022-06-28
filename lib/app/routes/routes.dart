import 'package:flutter/widgets.dart';

import '../../login/presentation/login.dart';
import '../bloc/app_bloc.dart';
import '../presentation/screens/home.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
