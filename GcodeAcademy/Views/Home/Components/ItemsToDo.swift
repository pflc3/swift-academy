import SwiftUI

struct ItemsToDo: View {
    var imageIcon:String
    var title:String
    var completion: String
    var color:Color
    var body: some View {
        HStack{
            HStack{
                Image(systemName: imageIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(Color("Others"))
                    .frame(width:28)
                Text(title)
                    .font(Font.custom("PatrickHand-Regular", size: 20))
            }
            Spacer()
            Text(completion)
                .font(Font.custom("PatrickHand-Regular", size: 20))
                .foregroundStyle(color)
        }.padding(.horizontal,15)
    }
}


