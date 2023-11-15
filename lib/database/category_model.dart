class CategoryModel{
  final int? id;
  final String name;
  final int iconData;
  final int color;

  CategoryModel({this.id, required this.name,required this.iconData, required this.color});

  factory CategoryModel.fromJson(Map<String,dynamic> json) => CategoryModel(
      id: json['id'],
      name: json['name'],
      iconData: json['iconData'],
      color: json['color']
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'iconData': iconData,
    'color': color
  };

  String toString()
  {
    return '$name $color';
  }
}