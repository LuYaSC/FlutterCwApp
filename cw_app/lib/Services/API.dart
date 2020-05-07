import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cw_app/Views/Models/authorize_batch.dart';
import 'package:cw_app/Views/Models/batch_pendings_cw.dart';
import 'package:cw_app/Views/Models/get_detail_batch.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

String baseUrl = "https://jsonplaceholder.typicode.com";
final storage = new FlutterSecureStorage();

class API {
  static Future getUsers() {
    var url = baseUrl + "/users";
    return http.get(url);
  }

  static Future getOperaions() {
    baseUrl =
        "https://credinetweb.bcp.com.bo/SitiosSegurosCore/salariesPayments/api/salariesPayments";
    var url = baseUrl + "/GetPreviousForm";
    return http.post(
      url,
      body: '',
      headers: {
        HttpHeaders.authorizationHeader: "Bearer " +
            'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuYW1laWQiOiIxMDIyMSIsInVuaXF1ZV9uYW1lIjoiOTAwMDAxMDAwMDEzMDc2NSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vYWNjZXNzY29udHJvbHNlcnZpY2UvMjAxMC8wNy9jbGFpbXMvaWRlbnRpdHlwcm92aWRlciI6IkFTUC5ORVQgSWRlbnRpdHkiLCJBc3BOZXQuSWRlbnRpdHkuU2VjdXJpdHlTdGFtcCI6ImE5ZGQwZWY2LTczOGMtNDU2Yi04ZTI5LTVhMDQ3MThlYTQyNyIsInJvbGUiOlsiQVVUT1JJWkFET1IiLCJDT05TVUxUT1IiLCJDT05UUk9MQURPUiIsIklOSUNJQURPUiJdLCJjb21wYW55X2lkIjoiMjI5NSIsImNvbXBhbnlfc3RhdGUiOnRydWUsImNvbXBhbnlfbmFtZSI6IlNJTExFUklDTyBORUdBTkVaIFJPRE9MRk8gQU5EUkVTICIsImNvbnRyb2xsZXJfc2NoZW1lIjpmYWxzZSwidXNlcl90eXBlIjoiUCIsInVzZXJfbmFtZSI6IlJFTUJFUlRPIEhJTEFRVUlUQSBNQU1BTkkiLCJ1c2VyX2RvY3VtZW50X251bWJlciI6IjQ4NTAxNDciLCJ1c2VyX2RvY3VtZW50X2V4dGVuc2lvbiI6IkxQIiwidXNlcl9kb2N1bWVudF90eXBlIjoiUSIsImV4Y2hhbmdlX2J1eSI6IjYuODUiLCJleGNoYW5nZV9zYWxlIjoiNi45NyIsImlzX3NpZ25hdHVyZSI6ZmFsc2UsImF1dGhvcml6ZV9vcGVyYXRpb24iOnRydWUsImF1dGhvcml6ZV9waW4iOmZhbHNlLCJhdXRob3JpemVfZnRwIjp0cnVlLCJpc192YWxpZGJhdGNodG9rZW4iOnRydWUsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTM3OTMiLCJhdWQiOiJmODJlNDUwYWQ0OWU0Mjg0YTYxM2VkOWE0YTVkZWI3NCIsImV4cCI6MTU4MzkwMTI3NiwibmJmIjoxNTgzODg5Mjc2fQ.Uo422svMcO8KZLmxvqmsvaEFrDOKg3MaKiJFu1czyq0'
      },
    );
  }

