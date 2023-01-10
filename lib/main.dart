import 'package:bloc/bloc.dart';
import 'package:clean_architecture/mo_app.dart';
import 'package:firebase_core/firebase_core.dart';

// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'app/common/utils/app_bloc_observer.dart';
import 'app/services/locator_service.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  GetItLocator.init();
  if (kIsWeb || defaultTargetPlatform == TargetPlatform.macOS) {
    // initialiaze the facebook javascript SDK
    await FacebookAuth.instance.webAndDesktopInitialize(
      appId: "567886921872821",
      cookie: true,
      xfbml: true,
      version: "v15.0",
    );
  }
  await Firebase.initializeApp();
  runApp(const MoApp());
}
