//
//  MyTicketsBannerView.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 8/28/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct MyTicketsBannerView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text("Tickets").foregroundColor(Color.gray).font(.body)
                    Text("Assigned to me").font(.title).fontWeight(.semibold)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Image(systemName: "questionmark.circle").font(.headline)
                        .foregroundColor(Color.red.opacity(0.5)).padding(.trailing,6)
                    HStack(alignment: .bottom) {
                        HStack {
                            Image(systemName: "line.horizontal.3.decrease.circle")
                            Text("Filter")
                            }.padding(8)
                            .font(.headline)
                            .foregroundColor(Color.blue)
                    }
                }
            }
        }
        .padding(.top, 90)
        .padding(.bottom, 12)
        .padding(.horizontal, 20)
        .background(Color("newPrimaryColor"))
    }
}

struct MyTicketsBannerView_Previews: PreviewProvider {
    static var previews: some View {
        MyTicketsBannerView()
    }
}
