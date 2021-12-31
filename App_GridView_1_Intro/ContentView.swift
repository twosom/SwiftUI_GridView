//
//  ContentView.swift
//  App_GridView_1_Intro
//
//  Created by Desire L on 2021/12/31.
//
//

import SwiftUI

enum GridType: CaseIterable {
    case SINGLE
    case DOUBLE
    case TRIPLE
    case ADAPTIVE

    var columns: [GridItem] {
        switch self {
        case .SINGLE:
            /**
                화면에 맞춰서 꽉 채울것이기 때문에 flexible 로 설정
             */
            return [GridItem(.flexible())]
        case .DOUBLE:
            return [GridItem(.flexible()), GridItem(.flexible())]
        case .TRIPLE:
            return [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
        case .ADAPTIVE:
            return [GridItem(.adaptive(minimum: 50))]
        }
    }
}

struct ContentView: View {

    @State(initialValue: GridType.SINGLE)
    private var selectedGridType: GridType

    var items: [Item] = Item.getDummyData

    var body: some View {
        VStack {
            GridTypePicker(gridType: $selectedGridType)

            ScrollView {
                LazyVGrid(columns: selectedGridType.columns) {
                    ForEach(items) { item in
                        switch selectedGridType {
                        case .SINGLE, .DOUBLE:
                            SingleRowLayout(item: item)
                        default:
                            Image(item.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }

                    }
                }
                    .animation(.easeInOut(duration: 0.5))
            }
        }

            .eraseToAnyView()
    }

    #if DEBUG
    @ObservedObject var iO = injectionObserver
    #endif
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
