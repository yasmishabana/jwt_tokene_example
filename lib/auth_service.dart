// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:dio/dio.dart';
// import 'dart:convert';

// class AuthService {
//   final storage = FlutterSecureStorage();
//   final Dio dio = Dio();

//   Future<String?> getJwt() async {
//     final jwt = await storage.read(key: 'jwt');
//     if (jwt != null && _isTokenExpired(jwt)) {
//       // JWT is expired, renew the token using the refresh token
//       return await _renewToken();
//     }
//     return jwt;
//   }

//   bool _isTokenExpired(String jwt) {
//     final parts = jwt.split('.');
//     if (parts.length != 3) {
//       return true;
//     }
//     final payload = json.decode(
//         utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
//     final exp = payload['exp'];
//     final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
//     return exp < now;
//   }

//   Future<String?> _renewToken() async {
//     final refreshToken = await storage.read(key: 'refresh_token');
//     if (refreshToken == null) {
//       return null;
//     }

//     try {
//       final response = await dio.post(
//         'http://yourdomain.com/refresh_token.php',
//         data: {'refresh_token': refreshToken},
//       );

//       if (response.statusCode == 200) {
//         final data = response.data;
//         await storage.write(key: 'jwt', value: data['jwt']);
//         return data['jwt'];
//       } else {
//         // Handle refresh token failure (e.g., force logout)
//         return null;
//       }
//     } on DioException catch (e) {
//       // Handle error
//       print('Failed to refresh token: ${e.message}');
//       return null;
//     }
//   }

//   Future<void> register(
//       String contactNumber, String username, String password) async {
//     try {
//       final response = await dio.post(
//         'http://192.168.29.171:8080/flutter_php_auth/register.php',
//         data: {
//           'contact_number': contactNumber,
//           'username': username,
//           'password': password,
//         },
//       );

//       if (response.statusCode == 200) {
//         final data = response.data;
//         await storage.write(key: 'jwt', value: data['jwt']);
//         await storage.write(key: 'refresh_token', value: data['refresh_token']);
//         print('User registered and tokens saved.');
//       }
//     } on DioException catch (e) {
//       print('Failed to register: ${e.message}');
//     }
//   }

//   Future<void> login(String username, String password) async {
//     try {
//       final response = await dio.post(
//         'http://192.168.29.171:8080/flutter_php_auth/login.php',
//         data: {'username': username, 'password': password},
//       );

//       if (response.statusCode == 200) {
//         final data = response.data;
//         await storage.write(key: 'jwt', value: data['jwt']);
//         await storage.write(key: 'refresh_token', value: data['refresh_token']);
//         print('Login successful and tokens saved.');
//       }
//     } on DioException catch (e) {
//       print('Failed to log in: ${e.message}');
//     }
//   }
// }







// // import 'package:dio/dio.dart';

// // class AuthService {
// //   Dio dio = Dio();

// //   Future<String?> login(String username, String password) async {
// //     try {
// //       // Make the POST request
// //       var response = await dio.post(
// //         'http://192.168.29.171:8080/flutter_php_auth/login.php',
// //        // 'http://localhost/your_php_backend.php', // Change to your local/remote PHP backend URL
// //         data: {
// //           'username': username,
// //           'password': password,
// //         },
// //       );
      
// //       if (response.statusCode == 200) {
// //         // Extract the JWT token from the response
// //         var token = response.data['token'];
// //         return token;
// //       }
// //     } catch (e) {
// //       print(e);
// //     }
// //     return null;
// //   }
// // }
