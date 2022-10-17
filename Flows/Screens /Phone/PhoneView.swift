//
//  PhoneView.swift
//  MultipleAuth_2
//
//  Created by admin on 14.10.2022.
//

import SwiftUI

struct PhoneView: View {
    @StateObject var viewModel = PhoneViewModel()
    var body: some View {
            VStack(spacing: 100) {
                Text("Phone Auth")
                    .bold()
                
                TextField("", text: $viewModel.phone)
                    .keyboardType(.numberPad)
                    .frame(width: 200, height: 50, alignment: .center)
                    .background(Color.blue.opacity(0.3))
                    .foregroundColor(Color.white)
                
                Button(action: {
                    viewModel.sendOTP()
                }) {
                    Text("code")
                }


            }
    }
}

struct PhoneView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneView(viewModel: .init())
    }
}
