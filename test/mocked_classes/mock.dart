import 'package:mockito/mockito.dart';
import 'package:movies_list_app/src/services/api_service.dart';
import 'package:movies_list_app/src/services/local_db_service.dart';

class ApiServiceMock extends Mock implements ApiService{}
class LocalDbServiceMock extends Mock implements LocalDbService{}