//
//  ContentView.swift
//  TicTacToe
//
//  Created by Vítor Nascimento on 05/03/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        JogoDaVelhaView(jogoDaVelha: JogoDaVelhaObservavel(jogador1: "💀", 
                                                           jogador2: "😹"))
    }
}

struct JogoDaVelhaView: View {
    
    @ObservedObject var jogoDaVelha: JogoDaVelhaObservavel
    
    var body: some View {
        VStack {
            
            Text("Jogador da vez: \(jogoDaVelha.jogadorDaVez)")
            
            ZStack {
                GradeShape()
                    .stroke(lineWidth: 10.0)
                TabuleiroView(jogoDaVelha: jogoDaVelha)
            }
        }
        .fullScreenCover(isPresented: $jogoDaVelha.acabou, content: {
            VencedorView(vencedor: jogoDaVelha.jogadorDaVez) { 
                jogoDaVelha.reiniciar()
            }
            .background(Color.green)
            .ignoresSafeArea()
        })
    }
}

struct TabuleiroView: View {
    
    @ObservedObject var jogoDaVelha: JogoDaVelhaObservavel
    
    var body: some View {
        GeometryReader { geometry in
            let altura = geometry.size.height/CGFloat(jogoDaVelha.linhas)
            let largura = geometry.size.width/CGFloat(jogoDaVelha.colunas)
        
            ForEach(0..<jogoDaVelha.linhas) { i in
                ForEach(0..<jogoDaVelha.colunas) { j in
                    Button(action: {
                        print("Clicou \(i),\(j)")
                        jogoDaVelha.colocar(linha: i, coluna: j)  
                    }, label: {
                        if (jogoDaVelha.ler(linha: i, coluna: j) != "") {
                            Text(jogoDaVelha.ler(linha: i, coluna: j))
                        } else {
                            Rectangle()
                                .foregroundColor(.clear)
                        }
                    })
                    .frame(width: largura, height: altura, alignment: .center)
                    .position(x: (CGFloat(i) + 0.5) * largura,
                              y: (CGFloat(j) + 0.5) * altura)
                }
            }
        }
    }
}

struct GradeShape: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        let largura = rect.maxX / 3
        let altura = rect.maxY / 3
        
        // Cria linhas horizontais
        for i in 1..<3 {
            p.move(to: CGPoint(x: rect.minX,y: (CGFloat(i)) * altura ))
            p.addLine(to: CGPoint(x: rect.maxX,y: (CGFloat(i)) * altura ))
        }
        
        // Linhas verticais
        for i in 1..<3 {
            p.move(to: CGPoint(x: CGFloat(i) * largura,y: rect.minY))
            p.addLine(to: CGPoint(x: CGFloat(i) * largura,y: rect.maxY))
        }
        
        return p
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
