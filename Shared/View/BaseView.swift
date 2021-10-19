//
//  BaseView.swift
//  SwiftUI Analytics Page UI
//
//  Created by Yuan on 17/10/2021.
//

import SwiftUI

struct BaseView: View {
    
    // MARK: - Properties
    @State var currentTab: String = "home"
    
    // Hine Tabbar
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        
        // Tab View
        VStack(spacing: 0) {
            
            TabView(selection: $currentTab) {
                
                HomeView()
                    .modifier(BGMoifier())
                    .tag("home")
                
                Text("Graph")
                    .modifier(BGMoifier())
                    .tag("graph")
                
                Text("Chat")
                    .modifier(BGMoifier())
                    .tag("chat")
                
                Text("Settings")
                    .modifier(BGMoifier())
                    .tag("settings")
                
            }
            
            // Custom tabbar
            HStack(spacing: 40) {
                
                
                TabButton(image: "home")
                
                TabButton(image: "graph")
                
                // Center button
                Button(action: {}) {
                    
                    Image(systemName: "plus")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding(22)
                        .background(
                            
                            Circle()
                                .fill(Color("Tab"))
                            // shadow
                                .shadow(color: Color("Tab").opacity(0.15), radius: 5, x: 0, y: 8)
                            
                        )
                    
                }
                .offset(y: -20)
                .padding(.horizontal, -15)
                
                TabButton(image: "chat")
                
                TabButton(image: "settings")
                
                
            }
            .padding(.top, -10)
            .frame(maxWidth: .infinity)
            .background(
                
                Color("BG")
                    .ignoresSafeArea()
                
            )
            
        }
        
    }
    
    
    func TabButton(image: String) -> some View {
        
        Button(
            action: {
                withAnimation { 
                    currentTab = image
                }
            }
        ) {
            
            Image(image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(
                    currentTab == image ? Color.black : Color.gray.opacity(0.8)
                )
            
        }
        
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}

// BG Modifier
struct BGMoifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                
                Color("BG")
                    .ignoresSafeArea()
                
            )
        
    }
    
}
