import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:zhishinetflutter/model/suit_list_model.dart';
import 'package:zhishinetflutter/provider/syn_page_provider.dart';

class SynPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    STSSuitListModel suitListModel = Provide.value<SynPageProvider>(context).syncSuitListModel;
    
    return Provide<SynPageProvider>(
      builder: (context, child, val){
        if(suitListModel.rows!=null && suitListModel.rows.length > 0) {
          return ListView.builder(
              itemCount: suitListModel.rows.length,
              itemBuilder: (context, index) {
                return _getSuitItem(context, suitListModel.rows, index);
              }
          );
        }else{
          return Center(
            child: Text('暂无数据'),
          );
        }
    },);
  }

  Widget _getSuitItem(BuildContext context, List<Rows> rows, int index) {
    return Container(
      child: ListTile(
        title: Text(rows[index].title),
        subtitle: Text('${rows[index].endDate}'),
        trailing: Text('${rows[index].statusId == 1?'未完成':'已完成'}'),
        onTap: (){
          print(rows[index].sessionUserTrackingId);
        },
      ),
    );
  }
}
