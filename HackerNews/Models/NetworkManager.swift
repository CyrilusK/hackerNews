import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchdata() -> Void {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, responce, error  in
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let decodedData = try decoder.decode(Data.self, from: data)
                        DispatchQueue.main.async {
                            self.posts = decodedData.hits
                        }
                    }
                    catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
    
}
