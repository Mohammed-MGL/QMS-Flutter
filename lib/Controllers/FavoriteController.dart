import 'package:get/get.dart';
import 'package:qms/Model/ServiceCentersModel.dart';
import 'package:qms/Repo/Storage.dart';
import 'dart:convert' as convert;

class FavoriteController extends GetxController {
  Storage storage = Storage();

  List<Results> favSClist = [];

  addToFav(Results sc) async {
    await storage.readFavSC();
    await getFavList();
    bool ins = false;
    favSClist.forEach((element) {
      if (element.id == sc.id) ins = true;
    });
    if (!ins) {
      favSClist.add(sc);
      var s = ServiceCentersModel(
          next: false, page: 0, total: 1, results: favSClist);

      await storage.saveFavSC(convert.jsonEncode(s.toJson()));
      // String favListJson = await storage.readFavSC();
      // var l = ServiceCentersModel.fromJson(convert.jsonDecode(favListJson));
      // print(l.results);
      getFavList();
    }
  }

  removFromFav(int id) async {
        // await storage.deleteFavSC();

    favSClist.forEach((element) {
      if (element.id == id) favSClist.remove(element);
    });
    var s =
        ServiceCentersModel(next: false, page: 0, total: 1, results: favSClist);
    await storage.saveFavSC(convert.jsonEncode(s.toJson()));
    getFavList();
  }


  getFavList() async {
    String favListJson = await storage.readFavSC();
    var l = ServiceCentersModel.fromJson(convert.jsonDecode(favListJson));
    favSClist = l.results;
    update();
    return favSClist;
  }
}
