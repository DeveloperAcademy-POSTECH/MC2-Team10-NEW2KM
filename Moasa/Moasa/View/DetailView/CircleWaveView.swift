//
//  WaveView.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/11.
//
import SwiftUI

struct Wave: Shape {
    var offset: Angle
    var percent: Double
    var animatableData: Double {
        get { offset.degrees }
        set { offset = Angle(degrees: newValue) }
    }
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let lowfudge = 0.02
        let highfudge = 0.98
        let newpercent = lowfudge + (highfudge - lowfudge) * percent
        let waveHeight = 0.02 * rect.height
        let yoffset = CGFloat(1 - newpercent) * (rect.height - 4 * waveHeight) + 2 * waveHeight
        let startAngle = offset
        let endAngle = offset + Angle(degrees: 360)
        path.move(to: CGPoint(x: 0, y: yoffset + waveHeight * CGFloat(sin(offset.radians))))
        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 5) {
            let pathX = CGFloat((angle - startAngle.degrees) / 360) * rect.width
            path.addLine(to: CGPoint(x: pathX, y: yoffset + waveHeight * CGFloat(sin(Angle(degrees: angle).radians))))
        }
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        return path
    }
}

struct CircleWaveView: View {
    @State private var waveOffset = Angle(degrees: 0)
    let percent: Int
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Wave(offset: Angle(degrees: self.waveOffset.degrees), percent: Double(percent) / 100)
                    .fill(Color(red: 0.949, green: 0.53, blue: 0.002, opacity: 0.5))
                    // .clipShape(Rectangle().scale())
                Text("잔액")
                    .foregroundColor(.black)
                    .font(Font.system(size: 0.25 * min(geo.size.width, geo.size.height) ))
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .onAppear {
            withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
            self.waveOffset = Angle(degrees: 360)
            }
        }
    }
}

struct WaveView_Previews: PreviewProvider {
    static var previews: some View {
        CircleWaveView(percent: 100)
    }
}
