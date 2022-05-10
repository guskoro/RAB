//
//  GuestCountView.swift
//  RAB
//
//  Created by Guskoro Pradipta on 09/05/22.
//

import SwiftUI

struct GuestCountView: View {
    @Binding var guestCount: Int
    @Binding var luas: Double
    
    var body: some View {
        HStack(spacing: 20) {
            Button {
                if guestCount > 1 {
                    guestCount -= 1
                }
            } label: {
                Image(systemName: "minus.circle")
                    .foregroundColor(.mint)
                    .font(.system(.title, design: .rounded))
            }
            
            Text("\(guestCount)")
                .foregroundColor(.primary)
                .font(.system(size: 40, weight: .black, design: .monospaced))
            
            Button {
                guestCount += 1
            } label: {
                Image(systemName: "plus.circle")
                    .foregroundColor(.mint)
                    .font(.system(.title, design: .rounded))
            }
        }
        
        HStack(spacing: 20) {
            Text("\(luas)")
                .foregroundColor(.primary)
                .font(.system(size: 40, weight: .black, design: .monospaced))
        }
    }
}

struct GuestCountView_Previews: PreviewProvider {
    static var previews: some View {
        GuestCountView(guestCount: .constant(1), luas: .constant(0.0))
            .preferredColorScheme(.dark)
    }
}
