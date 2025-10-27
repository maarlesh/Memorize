import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel = EmojiMemorizeGame();
    
    @State var cardCount : Int = 4;
    @State private var shuffledEmojis: [String] = []
    var body: some View {
        VStack{
            Text(
                "Memorize!"
            ).font(.largeTitle)
            ScrollView{
                LazyVGrid(columns: [
                    GridItem(),
                    GridItem(),
                ]){
                    ForEach(viewModel.cards.indices, id: \.self) { index in
                        CardView(viewModel.cards[index])
                    }.aspectRatio(2/3, contentMode: .fit)
                }
            }
            HStack{
                ForEach(MemorizeTheme.allCases, id: \.self){
                    theme in
                    Button(
                        action : {
                            viewModel.setCurrentTheme(theme: theme)
                            shuffledEmojis = theme.emojis.shuffled()
                        }
                    ) {
                        Text(theme.rawValue).font(.title3)
                    }
                     
                }
            }.padding(.vertical, 10)
            HStack{
                cardModifier(by: -1, label: "rectangle.stack.badge.minus.fill")
                Spacer()
                cardModifier(by: +1, label: "rectangle.stack.badge.plus.fill")
            }.imageScale(.large).font(.largeTitle)
        }.padding().onAppear {
            shuffledEmojis = viewModel.getCurrentTheme.emojis.shuffled()
            cardCount = min(cardCount, shuffledEmojis.count)
        }
    }
    
    func cardModifier(by offset : Int, label : String) -> some View {
        Button(action: {
            cardCount += offset
        }) {
            Image(systemName: label)
        }.disabled(cardCount + offset < 1 || cardCount + offset > viewModel.getCurrentTheme.emojis.count)
    }
}


struct CardView: View{
    var card : MemorizeGame<String>.Card
    
    init(_ card: MemorizeGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack (content: {
            let base  = RoundedRectangle(cornerRadius: 12);
            Group{
                base
                    .foregroundColor(.white)
                base
                    .strokeBorder(lineWidth: 2)
                    .foregroundColor(.cyan)
                Text(card.content).font(.largeTitle)
            }
            base.foregroundColor(.cyan).opacity(card.isFaceUp ? 0 : 1)
        }
        )
//        .onTapGesture {
//            isTurned.toggle()
//        }
    }
}

struct EmojiMemoryGameViewPreview : PreviewProvider {
    static var previews : some View {
        EmojiMemoryGameView()
    }
}

