//
//  AppleView.swift
//  MultipleAuth_2
//
//  Created by admin on 17.10.2022.
//

import SwiftUI

struct AppleView: View {
    @ObservedObject var viewModel: AppleViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AppleView_Previews: PreviewProvider {
    static var previews: some View {
        AppleView(viewModel: .init())
    }
}
