class FaqModel {
  List<FastAskedQuestion> data = [];

  FaqModel(this.data);

  FaqModel.fromJson(List json) {
    for (int i = 0; i < json.length; i++) {
      data.add(FastAskedQuestion.fromJson(json[i]));
    }
  }
}

class FastAskedQuestion {
  String? question;
  String? answer;
  int? faqOrder;

  FastAskedQuestion({this.question, this.answer, this.faqOrder});

  FastAskedQuestion.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
    faqOrder = json['faqOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['faqOrder'] = this.faqOrder;
    return data;
  }
}
