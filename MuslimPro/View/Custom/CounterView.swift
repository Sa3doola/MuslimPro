//
//  CounterView.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/24/21.
//

import UIKit

class CounterView: UIView {

    // MARK: - Properties
    
    private var backgroundLayer: CAShapeLayer!
    private var foregroundLayer: CAShapeLayer!
    private var countLabel = UILabel()
    
    
    // MARK: - Draw
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupDraw(rect: rect)
    }
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(countLabel)
        countLabel = configureLabel(rect: frame, textColor: .label)
        countLabel.text = "0 / 3"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LayoutSubView
    
    override func layoutSubviews() {
        super.layoutSubviews()
        countLabel.centerInSuperview()
    }
    
    // MARK: - Helper Functions
    
    private func setupDraw(rect: CGRect) {
        
        let width = rect.width
        let height = rect.height
        
        let lineWidth = 0.1 * min(width, height)
        backgroundLayer = createCircularLayer(rect: rect, strokeColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), fillColor: #colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1), lineWidth: lineWidth)
        foregroundLayer = createCircularLayer(rect: rect, strokeColor: #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1), fillColor: .clear, lineWidth: lineWidth)
        foregroundLayer.strokeEnd = 0
        
        layer.addSublayer(backgroundLayer)
        layer.addSublayer(foregroundLayer)
    }
    
    private func createCircularLayer(rect: CGRect, strokeColor: UIColor,
                                     fillColor: UIColor, lineWidth: CGFloat) -> CAShapeLayer {
        let width = rect.width
        let height = rect.height
        
        let center = CGPoint(x: width / 2, y: height / 2)
        let radius = (min(width, height) - lineWidth) / 2
        
        let startAngle = -CGFloat.pi / 2
        let endAngle = startAngle + 2 * CGFloat.pi
        
        let circularPath = UIBezierPath(arcCenter: center, radius: radius,
                                        startAngle: startAngle, endAngle: endAngle,
                                        clockwise: true)
        
        let layer = CAShapeLayer()
        
        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        layer.fillColor = fillColor.cgColor
        layer.lineWidth = lineWidth
        layer.lineCap = .round
        return layer
    }
    
    private func configureLabel(rect: CGRect, textColor: UIColor) -> UILabel {
        
        let width = rect.width
        let height = rect.height
        
        let fontSize = min(width, height) / 4
        let offSet = min(width, height) * 0.1
        
        let label = UILabel()
        label.textColor = textColor
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textAlignment = .center
        label.frame = CGRect(x: 0, y: (height - fontSize - offSet) / 2,
                             width: width, height: fontSize + offSet)
        return label
    }
    

}
