final class Route {
  final String fullPath;
  final String reletivePath;
  final String name;

  Route({
    required this.fullPath,
    required this.reletivePath,
    required this.name,
  });

  @override
  String toString() {
    return name;
  }
}

final class RoutesName {
  static Route auth = Route(
    fullPath: '/auth',
    reletivePath: '/auth',
    name: "auth",
  );

  static Route restorePassword = Route(
    fullPath: '/auth/restore-password',
    reletivePath: 'restore-password',
    name: "restorePassword",
  );

  static Route home = Route(
    fullPath: '/home',
    reletivePath: '/home',
    name: "home",
  );

  static Route calendar = Route(
    fullPath: '/calendar',
    reletivePath: '/calendar',
    name: "calendar",
  );

  static Route dashboard = Route(
    fullPath: '/dashboard',
    reletivePath: '/dashboard',
    name: "dashboard",
  );
}
