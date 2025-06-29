import '../../../../core/network/api_client.dart';

class BookRemoteDataSource {
  final ApiClient _apiClient;

  BookRemoteDataSource(this._apiClient);
  Future<dynamic> searchUser(String query) async {
    return await _apiClient.getRequest(query);
  }
}
