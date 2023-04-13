import "package:dio/dio.dart";

import "package:kcb/services/client_services.dart";

import "../models/branch.dart";
import 'package:kcb/providers/branch_provider.dart';

import "../models/department.dart";

class BranchServices {
  final Dio client = Client.dio;

  Future<List<Branch>> getBranches() async {
    List<Branch> branches = [];
    try {
      Response response = await Client.dio.get('api/branches/');
      final jsonList = response.data as List;
      print(jsonList);
      branches = jsonList.map((branch) => Branch.fromJson(branch)).toList();
    } on DioError catch (error) {
      print(error);
    }
    return branches;
  }

  Future<Branch> getBranchDetail(id) async {
    Branch branch = Branch(id: 0, name: "", departments: []);
    try {
      Response response = await Client.dio.get('api/branches/detail/$id/');
      branch = Branch.fromJson(response.data);
    } on DioError catch (error) {
      print(error);
    }
    return branch;
  }

  Future<Branch> getBranchDepartment(id) async {
    Branch branch = Branch(name: "", departments: []);
    try {
      Response response = await Client.dio.get('api/branch/department/$id/');
      print("HELOOOOO00");
      branch = Branch.fromJson(response.data);
      print(branch);
    } on DioError catch (error) {
      print(error);
    }
    return branch;
  }
}
