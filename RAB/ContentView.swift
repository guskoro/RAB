//
//  ContentView.swift
//  RAB
//
//  Created by Guskoro Pradipta on 28/04/22.
//

import SwiftUI

struct ContentView: View {
    @State private var panjang = ""
    @State private var lebar = ""
    @State private var ratePrice = 1
    @FocusState private var isInputActive: Bool
    
    private let ratePrices = [1, 3, 4, 5, 6]
    
    private var cobaLuas: Double {
        let panjangBangunan = Double(panjang) ?? 0
        let lebarBangunan = Double(lebar) ?? 0
        
        return panjangBangunan * lebarBangunan
    }
    
    private var hargaBangunan: Double {
        let rateSelection = Double(ratePrices[ratePrice])
        let panjangBangunan = Double(panjang) ?? 0
        let lebarBangunan = Double(lebar) ?? 0
        
        let luasBangunan = panjangBangunan * lebarBangunan
        let rateMillion = rateSelection * 1000000
        let hargaTotal = luasBangunan * rateMillion
        
        return hargaTotal
    }
    
    private var length: Double { Double(panjang) ?? 0 }
    private var width: Double { Double(lebar) ?? 0 }
    
    init() {
        UISegmentedControl.appearance()
            .selectedSegmentTintColor = UIColor(.mint)
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .center, spacing: 20) {
                Text("Hitung RAB")
                    .foregroundColor(.primary)
                    .font(.system(size: 40, weight: .black, design: .default))
                Text("Rencana Anggaran Biaya")
                    .foregroundColor(.primary)
                    .font(.system(size: 20, weight: .black, design: .default))
                
                CardView(cardLabelText: "Total harga bangunan", totalAmount: hargaBangunan)
                    .frame(width: geo.size.width, height: 100)
                
                CardView2(cardLabelText: "Total luas bangunan", totalSquare: cobaLuas, totalLength: length, totalWidth: width)
                    .frame(width: geo.size.width, height: 100)
                
                Picker("Harga per meter persegi", selection: $ratePrice) {
                    ForEach(0..<ratePrices.count) {
                        Text("Rp.\(self.ratePrices[$0])jt")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                .padding()
                
                TitleView(title: "Besar Bangunan")
                
                VStack {
                    HStack {
                        TextField("Panjang", text: $panjang)
                            .foregroundColor(.primary)
                            .font(.system(size: 40, weight: .black, design: .rounded))
                            .keyboardType(.decimalPad)
                            .focused($isInputActive)
                        
                        Text("meter")
                            .foregroundColor(.primary)
                            .font(.system(size: 40, weight: .black, design: .rounded))
                    }
                    HStack {
                        TextField("Lebar", text: $lebar)
                            .foregroundColor(.primary)
                            .font(.system(size: 40, weight: .black, design: .rounded))
                            .keyboardType(.decimalPad)
                            .focused($isInputActive)
                        
                        Text("meter")
                            .foregroundColor(.primary)
                            .font(.system(size: 40, weight: .black, design: .rounded))
                    }
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                isInputActive = false
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

struct TitleView: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.mint)
                .fontWeight(.black)
            Spacer()
        }
    }
}
