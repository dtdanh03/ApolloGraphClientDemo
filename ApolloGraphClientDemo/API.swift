//  This file was automatically generated and should not be edited.

import Apollo

public final class GetProductQuery: GraphQLQuery {
  public static let operationString =
    "query GetProduct {\n  products {\n    __typename\n    Name\n    MainImageUrl\n    ...ProductDetail\n  }\n}"

  public static var requestString: String { return operationString.appending(ProductDetail.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["BlogAppSchema"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("products", type: .list(.object(Product.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(products: [Product?]? = nil) {
      self.init(snapshot: ["__typename": "BlogAppSchema", "products": products.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    /// List of all Products
    public var products: [Product?]? {
      get {
        return (snapshot["products"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Product(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "products")
      }
    }

    public struct Product: GraphQLSelectionSet {
      public static let possibleTypes = ["Product"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("Name", type: .nonNull(.scalar(String.self))),
        GraphQLField("MainImageUrl", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("Brand", type: .nonNull(.scalar(String.self))),
        GraphQLField("Price", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(name: String, mainImageUrl: String, brand: String, price: String) {
        self.init(snapshot: ["__typename": "Product", "Name": name, "MainImageUrl": mainImageUrl, "Brand": brand, "Price": price])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String {
        get {
          return snapshot["Name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Name")
        }
      }

      public var mainImageUrl: String {
        get {
          return snapshot["MainImageUrl"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "MainImageUrl")
        }
      }

      public var brand: String {
        get {
          return snapshot["Brand"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Brand")
        }
      }

      public var price: String {
        get {
          return snapshot["Price"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Price")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var productDetail: ProductDetail {
          get {
            return ProductDetail(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}

public struct ProductDetail: GraphQLFragment {
  public static let fragmentString =
    "fragment ProductDetail on Product {\n  __typename\n  Brand\n  Price\n}"

  public static let possibleTypes = ["Product"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("Brand", type: .nonNull(.scalar(String.self))),
    GraphQLField("Price", type: .nonNull(.scalar(String.self))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(brand: String, price: String) {
    self.init(snapshot: ["__typename": "Product", "Brand": brand, "Price": price])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var brand: String {
    get {
      return snapshot["Brand"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "Brand")
    }
  }

  public var price: String {
    get {
      return snapshot["Price"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "Price")
    }
  }
}