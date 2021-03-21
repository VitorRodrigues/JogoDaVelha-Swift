//
//  BoardView.swift
//  TicTacToe
//
//  Created by Vítor Nascimento on 21/03/2021.
//

import SwiftUI

struct BoardView<ItemView>: View where ItemView: View {
    
    private let rows: Int
    private let columns: Int
    private let content: (Int, Int) -> ItemView
    private let lineWidth: CGFloat
    
    init(rows: Int, columns: Int, lineWidth: CGFloat = 3.0, content: @escaping ((Int, Int) -> ItemView)) {
        self.rows = rows
        self.columns = columns
        self.lineWidth = lineWidth
        self.content = content
    }
    
    var body: some View {
        ZStack {
            GeometryReader(content: { geometry in
                createBody(in: geometry.size)
            })
            Board(rows: rows, columns: columns)
                .stroke(lineWidth: lineWidth)
        }
    }
    
    @ViewBuilder 
    func createBody(in size: CGSize) -> some View {
        
        Group {
            
            let itemSize = CGSize(
                width: size.width / CGFloat(columns),
                height: size.height / CGFloat(rows)
            )

            ForEach(0..<rows) { i in
                ForEach(0..<columns) { j in
                    let point = CGPoint(x: (CGFloat(i) + 0.5) * itemSize.width, 
                                        y: (CGFloat(j) + 0.5) * itemSize.height)
                    VStack {
                        content(i, j)
                    }
                    .frame(width: itemSize.width, height: itemSize.height)
                    .position(point)
                    
                }
            }
        }
    }
}

struct Board: Shape {
    
    var rows: Int
    var columns: Int
    var spacing: Int = 0
    
    func path(in rect: CGRect) -> Path {
        let itemWidth = rect.width / CGFloat(columns)
        let itemHeight = rect.height / CGFloat(rows)
        
        var path = Path()
        
        // Draw horizontal lines
        for i in 1..<rows {
            let y = CGFloat(i) * itemHeight
            path.move(to: CGPoint(x: rect.minX, y: y))
            path.addLine(to: CGPoint(x: rect.maxX, y: y))
        }
        
        // Draw vertical lines
        for i in 1..<columns {
            let x = CGFloat(i) * itemWidth
            path.move(to: CGPoint(x: x, y: rect.minY))
            path.addLine(to: CGPoint(x: x, y: rect.maxY))
        }
        
        return path
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(rows: 5, columns: 5) { x, y in
            Text("\(x),\(y)")
                .padding()
        }
        .ignoresSafeArea()
        .aspectRatio(contentMode: .fit)
    }
}
