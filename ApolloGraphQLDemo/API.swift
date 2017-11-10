//  This file was automatically generated and should not be edited.

import Apollo

public final class GetProductQuery: GraphQLQuery {
  public static let operationString =
    "query GetProduct {\n  productList {\n    __typename\n    products {\n      __typename\n      Id\n      Name\n      MainImageUrl\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["BlogAppSchema"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("productList", type: .object(ProductList.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(productList: ProductList? = nil) {
      self.init(snapshot: ["__typename": "BlogAppSchema", "productList": productList.flatMap { $0.snapshot }])
    }

    /// List of all Products
    public var productList: ProductList? {
      get {
        return (snapshot["productList"] as? Snapshot).flatMap { ProductList(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "productList")
      }
    }

    public struct ProductList: GraphQLSelectionSet {
      public static let possibleTypes = ["ProductList"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("products", type: .list(.object(Product.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(products: [Product?]? = nil) {
        self.init(snapshot: ["__typename": "ProductList", "products": products.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
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
          GraphQLField("Id", type: .nonNull(.scalar(String.self))),
          GraphQLField("Name", type: .nonNull(.scalar(String.self))),
          GraphQLField("MainImageUrl", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: String, name: String, mainImageUrl: String) {
          self.init(snapshot: ["__typename": "Product", "Id": id, "Name": name, "MainImageUrl": mainImageUrl])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return snapshot["Id"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Id")
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
      }
    }
  }
}