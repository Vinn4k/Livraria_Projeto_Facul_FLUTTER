class bookModel {
  String titulo;
  String desc;
  String editora;
  String linkPdf;
  String linkImg;

  bookModel({this.titulo, this.desc, this.editora, this.linkPdf, this.linkImg});

  bookModel.fromJson(Map<String, dynamic> json) {
    titulo = json['Titulo'];
    desc = json['desc'];
    editora = json['editora'];
    linkPdf = json['linkPdf'];
    linkImg = json['linkImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Titulo'] = this.titulo;
    data['desc'] = this.desc;
    data['editora'] = this.editora;
    data['linkPdf'] = this.linkPdf;
    data['linkImg'] = this.linkImg;
    return data;
  }
}
