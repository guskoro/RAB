//
//  CardView2.swift
//  RAB
//
//  Created by Guskoro Pradipta on 10/05/22.
//

import SwiftUI

struct CardView2: View {
    var cardLabelText = ""
    var totalSquare = 100.12
    var totalLength = 120.12
    var totalWidth = 5.23
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(cardLabelText)
                .foregroundColor(.mint)
                .fontWeight(.black)
            
            ZStack {
                Rectangle()
                    .foregroundColor(.gray)
                    .cornerRadius(10)
                HStack {
                    Spacer()
                    
                    Text("\(totalSquare, specifier: "%.2f") m2")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .black, design: .monospaced))
                        .fontWeight(.black)
                    
                    Spacer()
                    
                    Rectangle()
                        .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                        .frame(width: 1, height: 70)
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Panjang Bangunan")
                                .font(.system(.caption,design: .rounded))
                                .fontWeight(.light)
                            Text("\(totalLength, specifier: "%.2f") m")
                                .font(.system(.body, design: .monospaced))
                                .fontWeight(.black)
                        }

                        VStack(alignment: .leading) {
                            Text("Lebar Bangunan")
                                .font(.system(.caption,design: .rounded))
                                .fontWeight(.light)
                            Text("\(totalWidth, specifier: "%.2f") m")
                                .font(.system(.body, design: .monospaced))
                                .fontWeight(.black)
                        }
                    }
                    .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding(5)
            }
        }
    }
}

struct CardView2_Previews: PreviewProvider {
    static var previews: some View {
        CardView2(cardLabelText: "Total harga bangunan")
            .frame(width: 300, height: 150)
    }
}
