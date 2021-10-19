//
//  GraphView.swift
//  SwiftUI Analytics Page UI
//
//  Created by Yuan on 17/10/2021.
//

import SwiftUI

struct BarGraphView: View {
    
    var downloads: [Download]
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            HStack {
                
                Text("Icons downloaded")
                    .fontWeight(.bold)
                
                Spacer()
                
                Menu {
                    
                    Button("Month") {}
                    Button("Year") {}
                    Button("Day") {}
                    
                } label: {
                    
                    HStack(spacing: 4) {
                        
                        Text("this weak")
                        
                        Image(systemName: "arrowtriangle.down.fill")
                        
                    }
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.gray)
                    
                }
                
            }
            
            HStack(spacing: 10) {
                
                Capsule()
                    .fill(Color("LightBlue"))
                    .frame(width: 20, height: 8)
                
                Text("Downloads")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.gray)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // GrapView
            GrapView()
                .padding(.top, 20)
            
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(20)
        .padding(.top, 25)
        
    }
    
    @ViewBuilder
    func GrapView() -> some View {
        
        GeometryReader { proxy in
            
            ZStack {
                
                
                VStack(spacing: 0) {
                    
                    ForEach(getGraphLines(), id: \.self) { line in
                        
                        HStack(spacing: 8) {
                            
                            Text("\(Int(line))")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .frame(height: 20)
                            
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 1)
                            
                        }
                        .frame(maxHeight: .infinity)
                        
                    }
                    
                }
                
                HStack {
                    
                    ForEach(downloads) { download in
                        
                        VStack(spacing: 0) {
                            
                            VStack(spacing: 5) {
                                
                                Capsule()
                                    .fill(Color("LightBlue"))
                                
                                Capsule()
                                    .fill(Color("DarkBlue"))
                                
                            }
                            .frame(width: 8)
                            .frame(height: getBarHeight(point: download.downloads, size: proxy.size))
                            
                            
                            Text(download.weekDay)
                                .font(.caption2)
                                .frame(height: 25, alignment: .bottom)
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                        
                    }
                    
                    
                }
                .padding(.leading, 30)
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            
        }
        // fix header
        .frame(height: 190)
        
    }
    
    // get bar height
    func getBarHeight(point: CGFloat, size: CGSize) -> CGFloat {
        let max = getMax()
        let height = (point / max) * (size.height - 30)
        return height
    }
    
    // getting sample graph lines
    func getGraphLines() -> [CGFloat] {
        
        let max = getMax()
        
        var lines: [CGFloat] = []
        
        lines.append(max)
        
        for index in 1...4 {
           
            let process = max / 4
            
            lines.append(max - (process * CGFloat(index)))
            
        }
        
        return lines
        
    }
    
    // Getting Max
    func getMax() -> CGFloat {
        
        let max = downloads.max { first, scnd in
            return scnd.downloads > first.downloads
        }?.downloads ?? 0
        
        return max
        
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
