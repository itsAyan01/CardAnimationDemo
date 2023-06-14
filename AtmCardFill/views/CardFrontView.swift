//
//  CardFrontView.swift
//  AtmCardFill
//
//  Created by Ayan Ansari on 10/12/22.
//

import Foundation
import SwiftUI

struct CardFrontView: View {
    
    @Binding var degree: Double
    @Binding var cardNumber: String
    @Binding var cardHolderName: String
    @Binding var expire: String
    
    var body: some View {
        VStack {
            HStack {
                Image("visaLogo")
                    .padding(20)

                Spacer()
                
                Image(ImageName.sim.rawValue)
                    .padding(20)
            }
            Spacer()
            
            HStack {
                Text(cardNumber.separate(every: 4, with: " "))
                    .font(.title3)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .kerning(4)
                    .padding()
                
                Spacer()
            }
            
            HStack {
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Card Holder Name")
                        .font(.callout)
                        .foregroundColor(.gray)
                    
                    Text(cardHolderName)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                }
                .padding(.leading)
                
                Spacer()
                
                VStack(spacing: 8) {
                    Text("Expires")
                        .font(.callout)
                        .foregroundColor(.gray)
                    
                    Text(expire)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                }
                .padding(.trailing)
                
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 220)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(LinearGradient(colors: [Color(ColorName.blueColor.rawValue), Color(ColorName.purpleColor.rawValue)], startPoint: .bottomLeading, endPoint: .topTrailing))
        )
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}
