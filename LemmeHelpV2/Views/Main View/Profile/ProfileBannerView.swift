//
//  ProfileBannerView.swift
//  LemmeHelpV2
//
//  Created by Colin Power on 9/6/20.
//  Copyright © 2020 Colin Power. All rights reserved.
//

import SwiftUI

struct ProfileBannerView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text("Profile").foregroundColor(Color.gray).font(.body)
                    Text("Colin Power").font(.title).fontWeight(.semibold)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Image(systemName: "gear").font(.headline)
                        .foregroundColor(Color.gray).padding(.trailing,6)
                }
            }
        }
        .padding(.top, 90)
        .padding(.bottom, 12)
        .padding(.horizontal, 20)
        .background(Color("newPrimaryColor"))
    }
}

struct ProfileBannerView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileBannerView()
    }
}
