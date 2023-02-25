//
//  ForcaseView.swift
//  Weather
//
//  Created by Abdullah Hashim on 24/02/2023.
//

import SwiftUI

struct ForcaseView: View {
    var bottomSheetTranslationProrated: CGFloat = 1
    @State private var selection = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // MARK Segmented Control
                SegmentedControl(selection: $selection)
            }
            
        }
        .backgroundBlur(raduis: 25,opaque: true)
        .background(Color.bottomSheetBackground)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        .innerShadow(
            shape: RoundedRectangle(cornerRadius: 44),
            color: Color.bottomSheetBorderMiddle,
            linewidth: 1,
            offsetX: 0,
            offsetY: 1,
            blur: 0,
            blendMode: .overlay,
            opacity: 1 - bottomSheetTranslationProrated
        )
        .overlay {
            Divider()
                .background(Color.bottomSheetBorderTop)
                .frame(maxHeight: .infinity,alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 44))
        }
        .overlay {
            // MARK: Drag indicator
            RoundedRectangle(cornerRadius: 10)
                .fill(.black.opacity(0.3))
                .frame(width: 48,height: 5)
                .frame(height: 20)
                .frame(maxHeight: .infinity,alignment: .top)
        }
    }
}

struct ForcaseView_Previews: PreviewProvider {
    static var previews: some View {
        ForcaseView()
            .background(Color.background)
            .preferredColorScheme(.dark)
    }
}
