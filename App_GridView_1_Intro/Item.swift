//
// Created by Desire L on 2021/12/31.
//

import Foundation

struct Item: Identifiable {
    let id: UUID = UUID()
    let mainTitle: String
    let subTitle: String
    let imageName: String

    /**
     더미 모델을 만들어서 반환한다.
     */
    static var getDummyData: [Item] {
        (0...30).map {
            Item(mainTitle: "Main Title Index\($0)",
                    subTitle: "Sub Title Index\($0)",
                    imageName: "bg\($0 % 3 + 1)"
            )
        }
    }


}
