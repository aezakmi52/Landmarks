//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Админ on 03.05.2024.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    
    var item: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) { HStack(alignment: .top, spacing: 0) {
                ForEach(item) { landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    }label: {
                        CategoryItem(landmark: landmark)
                    }
                    
                }
            }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        let landmarks = ModelData().landmarks
        return CategoryRow(
            categoryName: landmarks[0].category.rawValue,
            item: Array(landmarks.prefix(4))
        )
    }
}
