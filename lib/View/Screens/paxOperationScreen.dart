import 'package:deira_flutter/Helper/utilities.dart';
import 'package:deira_flutter/Models/PaxModel.dart';
import 'package:deira_flutter/View/widgets/customtext.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_svg/svg.dart';

import '../../Helper/Colors.dart';
import '../../Helper/size_config.dart';
import 'package:permission_handler/permission_handler.dart';

import 'mrzScreen.dart';

class PaxOperationScreen extends StatefulWidget {
  String type ;
  bool isEdit ;
  int index ;

  PaxOperationScreen({Key? key,required this.type,required this.isEdit,required this.index}) : super(key: key);

  @override
  State<PaxOperationScreen> createState() => _PaxOperationScreenState();
}

class _PaxOperationScreenState extends State<PaxOperationScreen> {

  String Gender="M";
  String Title = 'Mr';
  final _paxFormKey = GlobalKey<FormState>();

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController passportController = TextEditingController();
  TextEditingController passportExpController = TextEditingController();
  TextEditingController isscountryController = TextEditingController();

  final countryPicker =  FlCountryCodePicker(
    favorites: ['AE','IN'],
    showDialCode: true,
    showSearchBar: true,
    favoritesIcon: Icon(Icons.flag_outlined)
  );

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    if(widget.isEdit) {

      if(widget.type == "ADT"){
        Title  = Utilities.AdtPaxArrayList[widget.index].title!;
        firstnameController.text = Utilities.AdtPaxArrayList[widget.index].firstName!;
        lastnameController.text = Utilities.AdtPaxArrayList[widget.index].lastName!;
        dobController.text = Utilities.AdtPaxArrayList[widget.index].dOB!;
        nationalityController.text = Utilities.AdtPaxArrayList[widget.index].issuedContry!;
        passportController.text = Utilities.AdtPaxArrayList[widget.index].passportNo!;
        passportExpController.text = Utilities.AdtPaxArrayList[widget.index].passportExpiry!;
        isscountryController.text = Utilities.AdtPaxArrayList[widget.index].issuedContry!;
      }else if(widget.type == "CHD"){
        Title  = Utilities.ChdPaxArrayList[widget.index].title!;
        firstnameController.text = Utilities.ChdPaxArrayList[widget.index].firstName!;
        lastnameController.text = Utilities.ChdPaxArrayList[widget.index].lastName!;
        dobController.text = Utilities.ChdPaxArrayList[widget.index].dOB!;
        nationalityController.text = Utilities.ChdPaxArrayList[widget.index].issuedContry!;
        passportController.text = Utilities.ChdPaxArrayList[widget.index].passportNo!;
        passportExpController.text = Utilities.ChdPaxArrayList[widget.index].passportExpiry!;
        isscountryController.text = Utilities.ChdPaxArrayList[widget.index].issuedContry!;
      }else{
        Title  = Utilities.InfPaxArrayList[widget.index].title!;
        firstnameController.text = Utilities.InfPaxArrayList[widget.index].firstName!;
        lastnameController.text = Utilities.InfPaxArrayList[widget.index].lastName!;
        dobController.text = Utilities.InfPaxArrayList[widget.index].dOB!;
        nationalityController.text = Utilities.InfPaxArrayList[widget.index].issuedContry!;
        passportController.text = Utilities.InfPaxArrayList[widget.index].passportNo!;
        passportExpController.text = Utilities.InfPaxArrayList[widget.index].passportExpiry!;
        isscountryController.text = Utilities.InfPaxArrayList[widget.index].issuedContry!;
      }

    }

