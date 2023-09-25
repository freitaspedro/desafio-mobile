// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';

void main() async {

  late Dio dio;

  late DioAdapter dioAdapter;

  Response<dynamic> response;



  group('DioAdapterMockito', () {

    const baseUrl = 'http://localhost:3001';

    setUp(() {

      dio = Dio(BaseOptions(baseUrl: baseUrl));

      dioAdapter = DioAdapter(
          dio: dio,
          matcher: const FullHttpRequestMatcher(),
      );

    });



    test('successful request', () async {

      const route = 'v1/videos/history?limit=10';

      final data = jsonEncode({'data': 'Success!'});

      dioAdapter.onGet(
          route,
          (server) => server.reply(
              202,
              data,
              delay: const Duration(seconds: 1),
          ),
      );

      response = await dio.get(route);

      expect(response.statusCode, 202);

      expect(response.data, jsonEncode({'data': 'Success!'}));

    });



    test('bad request', () async {

      const route = 'v1/videos/history?limit=-1';

      const error = 'Could not find the requested video list';

      const statusCode = 400;
      final requestOptions = RequestOptions(path: route);
      final response = Response(statusCode: statusCode, requestOptions: requestOptions);

      dioAdapter.onGet(
          route,
          (server) => server.throws(
            statusCode,
            DioException(
                requestOptions: RequestOptions(
                  path: route,
                ),
                response: response,
                type: DioExceptionType.badResponse,
                error: error,
            ),
          ),
      );

      // Checking that exception type can match `DioException` type too.
      expect(
        () async => await dio.get(route),
        throwsA(isA<DioException>()),
      );

      // Checking the type and the message of the exception.
      expect(
        () async => await dio.get(route),
        throwsA(predicate((DioException e) => e.error == error)),
      );

    });


    test('internal server error', () async {

      const route = 'v1/videos/history?limit=-2';

      const error = 'A unknow exception occurred. Try again later.';

      const statusCode = 500;
      final requestOptions = RequestOptions(path: route);
      final response = Response(statusCode: statusCode, requestOptions: requestOptions);

      dioAdapter.onGet(
        route,
          (server) => server.throws(
            statusCode,
            DioException(
              requestOptions: RequestOptions(
                path: route,
              ),
              response: response,
              type: DioExceptionType.unknown,
              error: error,
            ),
        ),
      );

      // Checking that exception type can match `DioException` type too.
      expect(
        () async => await dio.get(route),
        throwsA(isA<DioException>()),
      );

      // Checking the type and the message of the exception.
      expect(
        () async => await dio.get(route),
        throwsA(predicate((DioException e) => e.error == error)),
      );

    });


  });


}
