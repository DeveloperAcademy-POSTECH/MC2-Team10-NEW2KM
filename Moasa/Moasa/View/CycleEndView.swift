//
//  CycleEndView.swift
//  Moasa
//
//  Created by Taehwan Kim on 2022/06/15.
//  해당뷰에서 다루는 정보들은 로직과 뷰 구성으로 되어있음. 로직의 다수는 다른 뷰에서 사용되어야 할 것. 해당 뷰는 남은 금액을 얼마나 저축할 것인지를 묻는 역할

import SwiftUI

struct CycleEndView: View {
    // let startDate: Date = "2020-08-13 09:14:48 +0000"
    var nowDate: Date = Date()
    @State var remainMoney: Int = 300_000
    @State var investMoney: Int = 0
    // 상기 변수들은 임시이며 코어데이터 or Jason 완성되면 구현
    //
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("축하합니다. 🥳")
                    .font(.system(size: 25, weight: .semibold))
                    .padding([.top, .leading])
                Spacer()
            }
            HStack {
                Text("이번 주기가 종료 됐습니다.")
                    .font(.system(size: 20, weight: .semibold))
                    .padding([.top, .leading])
                Spacer()
            }
            .padding([.top], -15)
            HStack {
                Text("저축 가능한 금액은 \(String(self.remainMoney))원 입니다.")
                    .font(.system(size: 20, weight: .semibold))
                    .padding([.top, .leading])
                Spacer()
            }
            .padding(.top, -25.0)
            HStack {
                TextField("이 중에서 물건에 보탤 금액은..", value: $investMoney, formatter: NumberFormatter())
                     .padding(.leading, 16)
                     .font(.system(size: 17, weight: .regular))
                     .keyboardType(.numberPad)
                Text("원")
                    .font(.system(size: 17, weight: .bold))
                    .padding(.trailing, 16)
            }
            .padding(.top, 30)
            Divider()
                .background(Color.accentColor)
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
            if self.investMoney > remainMoney {
                HStack {
                    Text("저축 가능한 금액 안에서 입력하세요")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.red)
                        .padding(.leading)
                    Spacer()
                }
            }
            Spacer()
            if investMoney <= remainMoney {
                MoasaButton()
            }
        }
    }
}

struct CycleEndView_Previews: PreviewProvider {
    static var previews: some View {
        CycleEndView()
    }
}

struct MoasaButton: View {
    var body: some View {
        ZStack {
            Button(action: {
            }, label: {
                Rectangle()
                    .frame(width: 360, height: 60)
                    .cornerRadius(13)
                    .foregroundColor(.accentColor)
                Text("다음")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
            })
            ZStack {
                Rectangle()
                    .frame(width: 360, height: 60)
                    .cornerRadius(13)
                    .foregroundColor(.accentColor)
                Text("다음")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
            }
        }
        .padding(.horizontal, 16)
    }
}
