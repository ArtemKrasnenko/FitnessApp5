//
//  LinaGraph.swift
//  Fitness App
//
//  Created by Alexander on 22.05.2022.
//

import SwiftUI

struct LineGraph: View {
    @Binding var data: [CGFloat]
    @Binding var Date: [String]
    
    @State var currentPlot = ""
    
    @State var offset: CGSize = .zero
    
    @State var showPlot = false
    
    @State var translation: CGFloat = 0
    
    let Purple = UIColor(r: 179, g: 127, b: 244)
    
    var body: some View {
        GeometryReader { proxy in
            
            let height = proxy.size.height
            let width = (proxy.size.width) / CGFloat(data.count)
            
            let maxPoint = (data.max() ?? 0) + 10
            
            let points = data.enumerated().compactMap {
                item -> CGPoint in
                
                let progress = item.element / maxPoint
                
                let pathHeight = progress * height
                
                let pathWidth = width * CGFloat(item.offset)
                
                return CGPoint(x: pathWidth, y: -pathHeight + height)
            }
            
            ZStack{
                Path { path in
                    path.move(to: CGPoint(x: 0, y: 0))
                    
                    path.addLines(points)
                }
                .strokedPath(StrokeStyle(lineWidth: 5, lineCap:
                        .round, lineJoin: .round))
                .fill(Color(uiColor: Purple))
                
                .clipShape(
                    
                    Path{path in
                        path.move(to: CGPoint(x: 0, y: 0))
                        
                        path.addLines(points)
                        
                        path.addLine(to: CGPoint(x: proxy.size.width, y: height))
                        
                        path.addLine(to: CGPoint(x: 0, y: height))
                    }
                )
            }
            .overlay(
                VStack(spacing: 0) {

                    Text(currentPlot)
                        .font(.caption.bold())
                        .foregroundColor(.white)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .background(Color(uiColor: Purple), in: Capsule())
                        .offset(x: translation < 10 ? 30 : 0)
                        .offset(x: translation > (proxy.size.width - 60) ? -30: 0 )


                    Circle()
                        .fill(Color(uiColor: Purple))
                        .frame(width: 22, height: 22)
                        .overlay(

                            Circle()
                                .fill(.white)
                                .frame(width: 10, height: 10)
                        )
                }
                    .frame(width: 80, height: 170)
                    .offset(y: 60)
                    .offset(offset)
                    .opacity(showPlot ? 1 : 0),

                alignment: .bottomLeading
            )
            .contentShape(Rectangle())
            .gesture(DragGesture().onChanged({value in
                
                withAnimation{showPlot = true}
                
                let translation = value.location.x - 40
                
                let index = max(min(Int((translation / width).rounded()+1), data.count - 1), 0)
                
                
                currentPlot = "\(data[index]) кг" + "\n" + "\(Date[index])"
                
                self.translation = translation
                
                offset = CGSize(width: points[index].x - 40, height: (points[index].y - height))
                
            }).onEnded({value in
                
                withAnimation{showPlot = false}
                
            }))
        }
        .background(Image("123").resizable())
        .overlay(
            VStack(alignment: .leading){
                
                let max = data.max() ?? 0
                let average1 = max / 3
                let average2 = max / 3 * 2
                
                Text("\(Int(max) + 10)")
                    .font(.caption.bold())
                    .padding(.leading, -30)
                
                Spacer()
                
                Text("\(Int(average2))")
                    .font(.caption.bold())
                    .padding(.leading, -30)
                
                Spacer()
                
                Text("\(Int(average1))")
                    .font(.caption.bold())
                    .padding(.leading, -30)
                
                Spacer()
                
                Text("\(0)")
                    .font(.caption.bold())
                    .padding(.leading, -30)

            }
                .frame(maxWidth: .infinity, alignment: .leading)
        )
        .padding(.horizontal, 10)
    }
}

