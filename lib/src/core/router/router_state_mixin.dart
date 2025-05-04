import 'package:portfolio/src/core/router/routes.dart';
import 'package:portfolio/src/feature/not_found/widget/not_found_screen.dart';
import 'package:flutter/widgets.dart'
    show DefaultTransitionDelegate, State, StatefulWidget, ValueNotifier;
import 'package:octopus/octopus.dart';

mixin RouterStateMixin<T extends StatefulWidget> on State<T> {
  late final Octopus router;
  late final ValueNotifier<List<({Object error, StackTrace stackTrace})>>
  errorsObserver;

  @override
  void initState() {
    // final dependencies = InheritedDependencies.of(context);
    // Observe all errors.
    errorsObserver =
        ValueNotifier<List<({Object error, StackTrace stackTrace})>>(
          <({Object error, StackTrace stackTrace})>[],
        );

    // Create router.
    router = Octopus(
      routes: Routes.values,
      defaultRoute: Routes.main,
      transitionDelegate: const DefaultTransitionDelegate<void>(),
      notFound: (context, name, arguments) => const NotFoundScreen(),
      guards: <IOctopusGuard>[
        // Authentication guard.
        // AuthenticationGuard(
        //   getUser: () => dependencies.authenticationRepository.currentUser,
        //   routes: <String>{
        //     Routes.authentication.name,
        //     Routes.emailVerification.name,
        //   },
        //   signinNavigation: OctopusState.single(Routes.authentication.node()),
        //   homeNavigation: OctopusState.single(Routes.home.node()),
        // ),
        // Email verification guard.
        // EmailVerificationGuard(
        //     getUser: () => dependencies.authenticationRepository.currentUser),
      ],
      onError:
          (error, stackTrace) =>
              errorsObserver.value = <({Object error, StackTrace stackTrace})>[
                (error: error, stackTrace: stackTrace),
                ...errorsObserver.value,
              ],
      /* observers: <NavigatorObserver>[
        HeroController(),
      ], */
    );
    super.initState();
  }
}
