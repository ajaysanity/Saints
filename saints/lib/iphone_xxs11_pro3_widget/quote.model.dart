class Quote{
  final List<Body> quoteBody;
  Quote({this.quoteBody});

  factory Quote.fromJson(Map<String, dynamic> json){
    return Quote(
        quoteBody: parseQuote(json)
    );
  }
  static List<Body> parseQuote(quoteJson){
    var list = quoteJson['body'] as List;
    List<Body> bodyList =
        list.map((data) => Body.fromJson(data)).toList();
        return bodyList;
  }
}
class Body{
  final String quote;
  final String author;

  Body({this.quote, this.author});

  factory Body.fromJson(Map<String,dynamic> parsedJson){
    return Body(
      quote: parsedJson['quote'],
      author: parsedJson['author']
    );
  }
}