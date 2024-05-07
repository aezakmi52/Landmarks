//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Админ on 02.05.2024.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData : ModelData
    
    @State private var showingProfile = false
    
    var body: some View {
        NavigationSplitView {
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(),
                        id: \.self) {key in
                    CategoryRow(categoryName: key, item: modelData.categories[key]!)
                }
                        .listRowInsets(EdgeInsets())
            }
                .listStyle(.inset)
                .navigationTitle("Featured")
                .toolbar {
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                    .sheet(isPresented: $showingProfile) {
                        ProfileHost()
                            .environmentObject(modelData)
                    }
                }
        } detail: {
            Text("Select a Landmark")
        }
        
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        CategoryHome()
            .environmentObject(modelData)
    }
}
