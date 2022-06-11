//
//  MainView.swift
//  Moasa
//
//  Created by 김원희 on 2022/06/10.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            Color("KellyCustomGray").ignoresSafeArea()
            VStack {
                MainTitleView()
                    .padding(EdgeInsets(top: 9, leading: 0, bottom: 0, trailing: 0))
                TargetContentView()
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 39, trailing: 0))
                BudgetContentView()
            }
        }
    }
}

struct MainTitleView: View {
    var body: some View {
        Text("7월 1일 금요일")
            .font(.system(size: 14))
//                .foregroundColor(.gray)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
        HStack {
            Text("10일 째")
                .font(.system(size: 25, weight: .bold))
                .padding(.leading)
            Text("모으는 중")
                .font(.system(size: 20))
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "gearshape.fill")
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30))
                    .foregroundColor(.black)
                    .frame(width: 20, height: 20)
            })
        }
    }
}

struct TargetContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .frame(width: 360, height: 400)
            VStack {
                Text("Apple Watch")
                    .font(.system(size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .top])
                Text("이번 달 예상 추가 금액 24,950원")
                    .font(.system(size: 14))
                    .foregroundColor(Color("SystemGray"))
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
                .foregroundColor(Color("KellyCustomGray"))
                .frame(width: 240, height: 240)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.nextProgress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color("KenCustomOrange"))
                .frame(width: 240, height: 240)
                .rotationEffect(Angle(degrees: -90.0))
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.currentProgress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color("AccentColor"))
                .frame(width: 240, height: 240)
                .rotationEffect(Angle(degrees: -90.0))
            Image("targetImage")
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
                .fill(Color("AccentColor"))
                .frame(width: 10, height: 10)
            Text("현재 (50%)")
                .font(.system(size: 14))
                .foregroundColor(Color("SystemGray"))
            Circle()
                .fill(Color("KenCustomOrange"))
                .frame(width: 10, height: 10)
            Text("이번 달 추가 (+5%)")
                .font(.system(size: 14))
                .foregroundColor(Color("SystemGray"))
        }
        .padding()
    }
}

struct CategoryLeft: Hashable {
    var icon: String
    var category: String
    var left: Int
}

struct BudgetContentView: View {
    var categories = [CategoryLeft(icon: "fork.knife", category: "식비", left: 89000),
                      CategoryLeft(icon: "car", category: "교통/차량", left: 30000),
                      CategoryLeft(icon: "tshirt", category: "패션/미용", left: 66000),
                      CategoryLeft(icon: "ellipsis.circle", category: "기타", left: 5000)]

    var body: some View {
        VStack {
            HStack {
                Text("12일간 사용 가능한 금액")
                    .font(.system(size: 20, weight: .bold))
                Text("(6.12 ~ 7.11)")
                    .font(.system(size: 14))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            LazyVGrid(columns: [GridItem(.flexible(minimum: 80)), GridItem(.flexible(minimum: 80))], spacing: 20) {
                ForEach(categories, id: \.self) { category in
                    BudgetItem(icon: category.icon, category: category.category, left: category.left)
                        .aspectRatio(contentMode: .fit)
                }
            }.padding(EdgeInsets(top: 0, leading: 15, bottom: 20, trailing: 15))
        }
    }
}

struct BudgetItem: View {
    var icon: String
    var category: String
    var left: Int
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
            VStack {
                HStack {
                    Image(systemName: icon)
                        .resizable()
                        .frame(width: 14, height: 14)
                    Text(category)
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 0))
                HStack {
                    Text("\(left)")
                    Text("원")
                        .font(.system(size: 14))
                }.padding()
            }
        }
        .frame(height: 80)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
