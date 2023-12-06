//
//  ContentView.swift
//  converterSwiftUI
//
//  Created by EDOUARD CHEVENSLOVE on 06/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Eddy Converter").foregroundColor(Color.blue
                
            )
            Spacer()
            CurrencyConverterView()
        }
        .padding()
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
