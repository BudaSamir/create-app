// import 'dart:convert';
//
// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:meta/meta.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
// import 'dart:io' as io;
//
// import '../../../../constant/constants.dart';
// import '../../../../model/city_model.dart';
// import '../../../../model/nationality_model.dart';
// import '../../../../view/components/core/toast.dart';
// import '../../../database/local/cache_helper.dart';
// import '../../../database/network/dio_helper.dart';
// import '../../../database/network/end_points.dart';
// import '../signup/signup_cubit.dart';
//
// part 'documents_state.dart';
//
// class DocumentsCubit extends Cubit<DocumentsState> {
//   DocumentsCubit() : super(SignupInitial());
//
//   static DocumentsCubit get(context) => BlocProvider.of(context);
//
// /*  Future<dynamic> verifyPhoneOtp({
//         required String phone,
//         required String country})
//   async {
//     emit(VerifyOtpLoadingState());
//     await DioHelper.postData(url: verifyOtpPhoneSignupEndPoint, data: {
//       "phone": phone,
//       "country": country,
//     }).then((value) {
//       ForgetPasswordModel.fromJson(value.data);
//       emit(VerifyOtpSuccessState());
//     }).catchError((error) {
//       if (error is DioError) {
//         showToast(message: error.response!.data['message']);
//       }
//
//       emit(VerifyOtpErrorState());
//     });
//   }*/
//
//
//
//   NationalityModel? nationalityModel;
//
//   //used to get all Nationality
//   Future<dynamic> getNationalities() async {
//     print("loading countries");
//     emit(NationalityLoading());
//     DioHelper.getData(url: countryEndPoint, token: CacheHelper.get(key: accessTokenKey)).then((value)
//     {
//       print(value.data);
//       print("countries ");
//       nationalityModel = NationalityModel.fromJson(value.data);
//       print(nationalityModel == null);
//       emit(NationalitySuccess());
//
//     }).catchError((onError) {
//       print(onError);
//       if (onError is DioError) {
//         showToast(message: onError.response!.data['message']);
//       }
//       emit(NationalityError());
//     });
//   }
//
//
//
//   CityModel? cityModel;
//
//   //used to get all cities
//   Future<dynamic> getCities() async {
//     print("loading City");
//     emit(CityLoading());
//     DioHelper.getData(url: cityEndPoint, token: CacheHelper.get(key: accessTokenKey)).then((value)
//     {
//       print(value.data);
//       print("City ");
//       cityModel = CityModel.fromJson(value.data);
//       print(cityModel == null);
//       emit(CitySuccess());
//
//     }).catchError((onError) {
//       print(onError);
//       if (onError is DioError) {
//         showToast(message: onError.response!.data['message']);
//       }
//       emit(CityError());
//     });
//   }
//
//
//   //used to get all main servies
//   Future<dynamic> getServices() async {
//     print("loading City");
//     emit(CityLoading());
//     DioHelper.getData(url: cityEndPoint, token: CacheHelper.get(key: accessTokenKey)).then((value)
//     {
//       print(value.data);
//       print("City ");
//       cityModel = CityModel.fromJson(value.data);
//       print(cityModel == null);
//       emit(CitySuccess());
//
//     }).catchError((onError) {
//       print(onError);
//       if (onError is DioError) {
//         showToast(message: onError.response!.data['message']);
//       }
//       emit(CityError());
//     });
//   }
//
//
//   XFile? pickedFile;
//
//
//   final ImagePicker picker = ImagePicker();
//
//
//
//   XFile? pickedPersonalPicture;
//
//   //used to pick Personal Picture
//   Future<void> addPersonalPicture(context) async {
//     pickedPersonalPicture = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedPersonalPicture == null)
//     {
//       emit(PersonalPictureCancel());
//       return;
//     }
//
//     else{
//       await SignupCubit.uploadImage(pickedPersonalPicture!).then((value) {
//         if((value ?? '').isNotEmpty){
//           SignupCubit.get(context).personalImage = value ?? '';
//           print('front ID');
//           print(SignupCubit.get(context).personalImage);
//         }
//       });
//       print("added personal");
//     emit(PersonalPictureSuccess());
//     }
//
//   }
//
//   //used to delete Personal Picture
//   Future<void> deletePersonalPicture(context) async {
//     pickedPersonalPicture = null;
//     SignupCubit.get(context).personalImage = '';
//     emit(DeletePersonalPicture());
//   }
//
//
//   XFile? pickedCompanyTradeLicense;
//
//
//   //used to pick Company Trade License
//   Future<void> addCompanyTradeLicense(context) async {
//     pickedCompanyTradeLicense = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedCompanyTradeLicense == null)
//     {
//       emit(CompanyTradeLicenseCancel());
//       return;
//     }
//     else
//       {
//
//        await SignupCubit.uploadImage(pickedCompanyTradeLicense!).then((value){
//
//
//           if(value != null){
//             SignupCubit.get(context).commecrialImage = value;
//           }
//         });
//         print("added CompanyTradeLicense");
//         emit(CompanyTradeLicenseSuccess());
//       }
//
//   }
//
//   //used to delete Company Trade License
//   Future<void> deleteCompanyTradeLicense(context) async {
//     pickedCompanyTradeLicense = null;
//     SignupCubit.get(context).commecrialImage = '';
//     emit(DeleteCompanyTradeLicense());
//   }
//
//   XFile? pickedProblemBefore;
//   String problemBefore = '';
//
//
//   //used to pick Front National Identification
//   Future<void> addProblemBefore(context) async {
//     pickedProblemBefore = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedProblemBefore == null)
//     {
//       emit(ProblemBeforeCancel());
//       return;
//     }
//     else{
//
//       await SignupCubit.uploadImage(pickedProblemBefore!).then((value){
//         if(value != null){
//           problemBefore = value;
//         }
//       });
//       print("added front id");
//       emit(ProblemBeforeSuccess());
//     }
//
//
//   }
//
//   Future<void> deleteProblemBefore(context) async {
//     pickedProblemBefore = null;
//     SignupCubit.get(context).frontIdImage = '';
//     emit(DeleteProblemBefore());
//   }
//
//
//
//   XFile? pickedFrontID;
//
//
//   //used to pick Front National Identification
//   Future<void> addFrontID(context) async {
//     pickedFrontID = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFrontID == null)
//     {
//       emit(FrontIDCancel());
//       return;
//     }
//     else{
//
//       await SignupCubit.uploadImage(pickedFrontID!).then((value){
//         if(value != null){
//           SignupCubit.get(context).frontIdImage = value;
//         }
//       });
//       print("added front id");
//       emit(FrontIDSuccess());
//     }
//
//
//   }
//
//   //used to delete Front National Identification
//   Future<void> deleteFrontID(context) async {
//     pickedFrontID = null;
//     SignupCubit.get(context).frontIdImage = '';
//     emit(DeleteFrontID());
//   }
//
//
//   XFile? pickedBackID;
//
//   //used to pick Back National Identification
//   Future<void> addBackID(context) async {
//     pickedBackID = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedBackID == null)
//     {
//       emit(BackIDCancel());
//       return;
//     }
//
//     else
//     {
//
//       await SignupCubit.uploadImage(pickedBackID!).then((value){
//         if(value != null){
//           SignupCubit.get(context).backIdImage = value;
//         }
//       });
//       emit(BackIDSuccess());
//     }
//
//     /*  final bytes = io.File(pickedFile!.path).readAsBytesSync();
//
//     imgBackID = 'data:image/${pickedFile!.name.split(".").last};base64,${base64Encode(bytes)}';
//
//     DioHelper.patchData(
//         url: signupCompanyEndPoint,
//         token: accessToken,
//         data: {"imageBase64": imgBackID}).then((value) {
//       print(value);
//       emit(BackIDSuccess());
//     }).catchError((error) {
//       print(error);
//       if (error is DioError) {
//         print(error.response!.data);
//         showToast(message: error.response!.data['message'].toString());
//       }
//       emit(BackIDError());
//     });*/
//   }
//
//   //used to delete Back National Identification
//   Future<void> deleteBackID(context) async {
//     pickedBackID = null;
//     SignupCubit.get(context).backIdImage = '';
//     emit(DeleteBackID());
//   }
//
//
//
//   String imgPassport = '';
//   XFile? pickedPassport;
//
//
//   //used to pick Passport
//   Future<void> addPassport(context) async {
//     pickedPassport = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedPassport == null)
//     {
//       emit(PassportCancel());
//       return;
//     }
//
//     else
//     {
//
//       await SignupCubit.uploadImage(pickedPassport!).then((value){
//         if(value != null){
//           SignupCubit.get(context).passportImage = value;
//         }
//       });
//       emit(PassportSuccess());
//     }
//   }
//
//   //used to delete Passport
//   Future<void> deletePassport(context) async {
//     pickedPassport = null;
//     SignupCubit.get(context).passportImage = '';
//     emit(DeletePassport());
//   }
//
//
//   String imgAccommodation = '';
//   XFile? pickedAccommodation;
//
//   //used to pick Accommodation
//   Future<void> addAccommodation(context) async {
//     pickedAccommodation = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedAccommodation == null)
//     {
//       emit(AccommodationCancel());
//       return;
//     }
//
//     else
//     {
//
//       await SignupCubit.uploadImage(pickedAccommodation!).then((value){
//         if(value != null){
//           SignupCubit.get(context).stayImage = value;
//         }
//       });
//       emit(AccommodationSuccess());
//     }
//   }
//
//   //used to delete Accommodation
//   Future<void> deleteAccommodation(context) async {
//     pickedAccommodation = null;
//     SignupCubit.get(context).stayImage = '';
//     emit(DeleteAccommodation());
//   }
//
//
//
//   //companies
//   // DateRangePickerController managerExpiredDateIDController = DateRangePickerController();
//   // DateRangePickerController managerExpiredDatePassportController = DateRangePickerController();
//   // DateRangePickerController managerExpiredDateAccommodationController = DateRangePickerController();
//
//
//   // String? selectedDateManagerExpiredID;
//   // String? selectedDateManagerExpiredPassport;
//   // String? selectedDateManagerExpiredAccommodation;
//
//
//   DateRangePickerController endLicesnceDateController = DateRangePickerController();
//   DateRangePickerController expiredDatePassportController = DateRangePickerController();
//   DateRangePickerController expiredDateAccommodationController = DateRangePickerController();
//   DateRangePickerController expiredDateIDController = DateRangePickerController();
//
//   String? selectedDateManagerExpiredCompanyTrade;
//   String? selectedExpiredPassportDate;
//   String? selectedExpiredAccommodationDate;
//   String? selectedExpiredIDDate;
//
//   String dateCount = '';
//   String range = '';
//   String rangeCount = '';
//   bool isCheck = false;
//
//   changeLunchIsCheck() {
//     emit(ChangeLunchCheckBox());
//   }
//
//
//
//   /*onSelectionChangedManagerExpiredID(DateRangePickerSelectionChangedArgs args) {
//     if (args.value is DateTime) {
//       selectedDateManagerExpiredID = args.value.toString();
//       emit(ChangedManagerExpiredID());
//     }
//   }
//   onSelectionChangedManagerExpiredPassport(DateRangePickerSelectionChangedArgs args) {
//     if (args.value is DateTime) {
//       selectedDateManagerExpiredPassport = args.value.toString();
//       emit(ChangedManagerExpiredPassport());
//     }
//   }
//   onSelectionChangedManagerExpiredDateAccommodation(DateRangePickerSelectionChangedArgs args) {
//     if (args.value is DateTime) {
//       selectedDateManagerExpiredAccommodation = args.value.toString();
//       emit(ChangedManagerExpiredDateAccommodation());
//     }
//   }
// */
//
//
//   onSelectionChangedManagerCompanyTradeExpiredID(DateRangePickerSelectionChangedArgs args) {
//     print('date kareem');
//     print(args.value.toString());
//     selectedDateManagerExpiredCompanyTrade = args.value.toString();
//     emit(ChangedManagerExpiredCompanyTrade());
//   }
//
//   onSelectionChangedExpiredID(DateRangePickerSelectionChangedArgs args) {
//     if (args.value is DateTime) {
//       selectedExpiredIDDate = args.value.toString();
//       emit(ChangedExpiredID());
//     }
//   }
//   onSelectionChangedExpiredPassport(DateRangePickerSelectionChangedArgs args) {
//     if (args.value is DateTime) {
//       print('date kareem');
//       print(args.value.toString());
//       selectedExpiredPassportDate = args.value.toString();
//       print('========> $selectedExpiredPassportDate');
//       emit(ChangedExpiredPassport());
//     }
//   }
//   onSelectionChangedExpiredDateAccommodation(DateRangePickerSelectionChangedArgs args) {
//     if (args.value is DateTime) {
//       selectedExpiredAccommodationDate = args.value.toString();
//       emit(ChangedExpiredDateAccommodation());
//     }
//   }
//
//
//
// }
