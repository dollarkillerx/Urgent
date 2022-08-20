class Statistics {
  String? requestId;
  String? code;
  List<StatisticsItem>? data;

  Statistics({this.requestId, this.code, this.data});

  Statistics.fromJson(Map<String, dynamic> json) {
    requestId = json['request_id'];
    code = json['code'];
    if (json['data'] != null) {
      data = <StatisticsItem>[];
      json['data'].forEach((v) {
        data!.add(new StatisticsItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_id'] = this.requestId;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StatisticsItem {
  String? key;
  List<String>? value;

  StatisticsItem({this.key, this.value});

  StatisticsItem.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}
