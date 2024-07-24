
import 'package:api_task/model/api_model.dart';
import 'package:api_task/service/api_Service.dart';
import 'package:get/get.dart';



class ApiController extends GetxController{
  // RxList<UserDataModel> apiData = <UserDataModel>[].obs;
  Rx<UserDataModel> apiData = UserDataModel().obs;
  UserDataModel? userData;
  RxBool isLoading = true.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    getApiData();
    // apiData.refresh();
  }

  Future<void> getApiData() async {
    try {

      var data = /*apiData.value =*/ await AuthService.getApiDataService();
      isLoading.value = false;
      print("apiData.value---- $data");
      apiData.refresh();


    }
    on Exception catch (e,st) {
      print("apiResponse error---- $e - $st");
    }
  }
}


