import 'package:get/route_manager.dart';
import 'package:rest_api/screen/dashboard.dart';
import 'package:rest_api/screen/login.dart';
import 'package:rest_api/screen/upload_image.dart';
import 'package:rest_api/screen/welcome.dart';

class RoutesClass {
  static const String welcome = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String dashboard = '/dashboard';
  static const String upload = '/upload';

  static List<GetPage> routes = [
    GetPage(name: welcome, page: () => WelcomeScreen()),
    GetPage(name: login, page: () => LoginScreen(), transition: Transition.rightToLeft),
    GetPage(name: dashboard, page: () => DashboardScreen()),
    GetPage(name: upload, page: () => FileUploadWidget())
  ];
}
