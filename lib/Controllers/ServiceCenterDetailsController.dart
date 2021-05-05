import 'package:get/get.dart';

import '../Model/ServiceCenterDetailsModel.dart';
import '../Repo/ServiceCenterDetailsRepo.dart';


class ServiceCenterDetailsController extends GetxController {

  ServiceCenterDetailsModel scdInfo = ServiceCenterDetailsModel();
  ServiceCenterDetailsRepo scdrepo = ServiceCenterDetailsRepo();
  
  void getSCDInfo(int iD) async {
    scdInfo = await scdrepo.fetch_service_center(iD);

    update();
  }

}
