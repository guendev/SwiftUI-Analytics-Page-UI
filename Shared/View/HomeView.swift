//
//  HomeView.swift
//  SwiftUI Analytics Page UI
//
//  Created by Yuan on 17/10/2021.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        // Home View
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 18) {
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Weakly icons")
                            .font(.title.bold())
                        
                        Text("reports is availabel!")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                    }
                    
                    Spacer(minLength: 10)
                    
                    Button {
                        
                    } label: {
                        
                        Image(systemName: "bell")
                            .font(.title2)
                            .foregroundColor(.gray)
                            .overlay(
                                
                                Text("2")
                                    .font(.caption2.bold())
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(Color.red)
                                    .clipShape(Circle())
                                    .offset(x: 11, y: -12)
                                
                                ,alignment: .topTrailing
                                
                            )
                            .offset(x: -2)
                            .padding(15)
                            .background(Color.white)
                            .clipShape(Circle())
                        
                    }
                    
                    
                }
                
                // Graph view
                BarGraphView(downloads: downloads)
                
                // User View
                HStack(spacing: 0) {
                    // Process View
                    
                }
                
            }
            .padding()
            
        }
    }
    
    @ViewBuilder
    func UserProcess(title: String, color: Color, image: String, process: CGFloat) -> some View {
        
        HStack() {
            
            Image(systemName: image)
                .font(.title2)
                .foregroundColor(color)
                .padding(10)
                .background(
                    
                    ZStack {
                        
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 2)
                        
                        Circle()
                            .trim(from: 0, to: process / 100)
                            .stroke(color, lineWidth: 2)
                        
                    }
                    
                )
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
