//
//  ContentView.swift
//  ObservableDemo
//
//  Created by SueJung Kim on 2021/10/10.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var timerData: TimerData
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .myAlignment) {
                Rectangle()
                    .foregroundColor(Color.green)
                    .alignmentGuide(HorizontalAlignment.myAlignment)
                        { d in d[.leading] }
                    .alignmentGuide(VerticalAlignment.myAlignment)
                        { d in d[VerticalAlignment.bottom] }
                    .frame(width: 100, height: 100)
                Rectangle()
                    .foregroundColor(Color.red)
                    .alignmentGuide(VerticalAlignment.myAlignment)
                        { d in d[VerticalAlignment.center] }
                    .alignmentGuide(HorizontalAlignment.myAlignment)
                        { d in d[HorizontalAlignment.trailing] }
                    .frame(width: 100, height: 100)
                Circle()
                    .foregroundColor(Color.orange)
                    .alignmentGuide(HorizontalAlignment.myAlignment)
                        { d in d[.leading] }
                    .alignmentGuide(VerticalAlignment.myAlignment)
                        { d in d[.top] }
                    .frame(width: 100, height: 100)
            }
            /*
            HStack(alignment: .crossAlignment, spacing: 20) {
                Circle()
                    .foregroundColor(Color.purple)
                    .alignmentGuide(.crossAlignment, computeValue: { d in
                        d[VerticalAlignment.bottom]
                    })
                    .frame(width: 100, height: 100)
                VStack(alignment: .center) {
                    Rectangle()
                        .foregroundColor(Color.green)
                        .frame(width: 100, height: 100)
                    Rectangle()
                        .foregroundColor(Color.red)
                        .frame(width: 100, height: 100)
                    Rectangle()
                        .foregroundColor(Color.blue)
                        .alignmentGuide(.crossAlignment, computeValue: { d in
                            d[VerticalAlignment.center]
                        })
                        .frame(width: 100, height: 100)
                    Rectangle()
                        .foregroundColor(Color.orange)
                        .frame(width: 100, height: 100)
                }
            }
             */
            /*
            HStack(alignment: .oneThird) {
                Rectangle()
                    .foregroundColor(Color.green)
                    .frame(width: 50, height: 200)
                Rectangle()
                    .foregroundColor(Color.red)
                    .alignmentGuide(.oneThird, computeValue: { d in
                        d[VerticalAlignment.top]
                    })
                    .frame(width: 50, height: 40)
                Rectangle()
                    .foregroundColor(Color.blue)
                    .frame(width: 50, height: 200)
                Rectangle()
                    .foregroundColor(Color.orange)
                    .frame(width: 50, height: 200)
            }
             */
            /*
            VStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.green)
                    .frame(width: 120, height: 50)
                Rectangle()
                    .foregroundColor(Color.red)
                    .alignmentGuide(.leading, computeValue: { d in
                        d[HorizontalAlignment.trailing]+20
                    })
                    .frame(width: 120, height: 50)
                Rectangle()
                    .foregroundColor(Color.blue)
                    .frame(width: 180, height: 50)
            }
             */
            VStack {
                Text("Timer count = \(timerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Button(action: resetCount) {
                    Text("Reset Counter")
                }
                NavigationLink(destination: SecondView()) {
                    Text("Next Screen")
                }
                .padding()
            }
        }
    }
    func resetCount() {
        timerData.resetCount()
    }
}
extension VerticalAlignment {
    
    private enum OneThird : AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context.height/2
        }
    }
    static let oneThird = VerticalAlignment(OneThird.self)
    
    private enum CrossAlignment : AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[.bottom]
        }
    }
    static let crossAlignment = VerticalAlignment(CrossAlignment.self)

    enum MyVertical : AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[VerticalAlignment.center]
        }
    }
    static let myAlignment = VerticalAlignment(MyVertical.self)
}
extension HorizontalAlignment {
    enum MyHorizontal : AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[HorizontalAlignment.center]
        }
    }
    static let myAlignment = HorizontalAlignment(MyHorizontal.self)
}
extension Alignment {
    static let myAlignment = Alignment(horizontal: .myAlignment, vertical: .myAlignment)
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(TimerData())
    }
}
