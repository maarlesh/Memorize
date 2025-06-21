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
        }.padding(12)
    }
}


struct CardView: View{
    @State var isTurned: Bool = false;
    
    var body: some View {
        ZStack (content: {
            let base  = RoundedRectangle(cornerRadius: 12);
            if isTurned {
                base
                    .foregroundColor(.white)
                base
                    .strokeBorder(lineWidth: 2)
                    .foregroundColor(.cyan)
                Text("❤️").font(.largeTitle)
            }else{
                base.foregroundColor(.cyan)
            }
        }
        ).onTapGesture {
            isTurned.toggle()
        }
        .frame(height: 200)
    }
}

struct ContentPreview : PreviewProvider {
    static var previews : some View {
        ContentView()
    }
}
