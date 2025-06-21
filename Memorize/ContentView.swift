//
//  ContentView.swift
//  Memorize
//
//  Created by EI-LAP-8464 on 19/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView()
            CardView(isTurned: true)
            CardView()
            CardView()
        }
    }
}


struct CardView: View{
    var isTurned: Bool = false;
    
    var body: some View {
        ZStack {
            if isTurned {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(lineWidth: 2)
                        .foregroundColor(.cyan)
                Text("❤️").font(.largeTitle)
            }else{
                RoundedRectangle(cornerRadius: 12).foregroundColor(.cyan)
            }
        }
    }
}

struct ContentPreview : PreviewProvider {
    static var previews : some View {
        ContentView()
    }
}
