import '../database/boolean_status.dart';

class PopupData<T> {
  BooleanStatus status;
  T? data;
  dynamic errorData;

  PopupData({
    required this.status,
    this.data,
    this.errorData,
  });
}
