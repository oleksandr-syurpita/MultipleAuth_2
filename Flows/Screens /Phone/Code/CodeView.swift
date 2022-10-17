//
//  CodeView.swift
//  MultipleAuth_2
//
//  Created by admin on 14.10.2022.
//

import SwiftUI

struct CodeView: View {
    @StateObject var viewModel: CodeViewModel

    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(spacing: 100) {
                Text("Code")
                    .bold()

                TextField("",text: $viewModel.code)
                    .keyboardType(.numberPad)
                    .frame(width: 200, height: 50, alignment: .center)
                    .background(Color.blue.opacity(0.3))
                    .foregroundColor(Color.white)

                Button(action: {
                    viewModel.verifyOTP()
                }) {
                    Text("login")
                }
            }
        }
    }
}

struct CodeView_Previews: PreviewProvider {
    static var previews: some View {
        CodeView(viewModel: .init(id: String()))
    }
}
