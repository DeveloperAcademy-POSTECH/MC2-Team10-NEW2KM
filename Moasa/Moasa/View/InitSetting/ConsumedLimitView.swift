//
//  ConsumedLimitView.swift
//  Moasa
//
//  Created by 지준용 on 2022/06/14.
//

import SwiftUI

struct ConsumedLimitView: View {
    @Environment(\.managedObjectContext) var viewContext
    @State var consumedCategory: String = ""
    @State var consumedLimit: Int64 = 0
    
    var body: some View {
        
        VStack {
            HStack {
                Text("예산  항목을 추가해주세요")
                    .font(.system(size: 25, weight: .semibold))
                    .padding(.top, 90)
                    .padding(.bottom, 40)
                Spacer()
            }.padding(.leading, 16)
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                    .background(.white)
                HStack {
                    VStack {
                        Text("식비")
                        Spacer()
                    }
                    Spacer()
                    VStack {
                        Spacer()
                        Text("400,000")
                    }
                }
                .font(.system(size: 25, weight: .bold))
                .padding(.vertical, 16)
                .padding(.horizontal, 16)
            }.frame(width: 350, height: 100)
                .cornerRadius(13)
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                    .background(.white)
                HStack {
                    VStack {
                        Text("교통비")
                        Spacer()
                    }
                    Spacer()
                    VStack {
                        Spacer()
                        Text("100,000")
                    }
                }
                .font(.system(size: 25, weight: .bold))
                .padding(.vertical, 16)
                .padding(.horizontal, 16)
            }.frame(width: 350, height: 100)
                .cornerRadius(13)
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                    .background(.white)
                HStack {
                    VStack {
                        Text("의류비")
                        Spacer()
                    }
                    Spacer()
                    VStack {
                        Spacer()
                        Text("300,000")
                    }
                }
                .font(.system(size: 25, weight: .bold))
                .padding(.vertical, 16)
                .padding(.horizontal, 16)
            }.frame(width: 350, height: 100)
                .cornerRadius(13)
            Button(action: {
                let add = ConsumedCategory(context: self.viewContext)
                add.consumedCategory = self.consumedCategory
                add.consumedLimit = self.consumedLimit
                try? self.viewContext.save()
//                self.dismiss.wrappedValue.dismiss()
            }, label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .background(.white)
                    Image(systemName: "plus")
                        .font(.system(size: 25, weight: .bold))
//                    HStack {
//                        VStack {
//                            TextField("소비항목", text: self.$consumedCategory)
//                            Spacer()
//                        }
//                        Spacer()
//                        VStack {
//                            Spacer()
//                            TextField("소비 예산금액", text: self.$consumedLimit)
//                        }
//                    }
//                    .font(.system(size: 25, weight: .bold))
//                    .padding(.vertical, 16)
//                    .padding(.horizontal, 16)
                }.frame(width: 350, height: 100)
                    .cornerRadius(13)
            })
            Spacer()
        }
    }
}

struct ConsumedLimitView_Previews: PreviewProvider {
    static var previews: some View {
        ConsumedLimitView()
    }
}
