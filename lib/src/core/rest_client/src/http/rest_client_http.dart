import 'package:portfolio/src/core/rest_client/rest_client.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/src/core/rest_client/src/http/check_exeption_io.dart'
    if (dart.library.html) 'package:dud_core/src/core/rest_client/src/http/check_exeption_browser.dart';

/// {@template rest_client_http}
/// Rest client that uses [http] for making requests.
/// {@endtemplate}
final class RestClientHttp extends RestClientBase {
  /// {@macro rest_client_http}
  ///
  /// The [client] is optional and defaults to [http.Client]
  ///
  /// If you provide a [client], you are responsible for closing it.
  ///
  /// ```dart
  /// final client = http.Client();
  ///
  /// final restClient = RestClientHTTP(
  ///  baseUrl: 'https://example.com',
  ///  client: client,
  /// );
  /// ```
  RestClientHttp({
    required super.baseUrl,
    http.Client? client,
    Map<String, String>? additionalHeaders,
  }) : _client = client ?? http.Client(),
       _additionalHeaders = additionalHeaders;

  final http.Client _client;

  final Map<String, String>? _additionalHeaders;

  @override
  Future<Map<String, Object?>?> send({
    required String path,
    required String method,
    Map<String, String?>? queryParams,
    Map<String, Object?>? body,
    Map<String, Object?>? headers,
  }) async {
    try {
      final url = buildUri(path: path, queryParams: queryParams);
      final request = http.Request(method, url);
      if (_additionalHeaders != null) {
        request.headers.addAll(_additionalHeaders);
      }
      if (headers != null) {
        request.headers.addAll(
          headers.map((key, value) => MapEntry(key, value.toString())),
        );
      }
      if (body != null) {
        request.body =
            body
                .map((key, value) => MapEntry(key, value.toString()))
                .toString();
      }
      final streamResponse = await _client.send(request);
      final response = await http.Response.fromStream(streamResponse);
      final decodedBody = await decodeResponse(response.body);
      if (response.statusCode == 200) {
        return decodedBody;
      } else {
        throw ClientException(
          message: 'Request failed with status: ${response.statusCode}',
          cause: response,
        );
      }
    } on RestClientException {
      rethrow;
    } on http.ClientException catch (e, stack) {
      final checkedException = checkHttpException(e);

      if (checkedException != null) {
        Error.throwWithStackTrace(checkedException, stack);
      }

      Error.throwWithStackTrace(
        ClientException(message: e.message, cause: e),
        stack,
      );
    }
  }
}
