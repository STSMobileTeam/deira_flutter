import 'package:deira_flutter/View/bloc/citysearchbloc/citysearch_bloc.dart';
import 'package:deira_flutter/View/bloc/loginscreenbloc/login_screen_bloc.dart';
import 'package:deira_flutter/View/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Helper/Colors.dart';
import '../../Helper/size_config.dart';

class CitySearch extends StatefulWidget {
  const CitySearch({Key? key}) : super(key: key);

  @override
  State<CitySearch> createState() => _CitySearchState();
}

class _CitySearchState extends State<CitySearch> {
  late CitysearchBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = BlocProvider.of<CitysearchBloc>(context);
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primary_blue,
      body: SafeArea(
        child: BlocListener<CitysearchBloc, CitysearchState>(
          bloc: bloc,
          listener: (context, state) {
            // TODO: implement listener
          },
          child: BlocBuilder<CitysearchBloc, CitysearchState>(
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    height: SizeConfig.blockSizeVertical! * 8,
                    color: primary_blue,
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical! * 1.5,
                        horizontal: SizeConfig.blockSizeHorizontal! * 2.3),
                    child: Container(
                      color: Colors.white,
                      height: SizeConfig.blockSizeVertical! * 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                            ),
                            color: Colors.black,
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                          ),
                          Expanded(
                            child: TextField(
                              controller: bloc.cityname,
                              decoration: const InputDecoration(
                                  hintText: 'Search for city here'),
                              onChanged: (text) {
                                if (text.length > 2) {
                                  bloc.IsResponceCame = false;
                                  bloc.add(CitysearchLoadingEvent());
                                }else{
                                  setState(() {
                                    bloc.IsResponceCame = false;
                                    bloc.List_AirCode.clear();
                                  });
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: bloc.IsResponceCame ?
                      Container(color: grayBg, child: ListView.builder(
                          padding: const EdgeInsets.only(
                              bottom: kFloatingActionButtonMargin + 48),
                          shrinkWrap: true,
                          itemCount: bloc.List_AirCode.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                Navigator.pop(context,"${bloc.List_AirCode[index].cityCode}~${bloc.List_AirCode[index].citySEARCHNAME}");
                              },
                              child: Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                color: Colors.white,
                                child: Container(
                                    width: SizeConfig.blockSizeHorizontal! * 100,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 18, right: 15, bottom: 15, top: 15),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                           decoration: BoxDecoration(
                                             color: primary_blue,
                                             borderRadius: BorderRadius.circular(3.0),
                                           ),
                                           child: Center(child: CustomText(text: bloc.List_AirCode[index].cityCode,color: Colors.white,weight: FontWeight.bold,)),
                                           width: SizeConfig.blockSizeHorizontal!*12,
                                           padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeHorizontal!*2),
                                         ),
                                          SizedBox(width: SizeConfig.blockSizeHorizontal!*2,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                text: bloc.List_AirCode[index].citySEARCHNAME,
                                              ),
                                              SizedBox(height: SizeConfig.blockSizeVertical!*0.5,),
                                              CustomText(
                                                text: bloc.List_AirCode[index].cityName,
                                                size: 12,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                            );
                          }),) : Container(color: Colors.white,)
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
