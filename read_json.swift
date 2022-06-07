struct ResponseData: Decodable {
    var person: [Person]
}
struct Person : Decodable {
    var name: String
    var age: Int
}

func loadJson(filename fileName: String) -> [Person]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(ResponseData.self, from: data)

            return jsonData.person
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
