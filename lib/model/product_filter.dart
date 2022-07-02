class ProductFilter {
  String? orderBy;
  int? page;
  int? perPage;
  String? search;
  int? brandIds;

  ProductFilter({this.orderBy, this.page, this.perPage, this.search,this.brandIds});

  ProductFilter.fromJson(Map<String, dynamic> json) {
    orderBy = json['order_by'];
    page = json['page'];
    perPage = json['per_page'];
    search = json['search'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_by'] = orderBy;
    data['page'] = page;
    data['per_page'] = perPage;
    if (search != null) {
      data['search'] = search;
    }
    if(brandIds!=0){
      data['brand_ids']=brandIds;
    }
    return data;
  }
}
