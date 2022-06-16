//
//  TargetContentView.swift
//  Moasa
//
//  Created by 김원희 on 2022/06/11.
//

import SwiftUI

struct TargetContentView: View {
    @EnvironmentObject var items: Items
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .frame(width: 360, height: 400)
                .opacity(0.5)
                .shadow(radius: 4)
            VStack {
                Text(items.targetItems[0].targetName)
                    .font(.system(size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .top])
                Text("이번 달 예상 추가 금액 \(items.targetItems[0].targetPrice)원")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                Spacer()
                Spacer()
                TargetGauge()
                GaugeLabel()
                Spacer()
                Text("목표까지 249,500원 남았어요!")
                    .font(.system(size: 14))
                    .padding(.bottom)
            }
            .frame(width: 360, height: 400)
        }
    }
}

struct TargetGauge: View {
    @State var currentProgress: Float = 0.5
    @State var nextProgress: Float = 0.55
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10.0)
                .foregroundColor(.kellyCustomGray)
                .frame(width: 240, height: 240)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.nextProgress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.kenCustomOrange)
                .frame(width: 240, height: 240)
                .rotationEffect(Angle(degrees: -90.0))
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.currentProgress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.accentColor)
                .frame(width: 240, height: 240)
                .rotationEffect(Angle(degrees: -90.0))
            Image(uiImage: UIImage(systemName: "circle")!)
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
        }
    }
}

struct GaugeLabel: View {
    var body: some View {
        HStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 10, height: 10)
            Text("현재 (50%)")
                .font(.system(size: 14))
                .foregroundColor(.systemGray)
            Circle()
                .fill(Color.kenCustomOrange)
                .frame(width: 10, height: 10)
            Text("이번 달 추가 (+5%)")
                .font(.system(size: 14))
                .foregroundColor(.systemGray)
        }
        .padding()
    }
}
