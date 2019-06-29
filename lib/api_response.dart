class ApiResponse<T> {
  Status status;

  T data;

  String message;

  ApiResponse({this.status, this.data});

  ApiResponse.loading({this.message}) : status = Status.LOADING;

  ApiResponse.completed({this.message, this.data}) : status = Status.COMPLETED;

  ApiResponse.error({this.message}) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR }
