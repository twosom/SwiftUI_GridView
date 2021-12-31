//
// Created by Desire L on 2021/12/31.
//

import SwiftUI

struct GridTypePicker: View {

    @Binding
    var gridType: GridType


    var body: some View {
        Picker.init("Grid Type", selection: $gridType) {
                ForEach(GridType.allCases, id: \.self) { (type: GridType) in
                    switch type {
                    case .SINGLE:
                        Image(systemName: "rectangle.grid.1x2")

                    case .DOUBLE:
                        Image(systemName: "square.grid.2x2")

                    case .TRIPLE:
                        Image(systemName: "square.grid.3x2")

                    case .ADAPTIVE:
                        Image(systemName: "square.grid.4x3.fill")
                    }
                }

            }
            .pickerStyle(.segmented)
    }

}


/**
 GridTypePicker 의 XCODE 용 미리보기 Struct
 */
struct GridTypePicker_Previews: PreviewProvider {
    static var previews: some View {
        GridTypePicker(gridType: .constant(.SINGLE))
    }
}