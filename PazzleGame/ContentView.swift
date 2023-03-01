//
//  ContentView.swift
//  PazzleGame
//
//  Created by Вячеслав Гудзенко on 26.02.2023.
//

import SwiftUI



struct ContentView: View {
    @State var size:CGSize = CGSize(width: 0, height: 0)
    @State var cropSize:CGSize = CGSize(width: 0, height: 0)
    @State var cgImage:CGImage? = nil
    @State var imageArr:[CGImage] = []
    var body: some View {
        ZStack{
            BackgroundImage()
            
                VStack {
                    let grids:[GridItem] = [
                        GridItem(.fixed(85),spacing: 0),
                        GridItem(.fixed(85),spacing: 0),
                        GridItem(.fixed(85),spacing: 0),
                        GridItem(.fixed(85),spacing: 0)
                    ]
                    ZStack {
                        RoundedRectangle(cornerRadius: 70)
                            .foregroundColor(.white)
                            .frame(width: 330,height: 330
                            )
                        
                        LazyVGrid(columns: grids,spacing: 0) {
                            ForEach(imageArr, id: \.hashValue) {
                                image in
                                Image(uiImage: UIImage(cgImage: image))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 85,height: 85)
                            }
                        }
                        CandyFrame()
                            
                            .frame(width: 340,height: 340)
                    }
                }
            
            
        }
        .onAppear {
            getImage(name: "testImage")
        }
        
        
    }
    
    private func getImage(name:String){
        let uiImage = UIImage(named: name)!
        
        for row in 0...3{
            for col in 0...3{
                let crop = CGRect(x: (uiImage.size.width / 4) * CGFloat(col), y: (uiImage.size.height / 4) * CGFloat(row), width: uiImage.size.width / 4, height: uiImage.size.height / 4)
                if let croppedImage:CGImage = uiImage.cgImage?.cropping(to: crop) {
                    imageArr.append(croppedImage)
                }
            }
        }
        
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