  static Future getAccounts(String token) {
    baseUrl =
        "https://credinetweb.bcp.com.bo/SitiosSegurosCore/balancesandmovements/api/balancesandmovements";
    var url = baseUrl + "/GetBalances";
    var bodyEncoded = json.encode({
      "operationTypeId": [12],
      "roleId": 2,
      "accountUse": "D",
      "types": ["P"]
    });
    return http.post(
      url,
      body: bodyEncoded,
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ' + token
      },
    );
  }

  static Future getMovements(String token, int accountId) {
    baseUrl =
        "https://credinetweb.bcp.com.bo/SitiosSegurosCore/balancesandmovements/api/balancesandmovements";
    var url = baseUrl + "/GetMovements";
    var bodyEncoded = json.encode({
      "accountId": accountId,
    });
    return http.post(
      url,
      body: bodyEncoded,
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ' + token
      },
    );
  }

  static Future getInformation(String token) {
    baseUrl =
        "https://www99.bancred.com.bo/SitiosSegurosCore/VPN/api/AppInformation/GetInformation";
    return http.post(
      baseUrl,
      body: '',
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ' + token
      },
    );
  }

  static Future getPendings(String token) {
    baseUrl =
        "https://www99.bancred.com.bo/SitiosSegurosCore/authorization/api/authorization";
    var url = baseUrl + "/GetPendingBatches";
    var bodyEncoded = json.encode({
      "rowIniAuthorize": -1,
      "numberRowAuthorize": 100,
      "rowIniController": -1,
      "numberRowController": 10,
      "rowIniPreSave": -1,
      "numberRowPreSave": 10
    });
    return http.post(
      url,
      body: bodyEncoded,
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ' + token
      },
    );
  }

  static Future authorizeBatch(String token, AuthorizeBatch dto) {
    baseUrl =
        "https://www99.bancred.com.bo/SitiosSegurosCore/authorization/api/authorization";
    var url = baseUrl + "/ProcessBatches";
    var bodyEncoded = json.encode(dto);
    return http.post(
      url,
      body: bodyEncoded,
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ' + token
      },
    );
  }

  static Future rejectedBatch(String token, AuthorizeBatch dto) {
    baseUrl =
        "https://www99.bancred.com.bo/SitiosSegurosCore/authorization/api/authorization";
    var url = baseUrl + "/RejectBatches";
    var bodyEncoded = json.encode(dto);
    return http.post(
      url,
      body: bodyEncoded,
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ' + token
      },
    );
  }

  static Future getTrackingBatches(String token) {
    baseUrl =
        "https://credinetweb.bcp.com.bo/SitiosSegurosCore/TrackTransfersn/api/TrackTransfers";
    var url = baseUrl + "/TrackingListParameters";
    var bodyEncoded = json.encode({
      "OperationStatusId": 0,
      "OperationTypeId": 0,
      "Beneficiary": "",
      "batchId": "",
      "EndDate": null,
      "InitialDate": null,
      "OrderByAsc": false,
      "rowIni": -1,
      "numberRow": 100,
    });
    return http.post(
      url,
      body: bodyEncoded,
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ' + token
      },
    );
  }

  static Future loginCw(String userName, String password, String ip) {
    String url =
        'https://www99.bancred.com.bo/SitiosSeguros/JwtAuthentication/oauth2/token';
    var map = new Map<String, dynamic>();
    map['grant_type'] = 'password';
    map['client_id'] = 'f82e450ad49e4284a613ed9a4a5deb74';
    map['captchaValue'] = '03AERD8XpvG';
    map['captchaValueToVerify'] = '03AERD8XpvG';
    map['username'] = userName;
    map['password'] = password;
    map['IpClient'] = ip;
    return http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: map);
  }

  static Future getTransferAbroadGPI(String token, int batch) {
    baseUrl =
        'https://credinetweb.bcp.com.bo/SitiosSegurosCore/transfersAbroad/api/transfersAbroad/TrackerGPI';
    var dto = new GetDetailBatch();
    dto.batch = batch;
    var bodyEncoded = json.encode(dto);
    return http.post(
      baseUrl,
      body: bodyEncoded,
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ' + token
      },
    );
  }

  static Future getTransferAbroadPayments(String token, int batch) {
    baseUrl =
        'https://credinetweb.bcp.com.bo/SitiosSegurosCore/transfersAbroad/api/transfersAbroad/GetTransfer';
    var dto = new GetDetailBatch();
    dto.batch = batch;
    var bodyEncoded = json.encode(dto);
    return http.post(
      baseUrl,
      body: bodyEncoded,
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ' + token
      },
    );
  }

  static Future getTransferAbroadDetailPayments(String token, int batch) {
    baseUrl =
        'https://credinetweb.bcp.com.bo/SitiosSegurosCore/transfersAbroad/api/transfersAbroad/GetTransferDetail';
    var dto = new GetDetailBatch();
    dto.batch = batch;
    var bodyEncoded = json.encode(dto);
    return http.post(
      baseUrl,
      body: bodyEncoded,
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ' + token
      },
    );
  }

  static Future getAfpPayments(String token, int batch) {
    baseUrl =
        'https://credinetweb.bcp.com.bo/SitiosSegurosCore/AFP/api/AFP/GetPaymentAFPDetail';
    var dto = new GetDetailBatch();
    dto.processBatchId = batch;
    var bodyEncoded = json.encode(dto);
    return http.post(
      baseUrl,
      body: bodyEncoded,
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ' + token
      },
    );
  }

  static Future getCreSagPayments(String token, int batch) {
    baseUrl =
        'https://credinetweb.bcp.com.bo/SitiosSegurosCore/servicepayments/api/servicePayments/getCresaguapacDetail';
    var dto = new GetDetailBatch();
    dto.processBatchId = batch;
    var bodyEncoded = json.encode(dto);
    return http.post(
      baseUrl,
      body: bodyEncoded,
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ' + token
      },
    );
  }

  static Future getDetailPasePayments(
      String token, int batch, int operationType) {
    baseUrl = operationType == 33
        ? 'https://www99.bancred.com.bo/SitiosSegurosCore/ServicesPasePayments/api/ServicesPase/GetDetail'
        : 'https://credinetweb.bcp.com.bo/SitiosSegurosCore/ElfecPayments/api/Elfec/GetElfecDetail';
    var dto = new GetDetailBatch();
    dto.processBatchId = batch;
    var bodyEncoded = json.encode(dto);
    return http.post(
      baseUrl,
      body: bodyEncoded,
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ' + token
      },
    );
  }

  static Future getDetailTelephonyPayments(String token, int batch) {
    baseUrl =
        'https://www99.bancred.com.bo/SitiosSegurosCore/servicepayments/api/servicePayments/getTelephonyDetail';
    var dto = new GetDetailBatch();
    dto.processBatchId = batch;
    var bodyEncoded = json.encode(dto);
    return http.post(
      baseUrl,
      body: bodyEncoded,
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ' + token
      },
    );
  }

  static Future getDetailMassPayments(String token, BatchPendingsCw batch) {
    baseUrl = getUrl(batch.operationTypeId);
    var dto = new GetDetailBatch();
    dto.batchId = batch.id;
    dto.id = batch.id;
    var bodyEncoded = json.encode(dto);
    return http.post(
      baseUrl,
      body: bodyEncoded,
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ' + token
      },
    );
  }

  static Future getDetailMultiplePayments(String token, BatchPendingsCw batch) {
    baseUrl = getUrl(batch.operationTypeId);
    var dto = new GetDetailBatch();
    dto.batchId = batch.id;
    dto.id = batch.id;
    var bodyEncoded = json.encode(dto);
    return http.post(
      baseUrl,
      body: bodyEncoded,
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ' + token
      },
    );
  }

  static Future getDetailTransfer(String token, int processBatchId) {
    baseUrl =
        "https://www99.bancred.com.bo/SitiosSegurosCore/transfers/api/transfers/GetDetail";
    var dto = new GetDetailBatch();
    dto.batchId = processBatchId;
    dto.id = processBatchId;
    var bodyEncoded = json.encode(dto);
    return http.post(
      baseUrl,
      body: bodyEncoded,
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ' + token
      },
    );
  }

  static String getUrl(int operationId) {
    String url = '';
    switch (operationId) {
      case 8:
        url =
            'https://www99.bancred.com.bo/SitiosSegurosCore/salariesPayments/api/salariesPayments/GetDetail';
        break;
      case 16:
        url =
            'https://www99.bancred.com.bo/SitiosSegurosCore/providersPayments/api/providersPayments/GetDetail';
        break;
      case 24:
        url =
            'https://www99.bancred.com.bo/SitiosSegurosCore/PaymentBankAch/api/PaymentBankAch/GetDetail';
        break;
      case 25:
        url =
            'https://www99.bancred.com.bo/SitiosSegurosCore/cashPayments/api/cashPayments/GetDetail';
        break;
      case 20:
        url =
            'https://www99.bancred.com.bo/SitiosSegurosCore/multiplePayments/api/oldmultiplePayments/GetDetail';
        break;
      case 23:
        url =
            'https://www99.bancred.com.bo/SitiosSegurosCore/favoritePayments/api/oldfavoritePayments/GetDetail';
        break;
      case 26:
        url =
            'https://www99.bancred.com.bo/SitiosSegurosCore/ProvidersCheckManagement/api/ManagementCheck/GetDetail';
        break;
      case 27:
        url =
            'https://www99.bancred.com.bo/SitiosSegurosCore/ProvidersDepositOtherBankCheck/api/OldDepositOtherBank/GetDetail';
        break;
      case 28:
        url =
            'https://www99.bancred.com.bo/SitiosSegurosCore/PaymentTaxChecks/api/TaxCheck/GetDetail';
        break;
      case 29:
        url =
            'https://www99.bancred.com.bo/SitiosSegurosCore/PaymentOddAch/api/OldPaymentODD/GetDetail';
        break;
    }
    return url;
  }
}
