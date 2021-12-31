//
// Created by Desire L on 2021/12/31.
//

import SwiftUI

struct SingleRowLayout: View {

    var item: Item

    var body: some View {

        ZStack {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)

            VStack {
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.mainTitle)
                            .font(.headline)
                            .lineLimit(1)
                        Text(item.subTitle)
                            .font(.subheadline)
                            .lineLimit(1)
                    }

                    Spacer()
                }
                    .padding(10)
                    .background(.white.opacity(0.5))
            }


        }
            .eraseToAnyView()
    }

    #if DEBUG
    @ObservedObject var iO = injectionObserver
    #endif
}

struct SingleRowLayout_Preview: PreviewProvider {
    static var previews: some View {
        SingleRowLayout(item: Item.getDummyData[2])
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/170.0/*@END_MENU_TOKEN@*/))
    }
}
