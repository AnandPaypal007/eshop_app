class ApiResponse<T> {
  APIStatus status;
  T? data;
  String message = "";
  int? statusCode;
  ApiResponse.loading(this.message) : status = APIStatus.loading;
  ApiResponse.complete(this.data) : status = APIStatus.completed;
  ApiResponse.error(this.message, {this.statusCode}) : status = APIStatus.error;
}

enum APIStatus { loading, completed, error }
