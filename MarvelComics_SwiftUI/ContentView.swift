//
//  ContentView.swift
//  MarvelComics_SwiftUI
//
//  Created by mahesh lad on 04/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var manager = APIClass()
    
    var body: some View {
        ScrollView {
            VStack {
                
                ForEach( manager.CommicBooks, id: \.id) { result in
                    
                    if !"\(result.thumbnail.path)".contains("image_not_available") {
                        /*@START_MENU_TOKEN@*/Text(result.title)/*@END_MENU_TOKEN@*/
                            .font(.subheadline)
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        
                        AsyncImage(url: URL(string: "\(result.thumbnail.path).jpg")) { phase in // 1
                            if let image = phase.image { // 2
                                // if the image is valid
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } else if phase.error != nil { // 3
                                // some kind of error appears
                                Text("404! \n No image available 😢")
                                    .bold()
                                    .font(.title)
                                    .multilineTextAlignment(.center)
                                
                            } else { // 4
                                // showing progress view as placeholder
                                ProgressView()
                                    .font(.largeTitle)
                            }
                        }.padding()
                        
                    }
                }
            }
            .padding()
            .background(Color(white: 0.90))
            .cornerRadius(10)
            .task {
                let _  =   await manager.fetchTumbnails()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
