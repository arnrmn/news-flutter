import 'package:http/http.dart';

abstract class ResponseMapper<T> {
  T map(Response response);
}
