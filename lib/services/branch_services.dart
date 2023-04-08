import "package:dio/dio.dart";

import "package:kcb/services/client_services.dart";

import "../models/branch.dart";
import 'package:kcb/providers/branch_provider.dart';

class BranchServices {
  final client = Client.dio;

//   Future<List<Branch>> getBranches() async {
//     List<Branch> branches = [];
//     try {
//       Response response = await client.get('api/branches/');
//       for (var branch in response.data) {
//         branches.add(Branch.fromJson(branch));
//         final jsonList = response.data as List;
//       }
//     } on DioError catch (error) {
//       print(error);
//     }
//     return branches;
//   }
// }

  Future<List<Branch>> getBranches() async {
    List<Branch> branches = [];
    try {
      Response response = await Client.dio.get('api/branches/');
      final jsonList = response.data as List;
      branches = jsonList.map((branch) => Branch.fromJson(branch)).toList();
    } on DioError catch (error) {
      print(error);
    }
    return branches;
  }
}
