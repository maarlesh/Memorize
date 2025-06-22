import SwiftUI

struct ContentView: View {
    let emojis : Array<String> = [
        "😂","😳", "😴", "😂", "😉", "💁🏻", "🥰", "😇", "🤩", "😡",
    ];
    @State var cardCount : Int = 4;
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [
                    GridItem(),
                    GridItem(),
    //                GridItem(), GridItem(), GridItem()
                ]){
                    ForEach(0..<cardCount, id: \.self) { index in
                        CardView(content: emojis[index])
                    }.aspectRatio(2/3, contentMode: .fit)
                }
            }
            Spacer()
            HStack{
                cardModifier(by: -1, label: "rectangle.stack.badge.minus.fill")
                Spacer()
                cardModifier(by: +1, label: "rectangle.stack.badge.plus.fill")
            }.imageScale(.large).font(.largeTitle)
        }.padding()
    }
    
    func cardModifier(by offset : Int, label : String) -> some View {
        Button(action: {
            cardCount += offset
        }) {
            Image(systemName: label)
        }.disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
}


struct CardView: View{
    var content : String;
    @State var isTurned: Bool = false;
    
    var body: some View {
        ZStack (content: {
            let base  = RoundedRectangle(cornerRadius: 12);
            Group{
                base
                    .foregroundColor(.white)
                base
                    .strokeBorder(lineWidth: 2)
                    .foregroundColor(.cyan)
                Text(content).font(.largeTitle)
            }
            base.foregroundColor(.cyan).opacity(isTurned ? 0 : 1)
        }
        ).onTapGesture {
            isTurned.toggle()
        }
    }
}

struct ContentPreview : PreviewProvider {
    static var previews : some View {
        ContentView()
    }
}
