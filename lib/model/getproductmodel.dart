class GetProductModel {
  String? message;
  Data? data;

  GetProductModel({this.message, this.data});

  GetProductModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Docs>? docs;
  bool? hasNextPage;
  bool? hasPrevPage;
  int? limit;
  int? page;
  int? totalDocs;
  int? totalPages;

  Data(
      {this.docs,
      this.hasNextPage,
      this.hasPrevPage,
      this.limit,
      this.page,
      this.totalDocs,
      this.totalPages});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['docs'] != null) {
      docs = <Docs>[];
      json['docs'].forEach((v) {
        docs!.add(new Docs.fromJson(v));
      });
    }
    hasNextPage = json['hasNextPage'];
    hasPrevPage = json['hasPrevPage'];
    limit = json['limit'];
    page = json['page'];
    totalDocs = json['totalDocs'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.docs != null) {
      data['docs'] = this.docs!.map((v) => v.toJson()).toList();
    }
    data['hasNextPage'] = this.hasNextPage;
    data['hasPrevPage'] = this.hasPrevPage;
    data['limit'] = this.limit;
    data['page'] = this.page;
    data['totalDocs'] = this.totalDocs;
    data['totalPages'] = this.totalPages;
    return data;
  }
}

class Docs {
  int? productId;
  String? productName;
  String? description;
  String? createdAt;
  bool? isDisabled;
  String? productStatus;
  String? adminApprovalStatus;
  Null? adminRemarks;
  String? updatedAt;
  List<Variants>? variants;
  Category? category;
  Brand? brand;

  Docs(
      {this.productId,
      this.productName,
      this.description,
      this.createdAt,
      this.isDisabled,
      this.productStatus,
      this.adminApprovalStatus,
      this.adminRemarks,
      this.updatedAt,
      this.variants,
      this.category,
      this.brand});

  Docs.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    description = json['description'];
    createdAt = json['createdAt'];
    isDisabled = json['isDisabled'];
    productStatus = json['product_status'];
    adminApprovalStatus = json['admin_approval_status'];
    adminRemarks = json['adminRemarks'];
    updatedAt = json['updatedAt'];
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(new Variants.fromJson(v));
      });
    }
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['description'] = this.description;
    data['createdAt'] = this.createdAt;
    data['isDisabled'] = this.isDisabled;
    data['product_status'] = this.productStatus;
    data['admin_approval_status'] = this.adminApprovalStatus;
    data['adminRemarks'] = this.adminRemarks;
    data['updatedAt'] = this.updatedAt;
    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    return data;
  }
}

class Variants {
  int? variantId;
  String? sellingPrice;
  String? mrp;
  String? tax;
  String? color;
  String? size;
  String? material;
  String? productDimensions;
  String? weight;
  String? discount;
  int? quantity;
  String? description;
  String? inStock;
  String? approvalStatus;
  bool? isDisabled;
  String? createdAt;
  String? updatedAt;
  Media? media;

  Variants(
      {this.variantId,
      this.sellingPrice,
      this.mrp,
      this.tax,
      this.color,
      this.size,
      this.material,
      this.productDimensions,
      this.weight,
      this.discount,
      this.quantity,
      this.description,
      this.inStock,
      this.approvalStatus,
      this.isDisabled,
      this.createdAt,
      this.updatedAt,
      this.media});

  Variants.fromJson(Map<String, dynamic> json) {
    variantId = json['variant_id'];
    sellingPrice = json['sellingPrice'];
    mrp = json['mrp'];
    tax = json['tax'];
    color = json['color'];
    size = json['size'];
    material = json['material'];
    productDimensions = json['productDimensions'];
    weight = json['weight'];
    discount = json['discount'];
    quantity = json['quantity'];
    description = json['description'];
    inStock = json['inStock'];
    approvalStatus = json['approvalStatus'];
    isDisabled = json['isDisabled'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    media = json['media'] != null ? new Media.fromJson(json['media']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variant_id'] = this.variantId;
    data['sellingPrice'] = this.sellingPrice;
    data['mrp'] = this.mrp;
    data['tax'] = this.tax;
    data['color'] = this.color;
    data['size'] = this.size;
    data['material'] = this.material;
    data['productDimensions'] = this.productDimensions;
    data['weight'] = this.weight;
    data['discount'] = this.discount;
    data['quantity'] = this.quantity;
    data['description'] = this.description;
    data['inStock'] = this.inStock;
    data['approvalStatus'] = this.approvalStatus;
    data['isDisabled'] = this.isDisabled;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.media != null) {
      data['media'] = this.media!.toJson();
    }
    return data;
  }
}

class Media {
  int? mediaId;
  Images? images;
  Null? videos;
  String? createdAt;
  String? updatedAt;

  Media(
      {this.mediaId, this.images, this.videos, this.createdAt, this.updatedAt});

  Media.fromJson(Map<String, dynamic> json) {
    mediaId = json['media_id'];
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    videos = json['videos'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['media_id'] = this.mediaId;
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    data['videos'] = this.videos;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Images {
  String? rearView;
  String? frontView;
  String? frontRight;
  String? rearLeft;

  Images({this.rearView, this.frontView, this.frontRight, this.rearLeft});

  Images.fromJson(Map<String, dynamic> json) {
    rearView = json['rearView'];
    frontView = json['frontView'];
    frontRight = json['frontRight'];
    rearLeft = json['rearLeft'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rearView'] = this.rearView;
    data['frontView'] = this.frontView;
    data['frontRight'] = this.frontRight;
    data['rearLeft'] = this.rearLeft;
    return data;
  }
}

class Category {
  int? categoryId;
  String? categoryName;
  String? type;
  String? categoryLogo;
  String? description;
  Null? parentId;
  String? createdAt;
  String? updatedAt;
  bool? isActive;

  Category(
      {this.categoryId,
      this.categoryName,
      this.type,
      this.categoryLogo,
      this.description,
      this.parentId,
      this.createdAt,
      this.updatedAt,
      this.isActive});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    type = json['type'];
    categoryLogo = json['category_logo'];
    description = json['description'];
    parentId = json['parent_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['type'] = this.type;
    data['category_logo'] = this.categoryLogo;
    data['description'] = this.description;
    data['parent_id'] = this.parentId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['isActive'] = this.isActive;
    return data;
  }
}

class Brand {
  int? brandId;
  String? brandName;
  String? brandLogo;
  String? description;
  String? status;
  String? createdAt;
  String? updatedAt;
  bool? isActive;

  Brand(
      {this.brandId,
      this.brandName,
      this.brandLogo,
      this.description,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.isActive});

  Brand.fromJson(Map<String, dynamic> json) {
    brandId = json['brand_id'];
    brandName = json['brand_name'];
    brandLogo = json['brand_logo'];
    description = json['description'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand_id'] = this.brandId;
    data['brand_name'] = this.brandName;
    data['brand_logo'] = this.brandLogo;
    data['description'] = this.description;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['isActive'] = this.isActive;
    return data;
  }
}
