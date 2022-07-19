//
//  WaveView.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/18.
//

import SwiftUI

struct WaveView: View {
    @State var progress: CGFloat = 0.4
    @State var phase: CGFloat = 0.0
    var body: some View {
        ZStack {//(alignment: .bottom) {
//            Rectangle()
//                .frame(width: 390.0, height: 300.0)
            WaterWave(progress: progress, phase: phase)
                .fill(Color.accentColor)
                .frame(width: 390, height: 200)
                .onAppear {
                    withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                        self.phase = .pi * 2
                    }
                }
            Text("잔액입니다")
        }
    }
}

struct WaterWave: Shape {
    let progress: CGFloat
    var applitude: CGFloat = 5
    var waveLength: CGFloat = 100
    var phase: CGFloat
    var animatableData: CGFloat {
        get { phase }
        set { phase = newValue }
    }
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        let progressHeight = height * (1 - progress)
        path.move(to: CGPoint(x: 0, y: progressHeight))
        for str in stride(from: 0, to: width + 10, by: 10) {
            let pro = progressHeight + sin(phase + str / waveLength) * applitude
            path.addLine(to: CGPoint(x: str, y: pro))
        }
        path.addLine(to: CGPoint(x: width, y: progressHeight))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: progressHeight))
        return path
    }
}

struct WaveView_Previews: PreviewProvider {
    static var previews: some View {
        WaveView(progress: 1)
    }
}
