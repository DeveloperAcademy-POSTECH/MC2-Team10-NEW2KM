//
//  MainTitleView.swift
//  Moasa
//
//  Created by 김원희 on 2022/06/11.
//

import SwiftUI

struct MainTitleView: View {
    @EnvironmentObject var items: Items
    var body: some View {
        VStack {
            Text(dateFormatter(date: Date(), format: "M월 dd일"))
                .font(.system(size: 14))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            HStack {
                Text("\(items.untilToday)일 째")
                    .font(.system(size: 25, weight: .bold))
                    .padding(.leading)
                Text("모으는 중")
                    .font(.system(size: 20))
                Spacer()
                NavigationLink(destination: SettingView().environmentObject(items)) {
                    Image(systemName: "gearshape.fill")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30))
                        .foregroundColor(.black)
                        .frame(width: 20, height: 20)
                }
            }
        }
    }
}

// struct MainTitleView_Previews: PreviewProvider {
//    var newItem = Items()
//    static var previews: some View {
//        MainTitleView(items: newItem)
//    }
// }
