import 'dart:developer';

import 'package:vakinha_burguer_mobile/app/core/exceptions/user_notfound_exception.dart';
import 'package:vakinha_burguer_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burguer_mobile/app/models/user_model.dart';
import 'package:vakinha_burguer_mobile/app/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _restClient;

  AuthRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final result = await _restClient.post('/auth/register', {
      'name': name,
      'email': email,
      'password': password,
    });

    if (result.hasError) {
      String message = 'Erro ao registar o usuário';
      if (result.statusCode == 400) {
        message = result.body['error'];
      }
      log(
        message,
        error: result.statusText,
        stackTrace: StackTrace.current,
      );

      throw RestClientException(message: message);
    }

    return login(email, password);
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _restClient.post('/auth/', {
      'email': email,
      'password': password,
    });
    if (result.hasError) {
      if (result.statusCode == 403) {
        log(
          'usuario ou senha invalidos',
          error: result.statusText,
          stackTrace: StackTrace.current,
        );
        throw UserNotFoundException();
      }
      log(
        'Erro ao autenticar o usuário ${result.statusCode}',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException(message: 'Erro ao autenticar o usuário');
    }

    return UserModel.fromMap(result.body);
  }
}
