import 'package:fluro/fluro.dart';
import 'package:web_bases/ui/views/views.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    router.define(
      "/",
      handler: _counterHandler,
      transitionDuration: const Duration(milliseconds: 200),
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      CounterView.routeName,
      handler: _counterHandler,
      transitionDuration: const Duration(milliseconds: 200),
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      '${CounterView.routeName}/:number',
      handler: _counterHandler,
      transitionDuration: const Duration(milliseconds: 200),
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      CounterProviderView.routeName,
      handler: _counterProviderHandler,
      transitionDuration: const Duration(milliseconds: 200),
      transitionType: TransitionType.fadeIn,
    );

    router.notFoundHandler = _NotFoundHandler;
  }

  static final Handler _counterHandler = Handler(
    handlerFunc: (context, parameters) {
      return CounterView(
        counter: parameters['number']?[0] ?? '0',
      );
    },
  );

  static final Handler _counterProviderHandler = Handler(
    handlerFunc: (context, parameters) => const CounterProviderView(),
  );

  static final Handler _NotFoundHandler = Handler(
    handlerFunc: (_, __) => const NotFoundView(),
  );
}
