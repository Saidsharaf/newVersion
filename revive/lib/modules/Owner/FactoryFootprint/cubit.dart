import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/CarbonModel/factory_model.dart';
import 'package:revive/modules/Owner/FactoryFootprint/state.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class CarbonFactoryCubit extends Cubit<CarbonFactoryStates> {
  CarbonFactoryCubit() : super(carbonFactoryInitialState());

  static CarbonFactoryCubit get(context) => BlocProvider.of(context);
  CarbonFactoryModel? carbonFactoryModel;

  void carbonFactory({
    String? Country,
    int? numPeople,
    int? electricityCons,
    int? cleanEnergy,
    int? numCars,
    int? factSize,
    String? localProduct,
    String? buyEnvComp,
    String? handleWaste,
    String? heating,
  }) {
    emit(carbonFactoryLoadingState());
    print("loooooooading");
    DioHelper.postData(
      url: CARBONFACTORY,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "auth_token":
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL3Jldi91c2Vycy9sb2dpbiIsImlhdCI6MTcwOTg0MDc4MywibmJmIjoxNzA5ODQwNzgzLCJqdGkiOiIyT013VVNWWG5oMlpsY09KIiwic3ViIjoiMiIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.qMDjnmzKorwgBbMRGa9nO0n-iiXjjWxdwLIkBd9ZUQU",
        "maachineid": 3,
        "question": {
          // "Country": Country, // string
          // "num_people": numPeople, // int
          // "electricity_cons": electricityCons, // int
          // "Clean_energy": cleanEnergy, // int
          // "Num_cars": numCars, // int
          // "Fact_size": factSize, // int
          // "Local_product": localProduct, // string
          // "Buy_env_comp": buyEnvComp, // string
          // "Handle_waste": handleWaste, // string
          // "Heating": heating, // string
          // "Gasoline": "20", // int
          // "Natural_gas": "25", // int
          // "Water_cons": "30", // int
          // "Waste_quan": "28" // int
          // "country "                  : "Egypt",      // string
          // "num_people"               : numPeople,     // int
          // "electricity_cons"         : electricityCons,    // int
          // "Clean_energy"             : cleanEnergy,    // int
          // "Num_cars"                 : numCars,     // int
          // "Fact_size"                : factSize,    // int
          // "Local_product"            : "example",    // string
          // "Buy_env_comp"             : "example",    // string
          // "Handle_waste"             : "example",    // string
          // "Heating"                  : "example",    // string
          // "Gasoline"                 : "20",    // int
          // "Natural_gas"              : "25",    // int
          // "Water_cons"               : "30",    // int
          // "Waste_quan"               : "28"
          "country": "Egypt",
          "num_people": numPeople,
          "Electricity_consumption": electricityCons,
          "clean_energy": cleanEnergy,
          "num_cars": numCars,
          "factory_size": factSize,
          "local_products?": localProduct,
          "buy _environmentally_companies?": buyEnvComp,
          "HANDLE WASTE?": "Plastic",
          "Heating energy": heating,
          "gasoline": 1303,
          "natural gas ": 859,
          "water consumtion": 2710,
          "waste quantity": 845
        }
      },
    ).then((value) {
      print(value.data);
      carbonFactoryModel = CarbonFactoryModel.fromJson(value.data);
      emit(carbonFactorySuccessState(carbonFactoryModel!));
    }).catchError(
      (error) {
        print(error.toString());
        emit(carbonFactoryErrorState(error.toString()));
      },
    );
  }

  void emitsucces() {
    emit(carbonFactorySuccessState(CarbonFactoryModel()));
  }

  void carbonFactory2({
    String? Country,
    int? numPeople,
    int? electricityCons,
    int? cleanEnergy,
    int? numCars,
    int? factSize,
    String? localProduct,
    String? buyEnvComp,
    String? handleWaste,
    String? heating,
  }) {
    emit(carbonFactoryLoadingState());
    print("loooooooading");
    DioHelper.postData(
      url: CARBONFACTORY,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "auth_token":
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL3Jldi91c2Vycy9sb2dpbiIsImlhdCI6MTcwOTg0MDc4MywibmJmIjoxNzA5ODQwNzgzLCJqdGkiOiIyT013VVNWWG5oMlpsY09KIiwic3ViIjoiMiIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.qMDjnmzKorwgBbMRGa9nO0n-iiXjjWxdwLIkBd9ZUQU",
        "maachineid": 3,
        "question": {
          "country": "Egypt",
          "num_people": 339,
          "Electricity_consumption": 3778,
          "clean_energy": 20,
          "num_cars": 7,
          "factory_size": 0,
          "local_products?": "Sometimes",
          "buy _environmentally_companies?": "Sometimes",
          "HANDLE WASTE?": "Plastic",
          "Heating energy": "Heating oil",
          "gasoline": 1303,
          "natural gas ": 859,
          "water consumtion": 2710,
          "waste quantity": 845
        }
      },
    ).then((value) {
      print(value.data);
      carbonFactoryModel = CarbonFactoryModel.fromJson(value.data);
      emit(carbonFactorySuccessState(carbonFactoryModel!));
    }).catchError(
      (error) {
        print(error.toString());
        emit(carbonFactoryErrorState(error.toString()));
      },
    );
  }

  int? indexNum;

  void changeIndexNumber(index) {
    indexNum = index;
    print(indexNum);
    emit(carbonFactoryChangeIndexState());
  }

  bool isLast = false;
  int currentIndex = 5;
  int current2Index = 5;
  int current3Index = 5;
  int current4Index = 9;
  void changeIndex1(value, index) {
    currentIndex = value ? index : 0;
    emit(carbonFactoryChangeIndexState());
  }

  void changeIndex2(value, index) {
    current2Index = value ? index : 0;
    emit(carbonFactoryChangeIndexState());
  }

  void changeIndex3(value, index) {
    current3Index = value ? index : 0;
    emit(carbonFactoryChangeIndexState());
  }

  void changeIndex4(value, index) {
    current4Index = value ? index : 0;
    emit(carbonFactoryChangeIndexState());
  }

  void success() {
    emit(carbonFactorySuccessState(CarbonFactoryModel as CarbonFactoryModel));
  }
}
