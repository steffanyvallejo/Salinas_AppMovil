
class Noticia {

  String titulo;
  String noticia;
  String path_image;

  Noticia( this.titulo, this.noticia, this.path_image );

  factory Noticia.fromJson(dynamic json) {
    return Noticia(json['titulo'] as String, json['noticia'] as String, json['path_image'] as String);
  }

}