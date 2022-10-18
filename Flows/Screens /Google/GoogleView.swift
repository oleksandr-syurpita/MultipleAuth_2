//
//  GoogleView.swift
//  MultipleAuth_2
//
//  Created by admin on 17.10.2022.
//

import SwiftUI

struct GoogleView: View {
    @ObservedObject var viewModel: GoogleViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct GoogleView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleView(viewModel: .init())
    }
}
