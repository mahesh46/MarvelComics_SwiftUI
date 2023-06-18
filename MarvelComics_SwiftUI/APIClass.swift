//
//  APIClass.swift
//  MarvelComics_SwiftUI
//
//  Created by mahesh lad on 04/06/2023.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badID
}

class APIClass: ObservableObject {
    
   @Published var CommicBooks : [Result] = []
    
    func fetchTumbnails() async -> [Result]? {
        let privatekey = "933604fa90349e35cf1246042ba170776cad2e4b"
        let apikey = "4ba1cbace5d7aecc645eed0740dcaf25"
        let ts = Date().timeIntervalSince1970.description
        let hash = "\(ts)\(privatekey)\(apikey)".md5()
    
        guard let url = URL(string: "https://gateway.marvel.com/v1/public/comics?ts=\(ts)&apikey=\(apikey)&hash=\(hash)") else { return nil }
        print(url)
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                print("badid")
                //throw NetworkError.badID
                return nil
            }
            let commicResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
    
            await MainActor.run(body: {
                CommicBooks = commicResponse?.data.results ?? []
            })
            
            return commicResponse?.data.results
        } catch {
            return nil
        }
    }

}
