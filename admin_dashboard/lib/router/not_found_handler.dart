import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/ui/views/views.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class NotFoundHandlers {
  static final Handler notFoundHandler =
      Handler(handlerFunc: (context, params) {
    Provider.of<SideMenuProvider>(context!).setCurrentPage("/404");
    return const NotFoundView();
  });
}