    if(widget.type == 'ADT') {
      Title = 'Mr';
    }else{
      Title = 'Mstr';
    }



  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: smokewhite,
      appBar: AppBar(
        backgroundColor: primary_blue,
        iconTheme: const IconThemeData(color: Colors.blueAccent),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        title: const Text(
          "Create Passenger",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
      ),
      body: Form(
        key: _paxFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Card(
                elevation: 2,
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical!*1.5,bottom: SizeConfig.blockSizeVertical!*3,left: SizeConfig.blockSizeHorizontal!*2.5,right: SizeConfig.blockSizeHorizontal!*2.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal!*2),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        widget.type == 'ADT' ? Column(
                          children: [
                            SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical!*0.8,horizontal: SizeConfig.blockSizeHorizontal!*2.5),
                                  child: CustomText(
                                    text:
                                    widget.isEdit && widget.type == "ADT" ? "Adult ${widget.index+1}" :
                                    !widget.isEdit && widget.type == "ADT" ? "Adult ${Utilities.AdtPaxArrayList.length+1}" : "XXXX",
                                    color: Colors.white,
                                    size: SizeConfig.screenWidth!*small_text,),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: primary_blue,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CameraSettings()));
                                  },
                                  child: SvgPicture.asset(
                                    'assets/images/barcode.svg',
                                    width: 42.0,
                                    height: 42.0,
                                    color: primary_blue,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                            Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      Title = "Mr";
                                      Gender = "M";
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Title == "Mr" ? primary_blue : Colors.white,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                                      border: Border.all(color: Title == "Mr" ? Colors.transparent : primary_blue,width: 0.5),),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                                      child: Center(
                                        child: Text('Mr',
                                            style: TextStyle(fontSize: SizeConfig.screenWidth!*medium_text, color:  Title == "Mr" ? Colors.white : primary_blue)),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      Title = "Ms";
                                      Gender = "F";
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Title == "Ms" ? primary_blue : Colors.white,
                                      borderRadius: BorderRadius.circular(0.0),
                                      border: Border.all(color: Title == "Ms" ? Colors.transparent : primary_blue,width: 0.5),),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10 ),
                                      child: Center(
                                        child: Text('Ms',
                                            style: TextStyle(fontSize: SizeConfig.screenWidth!*medium_text, color:  Title == "Ms" ? Colors.white : primary_blue)),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      Title = "Mrs";
                                      Gender = "F";
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Title == "Mrs" ? primary_blue : Colors.white,
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                                      border: Border.all(color: Title == "Mrs" ? Colors.transparent : primary_blue,width: 0.5),),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                                      child: Center(
                                        child: Text('Mrs',
                                            style: TextStyle(fontSize: SizeConfig.screenWidth!*medium_text, color:  Title == "Mrs" ? Colors.white : primary_blue)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*2.5,),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: SizeConfig.blockSizeVertical!*5.5,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return '';
                                        }
                                      },
                                      controller: firstnameController,
                                      textAlign: TextAlign.left,
                                      decoration: InputDecoration(
                                        errorStyle: const TextStyle(fontSize: 0.01),
                                        labelText: "First/Middle Name",
                                        labelStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          new BorderRadius.circular(
                                              5.0),
                                          borderSide: BorderSide(
                                              color: textgrey),
                                        ),
                                        focusedBorder:
                                        OutlineInputBorder(
                                          borderRadius:
                                          new BorderRadius.circular(
                                              5.0),
                                          borderSide: BorderSide(
                                              color: textgrey),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: SizeConfig.blockSizeHorizontal!*2,),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: SizeConfig.blockSizeVertical!*5.5,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return '';
                                        }
                                      },
                                      controller: lastnameController,
                                      textAlign: TextAlign.left,
                                      decoration: InputDecoration(
                                        errorStyle: const TextStyle(fontSize: 0.01),
                                        labelText: "Last Name",
                                        labelStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          new BorderRadius.circular(
                                              5.0),
                                          borderSide: BorderSide(
                                              color: textgrey),
                                        ),
                                        focusedBorder:
                                        OutlineInputBorder(
                                          borderRadius:
                                          new BorderRadius.circular(
                                              5.0),
                                          borderSide: BorderSide(
                                              color: textgrey),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*2.5,),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical!*5.5,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () async {
                                  var datePicked = await DatePicker.showSimpleDatePicker(
                                    context,
                                    initialDate: DateTime(1994),
                                    firstDate: DateTime(1960),
                                    lastDate: DateTime(2012),
                                    dateFormat: "dd-MMMM-yyyy",
                                    locale: DateTimePickerLocale.en_us,
                                    looping: true,
                                  );
                                  setState(() {
                                    dobController.text = Utilities.dateconversion('dd/MM/yyyy',datePicked.toString());;
                                  });
                                },
                                child: IgnorePointer(
                                  child: TextFormField(
                                    readOnly: true,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '';
                                      }
                                    },
                                    controller: dobController,
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      errorStyle: const TextStyle(fontSize: 0.01),
                                      labelText: "Date of birth",
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        new BorderRadius.circular(
                                            5.0),
                                        borderSide: BorderSide(
                                            color: textgrey),
                                      ),
                                      focusedBorder:
                                      OutlineInputBorder(
                                        borderRadius:
                                        new BorderRadius.circular(
                                            5.0),
                                        borderSide: BorderSide(
                                            color: textgrey),
                                      ),
                                      suffixIcon:Container(
                                        child: Icon(Icons.calendar_month),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                            Align(alignment: Alignment.centerLeft,child: CustomText(text: "Passport Details",weight: FontWeight.bold,size: SizeConfig.screenWidth!*small_text)),
                            SizedBox(height: SizeConfig.blockSizeVertical!*2.5,),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical!*5.5,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () async {

                                  final code = await countryPicker.showPicker(context: context);
                                  // Null check
                                  if (code != null) {
                                    setState(() {
                                      nationalityController.text = code!.name.toString();
                                    });
                                  }

                                },
                                child: IgnorePointer(
                                  child: TextFormField(
                                    readOnly: true,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '';
                                      }
                                    },
                                    controller: nationalityController,
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      errorStyle: const TextStyle(fontSize: 0.01),
                                      labelText: "Nationality",
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        new BorderRadius.circular(
                                            5.0),
                                        borderSide: BorderSide(
                                            color: textgrey),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                        new BorderRadius.circular(
                                            5.0),
                                        borderSide: BorderSide(
                                            color: textgrey),
                                      ),
                                      suffixIcon:Container(
                                        child: Icon(Icons.arrow_drop_down_sharp),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*2.5,),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical!*5.5,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return '';
                                  }
                                },
                                controller: passportController,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  errorStyle: const TextStyle(fontSize: 0.01),
                                  labelText: "Passport Number",
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                    new BorderRadius.circular(
                                        5.0),
                                    borderSide: BorderSide(
                                        color: textgrey),
                                  ),
                                  focusedBorder:
                                  OutlineInputBorder(
                                    borderRadius:
                                    new BorderRadius.circular(
                                        5.0),
                                    borderSide: BorderSide(
                                        color: textgrey),
                                  ),
                                  suffixIcon:Container(
                                    child: Icon(Icons.flight),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*2.5),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical!*5.5,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () async {
                                  var datePicked = await DatePicker.showSimpleDatePicker(
                                    context,
                                    initialDate: DateTime(1994),
                                    firstDate: DateTime(1960),
                                    lastDate: DateTime(2012),
                                    dateFormat: "dd-MMMM-yyyy",
                                    locale: DateTimePickerLocale.en_us,
                                    looping: true,
                                  );
                                  setState(() {
                                    passportExpController.text = Utilities.dateconversion('dd/MM/yyyy',datePicked.toString());;
                                  });
                                },
                                child: IgnorePointer(
                                  child: TextFormField(
                                    readOnly: true,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '';
                                      }
                                    },
                                    controller: passportExpController,
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      errorStyle: const TextStyle(fontSize: 0.01),
                                      labelText: "Passport Expiry",
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        new BorderRadius.circular(
                                            5.0),
                                        borderSide: BorderSide(
                                            color: textgrey),
                                      ),
                                      focusedBorder:
                                      OutlineInputBorder(
                                        borderRadius:
                                        new BorderRadius.circular(
                                            5.0),
                                        borderSide: BorderSide(
                                            color: textgrey),
                                      ),
                                      suffixIcon:Container(
                                        child: Icon(Icons.calendar_month),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*2.5,),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical!*5.5,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () async {
                                  final code = await countryPicker.showPicker(context: context);
                                  // Null check
                                  if (code != null) {
                                    setState(() {
                                      isscountryController.text =
                                          code.name.toString();
                                    });
                                  }

                                },
                                child: IgnorePointer(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '';
                                      }
                                    },
                                    controller: isscountryController,
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      errorStyle: const TextStyle(fontSize: 0.01),
                                      labelText: "Issued Country",
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: new BorderRadius.circular(5.0),
                                        borderSide: BorderSide(color: textgrey),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                        new BorderRadius.circular(
                                            5.0),
                                        borderSide: BorderSide(
                                            color: textgrey),
                                      ),
                                      suffixIcon:Container(
                                        child: Icon(Icons.arrow_drop_down_sharp),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*3,),
                            Align(
                              alignment: Alignment.center,
                              child: MaterialButton(
                                minWidth: SizeConfig.blockSizeHorizontal! * 100,
                                height: SizeConfig.blockSizeVertical! * 7,
                                padding: const EdgeInsets.only(
                                    left: 30, right: 30, top: 14, bottom: 14),
                                child:  Text(
                                  'SAVE',
                                  style: TextStyle(fontSize: SizeConfig.screenWidth!*large_text,fontWeight: FontWeight.bold),
                                ),
                                color: primary_blue,
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                onPressed: () {

                                  if (_paxFormKey.currentState!.validate()) {

                                    if(widget.isEdit) {

                                      int RefNo = widget.index + 1;

                                      PaxModel paxmodel = Utilities.AdtPaxArrayList[widget.index];

                                      paxmodel.paxRefNumber = RefNo.toString();
                                      paxmodel.title= Title;
                                      paxmodel.firstName= firstnameController.text.trim();
                                      paxmodel.lastName= lastnameController.text.trim();
                                      paxmodel.age= "";
                                      paxmodel.dOB= dobController.text.trim();
                                      paxmodel.gender= Gender;
                                      paxmodel.paxType= widget.type;
                                      paxmodel.passportNo= passportController.text.trim();
                                      paxmodel.passportExpiry= passportExpController.text.trim();
                                      paxmodel.placeOfBirth= isscountryController.text.trim();
                                      paxmodel.infantRef= "";
                                      paxmodel.issuedContry= isscountryController.text.trim();

                                      Navigator.pop(context, "Changes Made");

                                      Utilities.showToast("Passenger Updated");


                                    }else {

                                      int RefNo = Utilities.AdtPaxArrayList.length + 1;
                                      PaxModel paxmodel = PaxModel(
                                          paxRefNumber: RefNo.toString(),
                                          title: Title,
                                          firstName: firstnameController.text.trim(),
                                          lastName: lastnameController.text.trim(),
                                          age: "",
                                          dOB: dobController.text.trim(),
                                          gender: Gender, paxType: widget.type,
                                          passportNo: passportController.text.trim(),
                                          passportExpiry: passportExpController.text.trim(),
                                          placeOfBirth: isscountryController.text.trim(),
                                          infantRef: "",
                                          issuedContry: isscountryController.text.trim());

                                      Utilities.AdtPaxArrayList.add(paxmodel);

                                      Navigator.pop(context, "Changes Made");

                                      Utilities.showToast("Passenger Saved");

                                    }

                                  }else{
                                    print("All Field mandatory");
                                  }

                                },
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*3,),
                          ],
                        ) :
                        widget.type == 'CHD' ? Column(
                          children: [
                            SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical!*0.8,horizontal: SizeConfig.blockSizeHorizontal!*2.5),
                                  child: CustomText(
                                    text:
                                    widget.isEdit && widget.type == "CHD" ? "Child ${widget.index+1}" :
                                    !widget.isEdit && widget.type == "CHD" ? "Child ${Utilities.ChdPaxArrayList.length+1}" : "XXXX",
                                    color: Colors.white,
                                    size: SizeConfig.screenWidth!*small_text,),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: primary_blue,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CameraSettings()));
                                  },
                                  child: SvgPicture.asset(
                                    'assets/images/barcode.svg',
                                    width: 42.0,
                                    height: 42.0,
                                    color: primary_blue,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                            Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      Title = "Mstr";
                                      Gender = "M";
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Title == "Mstr" ? primary_blue : Colors.white,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                                      border: Border.all(color: Title == "Mstr" ? Colors.transparent : primary_blue,width: 0.5),),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                                      child: Center(
                                        child: Text('Mstr',
                                            style: TextStyle(fontSize: SizeConfig.screenWidth!*medium_text, color:  Title == "Mstr" ? Colors.white : primary_blue)),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      Title = "Ms";
                                      Gender = "F";
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Title == "Ms" ? primary_blue : Colors.white,
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                                      border: Border.all(color: Title == "Ms" ? Colors.transparent : primary_blue,width: 0.5),),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10 ),
                                      child: Center(
                                        child: Text('Ms',
                                            style: TextStyle(fontSize: SizeConfig.screenWidth!*medium_text, color:  Title == "Ms" ? Colors.white : primary_blue)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*2.5,),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: SizeConfig.blockSizeVertical!*5.5,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return '';
                                        }
                                      },
                                      controller: firstnameController,
                                      textAlign: TextAlign.left,
                                      decoration: InputDecoration(
                                        errorStyle: const TextStyle(fontSize: 0.01),
                                        labelText: "First/Middle Name",
                                        labelStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          new BorderRadius.circular(
                                              5.0),
                                          borderSide: BorderSide(
                                              color: textgrey),
                                        ),
                                        focusedBorder:
                                        OutlineInputBorder(
                                          borderRadius:
                                          new BorderRadius.circular(
                                              5.0),
                                          borderSide: BorderSide(
                                              color: textgrey),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: SizeConfig.blockSizeHorizontal!*2,),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: SizeConfig.blockSizeVertical!*5.5,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return '';
                                        }
                                      },
                                      controller: lastnameController,
                                      textAlign: TextAlign.left,
                                      decoration: InputDecoration(
                                        errorStyle: const TextStyle(fontSize: 0.01),
                                        labelText: "Last Name",
                                        labelStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          new BorderRadius.circular(
                                              5.0),
                                          borderSide: BorderSide(
                                              color: textgrey),
                                        ),
                                        focusedBorder:
                                        OutlineInputBorder(
                                          borderRadius:
                                          new BorderRadius.circular(
                                              5.0),
                                          borderSide: BorderSide(
                                              color: textgrey),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*2.5,),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical!*5.5,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () async {
                                  var datePicked = await DatePicker.showSimpleDatePicker(
                                    context,
                                    initialDate: DateTime(1994),
                                    firstDate: DateTime(1960),
                                    lastDate: DateTime(2012),
                                    dateFormat: "dd-MMMM-yyyy",
                                    locale: DateTimePickerLocale.en_us,
                                    looping: true,
                                  );
                                  setState(() {
                                    dobController.text = Utilities.dateconversion('dd/MM/yyyy',datePicked.toString());;
                                  });
                                },
                                child: IgnorePointer(
                                  child: TextFormField(
                                    readOnly: true,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '';
                                      }
                                    },
                                    controller: dobController,
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      errorStyle: const TextStyle(fontSize: 0.01),
                                      labelText: "Date of birth",
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        new BorderRadius.circular(
                                            5.0),
                                        borderSide: BorderSide(
                                            color: textgrey),
                                      ),
                                      focusedBorder:
                                      OutlineInputBorder(
                                        borderRadius:
                                        new BorderRadius.circular(
                                            5.0),
                                        borderSide: BorderSide(
                                            color: textgrey),
                                      ),
                                      suffixIcon:Container(
                                        child: Icon(Icons.calendar_month),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                            Align(alignment: Alignment.centerLeft,child: CustomText(text: "Passport Details",weight: FontWeight.bold,size: SizeConfig.screenWidth!*small_text)),
                            SizedBox(height: SizeConfig.blockSizeVertical!*2.5,),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical!*5.5,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () async {

                                  final code = await countryPicker.showPicker(context: context);
                                  // Null check
                                  if (code != null) {
                                    setState(() {
                                      nationalityController.text = code!.name.toString();
                                    });
                                  }

                                },
                                child: IgnorePointer(
                                  child: TextFormField(
                                    readOnly: true,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '';
                                      }
                                    },
                                    controller: nationalityController,
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      errorStyle: const TextStyle(fontSize: 0.01),
                                      labelText: "Nationality",
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        new BorderRadius.circular(
                                            5.0),
                                        borderSide: BorderSide(
                                            color: textgrey),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                        new BorderRadius.circular(
                                            5.0),
                                        borderSide: BorderSide(
                                            color: textgrey),
                                      ),
                                      suffixIcon:Container(
                                        child: Icon(Icons.arrow_drop_down_sharp),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*2.5,),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical!*5.5,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return '';
                                  }
                                },
                                controller: passportController,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  errorStyle: const TextStyle(fontSize: 0.01),
                                  labelText: "Passport Number",
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                    new BorderRadius.circular(
                                        5.0),
                                    borderSide: BorderSide(
                                        color: textgrey),
                                  ),
                                  focusedBorder:
                                  OutlineInputBorder(
                                    borderRadius:
                                    new BorderRadius.circular(
                                        5.0),
                                    borderSide: BorderSide(
                                        color: textgrey),
                                  ),
                                  suffixIcon:Container(
                                    child: Icon(Icons.flight),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*2.5),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical!*5.5,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () async {
                                  var datePicked = await DatePicker.showSimpleDatePicker(
                                    context,
                                    initialDate: DateTime(1994),
                                    firstDate: DateTime(1960),
                                    lastDate: DateTime(2012),
                                    dateFormat: "dd-MMMM-yyyy",
                                    locale: DateTimePickerLocale.en_us,
                                    looping: true,
                                  );
                                  setState(() {
                                    passportExpController.text = Utilities.dateconversion('dd/MM/yyyy',datePicked.toString());;
                                  });
                                },
                                child: IgnorePointer(
                                  child: TextFormField(
                                    readOnly: true,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '';
                                      }
                                    },
                                    controller: passportExpController,
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      errorStyle: const TextStyle(fontSize: 0.01),
                                      labelText: "Passport Expiry",
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        new BorderRadius.circular(
                                            5.0),
                                        borderSide: BorderSide(
                                            color: textgrey),
                                      ),
                                      focusedBorder:
                                      OutlineInputBorder(
                                        borderRadius:
                                        new BorderRadius.circular(
                                            5.0),
                                        borderSide: BorderSide(
                                            color: textgrey),
                                      ),
                                      suffixIcon:Container(
                                        child: Icon(Icons.calendar_month),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*2.5,),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical!*5.5,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () async {
                                  final code = await countryPicker.showPicker(context: context);
                                  // Null check
                                  if (code != null) {
                                    setState(() {
                                      isscountryController.text =
                                          code.name.toString();
                                    });
                                  }

                                },
                                child: IgnorePointer(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '';
                                      }
                                    },
                                    controller: isscountryController,
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      errorStyle: const TextStyle(fontSize: 0.01),
                                      labelText: "Issued Country",
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: new BorderRadius.circular(5.0),
                                        borderSide: BorderSide(color: textgrey),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                        new BorderRadius.circular(
                                            5.0),
                                        borderSide: BorderSide(
                                            color: textgrey),
                                      ),
                                      suffixIcon:Container(
                                        child: Icon(Icons.arrow_drop_down_sharp),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*3,),
                            Align(
                              alignment: Alignment.center,
                              child: MaterialButton(
                                minWidth: SizeConfig.blockSizeHorizontal! * 100,
                                height: SizeConfig.blockSizeVertical! * 7,
                                padding: const EdgeInsets.only(
                                    left: 30, right: 30, top: 14, bottom: 14),
                                child:  Text(
                                  'SAVE',
                                  style: TextStyle(fontSize: SizeConfig.screenWidth!*large_text,fontWeight: FontWeight.bold),
                                ),
                                color: primary_blue,
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                onPressed: () {

                                  if (_paxFormKey.currentState!.validate()) {

                                    if(widget.isEdit) {

                                      int RefNo = widget.index + 1;

                                      PaxModel paxmodel = Utilities.ChdPaxArrayList[widget.index];

                                      paxmodel.paxRefNumber = RefNo.toString();
                                      paxmodel.title= Title;
                                      paxmodel.firstName= firstnameController.text.trim();
                                      paxmodel.lastName= lastnameController.text.trim();
                                      paxmodel.age= "";
                                      paxmodel.dOB= dobController.text.trim();
                                      paxmodel.gender= Gender;
                                      paxmodel.paxType= widget.type;
                                      paxmodel.passportNo= passportController.text.trim();
                                      paxmodel.passportExpiry= passportExpController.text.trim();
                                      paxmodel.placeOfBirth= isscountryController.text.trim();
                                      paxmodel.infantRef= "";
                                      paxmodel.issuedContry= isscountryController.text.trim();

                                      Navigator.pop(context, "Changes Made");

                                      Utilities.showToast("Passenger Updated");


                                    }else {

                                      int RefNo = Utilities.ChdPaxArrayList.length + 1;
                                      PaxModel paxmodel = PaxModel(
                                          paxRefNumber: RefNo.toString(),
                                          title: Gender,
                                          firstName: firstnameController.text.trim(),
                                          lastName: lastnameController.text.trim(),
                                          age: "",
                                          dOB: dobController.text.trim(),
                                          gender: Gender, paxType: widget.type,
                                          passportNo: passportController.text.trim(),
                                          passportExpiry: passportExpController.text.trim(),
                                          placeOfBirth: isscountryController.text.trim(),
                                          infantRef: "",
                                          issuedContry: isscountryController.text.trim());

                                      Utilities.ChdPaxArrayList.add(paxmodel);

                                      Navigator.pop(context, "Changes Made");

                                      Utilities.showToast("Passenger Saved");

                                    }

                                  }else{
                                    print("All Field mandatory");
                                  }

                                },
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*3,),
                          ],
                        ) :
                        Column(
                          children: [
                            SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical!*0.8,horizontal: SizeConfig.blockSizeHorizontal!*2.5),
                                  child: CustomText(
                                    text:
                                    widget.isEdit && widget.type == "INF" ? "Infant ${widget.index+1}" :
                                    !widget.isEdit && widget.type == "INF" ? "Infant ${Utilities.InfPaxArrayList.length+1}" : "XXXX",
                                    color: Colors.white,
                                    size: SizeConfig.screenWidth!*small_text,),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: primary_blue,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CameraSettings()));
                                  },
                                  child: SvgPicture.asset(
                                    'assets/images/barcode.svg',
                                    width: 42.0,
                                    height: 42.0,
                                    color: primary_blue,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                            Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      Title = "Mstr";
                                      Gender = "M";
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Title == "Mstr" ? primary_blue : Colors.white,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                                      border: Border.all(color: Title == "Mstr" ? Colors.transparent : primary_blue,width: 0.5),),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                                      child: Center(
                                        child: Text('Mstr',
                                            style: TextStyle(fontSize: SizeConfig.screenWidth!*medium_text, color:  Title == "Mstr" ? Colors.white : primary_blue)),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      Title = "Ms";
                                      Gender = "F";
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Title == "Ms" ? primary_blue : Colors.white,
                                      borderRadius: BorderRadius.circular(0.0),
                                      border: Border.all(color: Title == "Ms" ? Colors.transparent : primary_blue,width: 0.5),),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10 ),
                                      child: Center(
                                        child: Text('Ms',
                                            style: TextStyle(fontSize: SizeConfig.screenWidth!*medium_text, color:  Title == "Ms" ? Colors.white : primary_blue)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*2.5,),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: SizeConfig.blockSizeVertical!*5.5,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return '';
                                        }
                                      },
                                      controller: firstnameController,
                                      textAlign: TextAlign.left,
                                      decoration: InputDecoration(
                                        errorStyle: const TextStyle(fontSize: 0.01),
                                        labelText: "First/Middle Name",
                                        labelStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          new BorderRadius.circular(
                                              5.0),
                                          borderSide: BorderSide(
                                              color: textgrey),
                                        ),
                                        focusedBorder:
                                        OutlineInputBorder(
                                          borderRadius:
                                          new BorderRadius.circular(
                                              5.0),
                                          borderSide: BorderSide(
                                              color: textgrey),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: SizeConfig.blockSizeHorizontal!*2,),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: SizeConfig.blockSizeVertical!*5.5,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return '';
                                        }
                                      },
                                      controller: lastnameController,
                                      textAlign: TextAlign.left,
                                      decoration: InputDecoration(
                                        errorStyle: const TextStyle(fontSize: 0.01),
                                        labelText: "Last Name",
                                        labelStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          new BorderRadius.circular(
                                              5.0),
                                          borderSide: BorderSide(
                                              color: textgrey),
                                        ),
                                        focusedBorder:
                                        OutlineInputBorder(
                                          borderRadius:
                                          new BorderRadius.circular(
                                              5.0),
                                          borderSide: BorderSide(
                                              color: textgrey),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*2.5,),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical!*5.5,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () async {
                                  var datePicked = await DatePicker.showSimpleDatePicker(
                                    context,
                                    initialDate: DateTime(1994),
                                    firstDate: DateTime(1960),
                                    lastDate: DateTime(2012),
                                    dateFormat: "dd-MMMM-yyyy",
                                    locale: DateTimePickerLocale.en_us,
                                    looping: true,
                                  );
                                  setState(() {
                                    dobController.text = Utilities.dateconversion('dd/MM/yyyy',datePicked.toString());;
                                  });
                                },
                                child: IgnorePointer(
                                  child: TextFormField(
                                    readOnly: true,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '';
                                      }
                                    },
                                    controller: dobController,
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      errorStyle: const TextStyle(fontSize: 0.01),
                                      labelText: "Date of birth",
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        new BorderRadius.circular(
                                            5.0),
                                        borderSide: BorderSide(
                                            color: textgrey),
                                      ),
                                      focusedBorder:
                                      OutlineInputBorder(
                                        borderRadius:
                                        new BorderRadius.circular(
                                            5.0),
                                        borderSide: BorderSide(
                                            color: textgrey),
                                      ),
                                      suffixIcon:Container(
                                        child: Icon(Icons.calendar_month),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                            Align(alignment: Alignment.centerLeft,child: CustomText(text: "Passport Details",weight: FontWeight.bold,size: SizeConfig.screenWidth!*small_text)),
                            SizedBox(height: SizeConfig.blockSizeVertical!*2.5,),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical!*5.5,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () async {

                                  final code = await countryPicker.showPicker(context: context);
                                  // Null check
                                  if (code != null) {
                                    setState(() {
                                      nationalityController.text = code!.name.toString();
                                    });
                                  }

                                },
                                child: IgnorePointer(
                                  child: TextFormField(
                                    readOnly: true,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '';
                                      }
                                    },
                                    controller: nationalityController,
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      errorStyle: const TextStyle(fontSize: 0.01),
                                      labelText: "Nationality",
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        new BorderRadius.circular(
                                            5.0),
                                        borderSide: BorderSide(
                                            color: textgrey),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                        new BorderRadius.circular(
                                            5.0),
                                        borderSide: BorderSide(
                                            color: textgrey),
                                      ),
                                      suffixIcon:Container(
                                        child: Icon(Icons.arrow_drop_down_sharp),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*2.5,),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical!*5.5,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return '';
                                  }
                                },
                                controller: passportController,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  errorStyle: const TextStyle(fontSize: 0.01),
                                  labelText: "Passport Number",
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                    new BorderRadius.circular(
                                        5.0),
                                    borderSide: BorderSide(
                                        color: textgrey),
                                  ),
                                  focusedBorder:
                                  OutlineInputBorder(
                                    borderRadius:
                                    new BorderRadius.circular(
                                        5.0),
                                    borderSide: BorderSide(
                                        color: textgrey),
                                  ),
                                  suffixIcon:Container(
                                    child: Icon(Icons.flight),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*2.5),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical!*5.5,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () async {
                                  var datePicked = await DatePicker.showSimpleDatePicker(
                                    context,
                                    initialDate: DateTime(1994),
                                    firstDate: DateTime(1960),
                                    lastDate: DateTime(2012),
                                    dateFormat: "dd-MMMM-yyyy",
                                    locale: DateTimePickerLocale.en_us,
                                    looping: true,
                                  );
                                  setState(() {
                                    passportExpController.text = Utilities.dateconversion('dd/MM/yyyy',datePicked.toString());;
                                  });
                                },
                                child: IgnorePointer(
                                  child: TextFormField(
                                    readOnly: true,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '';
                                      }
                                    },
                                    controller: passportExpController,
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      errorStyle: const TextStyle(fontSize: 0.01),
                                      labelText: "Passport Expiry",
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        new BorderRadius.circular(
                                            5.0),
                                        borderSide: BorderSide(
                                            color: textgrey),
                                      ),
                                      focusedBorder:
                                      OutlineInputBorder(
                                        borderRadius:
                                        new BorderRadius.circular(
                                            5.0),
                                        borderSide: BorderSide(
                                            color: textgrey),
                                      ),
                                      suffixIcon:Container(
                                        child: Icon(Icons.calendar_month),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*2.5,),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical!*5.5,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () async {
                                  final code = await countryPicker.showPicker(context: context);
                                  // Null check
                                  if (code != null) {
                                    setState(() {
                                      isscountryController.text =
                                          code.name.toString();
                                    });
                                  }

                                },
                                child: IgnorePointer(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '';
                                      }
                                    },
                                    controller: isscountryController,
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      errorStyle: const TextStyle(fontSize: 0.01),
                                      labelText: "Issued Country",
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: new BorderRadius.circular(5.0),
                                        borderSide: BorderSide(color: textgrey),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                        new BorderRadius.circular(
                                            5.0),
                                        borderSide: BorderSide(
                                            color: textgrey),
                                      ),
                                      suffixIcon:Container(
                                        child: Icon(Icons.arrow_drop_down_sharp),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*3,),
                            Align(
                              alignment: Alignment.center,
                              child: MaterialButton(
                                minWidth: SizeConfig.blockSizeHorizontal! * 100,
                                height: SizeConfig.blockSizeVertical! * 7,
                                padding: const EdgeInsets.only(
                                    left: 30, right: 30, top: 14, bottom: 14),
                                child:  Text(
                                  'SAVE',
                                  style: TextStyle(fontSize: SizeConfig.screenWidth!*large_text,fontWeight: FontWeight.bold),
                                ),
                                color: primary_blue,
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                onPressed: () {

                                  if (_paxFormKey.currentState!.validate()) {

                                    if(widget.isEdit) {

                                      int RefNo = widget.index + 1;

                                      PaxModel paxmodel = Utilities.InfPaxArrayList[widget.index];

                                      paxmodel.paxRefNumber = RefNo.toString();
                                      paxmodel.title= Title;
                                      paxmodel.firstName= firstnameController.text.trim();
                                      paxmodel.lastName= lastnameController.text.trim();
                                      paxmodel.age= "";
                                      paxmodel.dOB= dobController.text.trim();
                                      paxmodel.gender= Gender;
                                      paxmodel.paxType= widget.type;
                                      paxmodel.passportNo= passportController.text.trim();
                                      paxmodel.passportExpiry= passportExpController.text.trim();
                                      paxmodel.placeOfBirth= isscountryController.text.trim();
                                      paxmodel.infantRef= "";
                                      paxmodel.issuedContry= isscountryController.text.trim();

                                      Navigator.pop(context, "Changes Made");

                                      Utilities.showToast("Passenger Updated");


                                    }else {

                                      int RefNo = Utilities.InfPaxArrayList.length + 1;
                                      PaxModel paxmodel = PaxModel(
                                          paxRefNumber: RefNo.toString(),
                                          title: Gender,
                                          firstName: firstnameController.text.trim(),
                                          lastName: lastnameController.text.trim(),
                                          age: "",
                                          dOB: dobController.text.trim(),
                                          gender: Gender, paxType: widget.type,
                                          passportNo: passportController.text.trim(),
                                          passportExpiry: passportExpController.text.trim(),
                                          placeOfBirth: isscountryController.text.trim(),
                                          infantRef: "",
                                          issuedContry: isscountryController.text.trim());

                                      Utilities.InfPaxArrayList.add(paxmodel);

                                      Navigator.pop(context, "Changes Made");

                                      Utilities.showToast("Passenger Saved");

                                    }

                                  }else{
                                    print("All Field mandatory");
                                  }

                                },
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical!*3,),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



}
