import 'dart:io';

import 'package:http/http.dart';
import 'package:http/retry.dart';

enum RequestMethod { get, post, put, patch, delete }

class HttpNetworkProvider {
  final bool useTokenHeader;

  const HttpNetworkProvider([this.useTokenHeader = true]);

  static const _baseUrl = '';

  Client get _client {
    return RetryClient(Client());
  }

  Future<Map<String, String>> get _baseHeaders async {
    return {'Authorization': 'Bearer '};
  }

  Future<Response?> call({
    required String path,
    required RequestMethod method,
    dynamic body = const {},
    Map<String, dynamic> queryParams = const {},
    Map<String, String> headers = const {},
  }) async {
    try {
      final requestHeaders =
          useTokenHeader ? await _baseHeaders : <String, String>{};
      return await switch (method) {
        RequestMethod.get => _client.get(
            Uri.https(_baseUrl, path, queryParams),
            headers: requestHeaders..addAll(headers),
          ),
        RequestMethod.post => _client.post(
            Uri.https(_baseUrl, path, queryParams),
            headers: requestHeaders..addAll(headers),
            body: body,
          ),
        RequestMethod.put => _client.put(
            Uri.https(_baseUrl, path, queryParams),
            headers: requestHeaders..addAll(headers),
            body: body,
          ),
        RequestMethod.patch => _client.patch(
            Uri.https(_baseUrl, path, queryParams),
            headers: requestHeaders..addAll(headers),
            body: body,
          ),
        RequestMethod.delete => _client.delete(
            Uri.https(_baseUrl, path, queryParams),
            headers: requestHeaders..addAll(headers),
            body: body,
          ),
      };
    } on Exception catch (e) {}
  }
}
