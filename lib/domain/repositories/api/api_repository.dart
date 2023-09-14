import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_atlanta_packages_example/data/providers/api_provider.dart';
import 'package:flutter_atlanta_packages_example/domain/errors/request_exception.dart';

class APIRepository<T> {
  APIRepository({
    required this.endpoint,
    required this.apiProvider,
    required this.fromJson,
  });

  final String endpoint;
  final APIProvider apiProvider;

  final T Function(Map<String, dynamic>) fromJson;

  /// Make a GET request to the API endpoint.
  /// Parse the response into a [List<T>] and return it.
  Future<Either<RequestException, List<T>>> index() async {
    try {
      final response = await apiProvider.get(endpoint);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final data = json
            .map<T>(
              (e) => fromJson(
                Map<String, dynamic>.from(e as Map<String, dynamic>),
              ),
            )
            .toList();
        return Right(data);
      } else {
        return Left(
          RequestException(
            message: response.reasonPhrase ?? 'Unknown error',
            statusCode: response.statusCode,
          ),
        );
      }
    } catch (e) {
      return Left(
        RequestException(
          message: e.toString(),
          statusCode: 500,
        ),
      );
    }
  }
}
