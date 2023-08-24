typedef ControllerAction = String Function(Map<String, dynamic> params);

class Route {
  final RegExp pattern;
  final ControllerAction action;

  Route(this.pattern, this.action);
}

class Router {
  final List<Route> _routes = [];
  void add(String pattern, ControllerAction action) {
    print('Adding route: $pattern'); // Debug print
    _routes.add(Route(
        RegExp(pattern), action)); // Create a RegExp object from the pattern
  }

  Function? match(String path) {
    for (var route in _routes) {
      if (_matchRoute(route.pattern, path)) {
        var params = _extractParams(route.pattern, path);
        return () => route.action(params);
      }
    }
    return null;
  }

  bool _matchRoute(RegExp pattern, String path) {
    var patternParts = pattern.pattern.split('/');
    var pathParts = path.split('/');

    if (patternParts.length != pathParts.length) {
      return false;
    }

    for (var i = 0; i < patternParts.length; i++) {
      if (!patternParts[i].startsWith(':') && patternParts[i] != pathParts[i]) {
        return false;
      }
    }

    return true;
  }

  Map<String, String> _extractParams(RegExp pattern, String path) {
    var patternParts = pattern.pattern.split('/');
    var pathParts = path.split('/');
    var params = <String, String>{};

    for (var i = 0; i < patternParts.length; i++) {
      if (patternParts[i].startsWith(':')) {
        var paramName = patternParts[i].substring(1);
        params[paramName] = pathParts[i];
      }
    }

    return params;
  }
}
