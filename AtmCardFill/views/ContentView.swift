//
//  ContentView.swift
//  AtmCardFill
//
//  Created by Dr.Mac on 10/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var isFlipped = false
    
    @State var cardNumber: String = ""
    @State var cardHolderName: String = ""
    @State var expire: String = ""
    @State var cvv: String = ""
    
    let durationAndDelay = 0.3
    
    var body: some View {
        ScrollView {
            VStack {
                headingView
                
                cardView
                
                inputFields
            }
        }
    }

    private var headingView: some View {
        HStack {
            Text("Enter Card Details")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding()
            
            Spacer()
        }
    }
    private var cardView: some View {
        ZStack {
            CardBackView(cvv: $cvv, degree: $frontDegree)
                .padding()
            
            CardFrontView(degree: $backDegree, cardNumber: $cardNumber, cardHolderName: $cardHolderName, expire: $expire)
                .padding()
        }
    }
    private var inputFields: some View {
        VStack(spacing: 20) {
            GrayTextField(text: $cardNumber, hint: "Card Number")
                .onReceive(cardNumber.publisher.collect()) {
                    self.cardNumber = String($0.prefix(16))
                }

            GrayTextField(text: $cardHolderName, hint: "Name")
            
            HStack {
                GrayTextField(text: $expire, hint: "Expire")
                    .keyboardType(.asciiCapableNumberPad)
                    .onTapGesture {
                        if isFlipped {
                            cardFlip()
                        }
                    }
                
                GrayTextField(text: $cvv, hint: "CVV")
                    .onTapGesture {
                        if !isFlipped {
                            cardFlip()
                        }
                    }
                    .onReceive(cvv.publisher.collect()) {
                        self.cvv = String($0.prefix(3))
                    }
            }
        }
    }
    func cardFlip() {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
                backDegree = 0
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GrayTextField: View {
    
    @Binding var text: String
    var hint: String
    
    var body: some View {
        
        VStack {
            HStack {
                Text(hint)
                    .font(.callout)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                Spacer()
            }
            
            TextField("\(hint)", text: $text)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.gray, lineWidth: 2)
                )
                .padding(.horizontal)

        }
        
    }
}

extension String {
    func separate(every: Int, with separator: String) -> String {
        return String(stride(from: 0, to: Array(self).count, by: every).map {
            Array(Array(self)[$0..<min($0 + every, Array(self).count)])
        }.joined(separator: separator))
    }
}
