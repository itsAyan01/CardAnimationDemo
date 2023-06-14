//
//  CardBackView.swift
//  AtmCardFill
//
//  Created by Ayan Ansari on 10/12/22.
//

import Foundation
import SwiftUI

struct CardBackView: View {
    
    @Binding var cvv: String
    @Binding var degree: Double
    
    var body: some View {
        VStack {
            Rectangle()
                .fill()
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .offset(y: 20)
            
            HStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(.white)
                    .frame(width: 180, height: 30)
                    .padding(.top, 30)
                    .padding(.leading)

                Spacer()
            }
            
            HStack {
                
                Circle()
                    .fill(.red.opacity(0.8))
                    .frame(width: 60, height: 60)
                
                Circle()
                    .fill(.yellow.opacity(0.6))
                    .frame(width: 60, height: 60)
                    .offset(x: -30)
                
                Spacer()
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(.white)
                    .frame(width: 50, height: 30)
                    .padding()
                    .overlay(
                        Text(cvv)
                    )
                
            }
            .padding()
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 220)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(LinearGradient(colors: [Color(ColorName.blueColor.rawValue), Color(ColorName.purpleColor.rawValue)], startPoint: .topLeading, endPoint: .bottomTrailing))
        )
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}
