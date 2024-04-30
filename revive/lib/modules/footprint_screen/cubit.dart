import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/CarbonModel/person_model.dart';
import 'package:revive/modules/footprint_screen/state.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class CarbonPersonCubit extends Cubit<CarbonPersonStates> {
  CarbonPersonCubit() : super(carbonPersonInitialState());

  static CarbonPersonCubit get(context) => BlocProvider.of(context);
  CarbonPersonModel? carbonPersonModel;

  void carbonPerson({
    int? numPeople,
    String? Country,
    int? SizeHouse,
    String? typeHouse,
    int? electricityCons,
    int? cleanEnergy,
    String? heatEnergy,
    int? intercityTrain,
    int? subway,
    int? intercityBus,
    int? cityBus,
    int? tram,
    int? bike,
    int? planeV,
    int? planeL,
    int? planeM,
    int? planeS,
    String? perDiet,
    String? localProduct,
    String? buyEnvComp,
    int?eatOut,
    String? handleWaste,
    
  }) {
    emit(carbonPersonLoadingState());
    print("loooooooading");
    DioHelper.postData(
      url: CARBONPERSON,
      data: {
    "checksecurity":"EI8m2bl8TFVjbwYmuopsNPd1",
    "auth_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL3Jldi91c2Vycy9sb2dpbiIsImlhdCI6MTcwOTg0MDc4MywibmJmIjoxNzA5ODQwNzgzLCJqdGkiOiIyT013VVNWWG5oMlpsY09KIiwic3ViIjoiMiIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.qMDjnmzKorwgBbMRGa9nO0n-iiXjjWxdwLIkBd9ZUQU",
    "question": {
        "num_people"              : numPeople,
        "country"                 : "Egypt",
        "size_house"              : SizeHouse,
        "type_house"              : typeHouse,
        "Electricity_consumption" : electricityCons,
        "clean_energy"            : cleanEnergy,
        "Heating energy"          : heatEnergy,
        "IntercityTrain_avghours" : intercityTrain,
        "Subway_avghours"         : subway,
        "IntercityBus_avghours"   : intercityBus,
        "City Bus_avghours"       : cityBus,
        "Tram_avghours"           : tram,
        "Bike/walk_avghours"      : bike,
        "plane_verylong"          : planeV,
        "plane_long"              : planeL,
        "plane_medium"            : planeM,
        "plane_short"             : planeS,
        "household preferred diet": perDiet,
        "local_products?"         : localProduct,
        "buy _environmentally_companies?": buyEnvComp,
        "How many times a week does your family eat out?": eatOut,
        "HANDLE WASTE?"           : "Paper",
        "gasoline"                : 500,
        "natural gas "            : 555,
        "water consumtion"        : 179,
        "waste quantity"          : 77,
        "ferune"                  : 1,
        "fruite out of season"    : 15
        // "num_people"              : numPeople,
        // "country"                 : "Egypt",
        // "size_house"              : 800,
        // "type_house"              : "Detached",
        // "Electricity_consumption" : 900,
        // "clean_energy"            : 45,
        // "Heating energy"          : "Charcoal",
        // "IntercityTrain_avghours" : 5,
        // "Subway_avghours"         : 0,
        // "IntercityBus_avghours"   : 0,
        // "City Bus_avghours"       : 5,
        // "Tram_avghours"           : 0,
        // "Bike/walk_avghours"      : 2,
        // "plane_verylong"          : 2,
        // "plane_long"              : 1,
        // "plane_medium"            : 1,
        // "plane_short"             : 1,
        // "household preferred diet": "Vegan",
        // "local_products?"         : "Always",
        // "buy _environmentally_companies?": "Sometimes",
        // "How many times a week does your family eat out?": 4,
        // "HANDLE WASTE?"           : "Paper",
        // "gasoline"                : 500,
        // "natural gas "            : 555,
        // "water consumtion"        : 179,
        // "waste quantity"          : 77,
        // "ferune"                  : 1,
        // "fruite out of season"    : 15
        }
      },
    ).then((value) {
      print(value.data);
      carbonPersonModel = CarbonPersonModel.fromJson(value.data);
      emit(carbonPersonSuccessState(carbonPersonModel!));
    }).catchError(
      (error) {
        print(error.toString());
        emit(carbonPersonErrorState(error.toString()));
      },
    );
  }



  int? indexNum;

  void changeIndexNumber(index) {
    indexNum = index;
    print(indexNum);
    emit(carbonPersonChangeIndexState());
  }

  bool isLast = false;
  int currentIndex = 5;
  int current2Index = 5;
  int current3Index = 5;
  int current4Index = 9;
  int current5Index = 9;
  int current6Index = 9;
  void changePIndex1(value, index) {
    currentIndex = value ? index : 0;
    emit(carbonPersonChangeIndexState());
  }

  void changePIndex2(value, index) {
    current2Index = value ? index : 0;
    emit(carbonPersonChangeIndexState());
  }

  void changePIndex3(value, index) {
    current3Index = value ? index : 0;
    emit(carbonPersonChangeIndexState());
  }

  void changePIndex4(value, index) {
    current4Index = value ? index : 0;
    emit(carbonPersonChangeIndexState());
  }
  void changePIndex5(value, index) {
    current5Index = value ? index : 0;
    emit(carbonPersonChangeIndexState());
  }
  void changeIndex6(value, index) {
    current6Index = value ? index : 0;
    emit(carbonPersonChangeIndexState());
  }

}
