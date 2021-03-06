//
//  Extentions.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/11/21.
//

import Foundation
import UIKit

/**
 This Extention UIView provides an easy way to set programmic constraints
 It's a utility extention with static methods.
 */
extension UIView {
    /**
     Set anchor for view
     - parameter top: NSLayoutYAxisAnchor for topAnchor
     - parameter leading: NSLayoutXAxisAnchor for leadingAnchor
     - parameter bottom: NSLayoutYAxisAnchor for bottomAnchor
     - parameter trailing: NSLayoutXAxisAnchor for trailingAnchor
     - parameter padding: UIEdgeInsets for padding around view
     - parameter size: CGSize to set size for view
     
     - returns: NSLayoutConstraint for view
     */
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach{ $0?.isActive = true }
        
        return anchoredConstraints
    }
    /**
     Make View fill SuperView
     
     - parameter padding: UIEdgeInsets for padding around view

     */
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    /**
     Make View Center In SuperView X and Y
     
     - parameter size: CGSize to set size for view

     */
    func centerInSuperview(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    /**
     Make View Center In  X of SuperView
     */
    func centerXInSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superViewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superViewCenterXAnchor).isActive = true
        }
    }
    /**
     Make View Center In  Y of SuperView
     */
    func centerYInSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let centerY = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
    }
    /**
     Set Width Constraint
     */
    func constrainWidth(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    /**
     Set Height Constraint
     */
    func constrainHeight(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    var width: CGFloat {
        return frame.size.width
    }
    
    var height: CGFloat {
        return frame.size.height
    }
    
    var left: CGFloat {
        return frame.origin.x
    }
    
    var right: CGFloat {
        return left + width
    }
    
    var top: CGFloat {
        return frame.origin.y
    }
    
    var bottom: CGFloat {
        return top + height
    }
}
struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}
/**
    CollectionView for estimatedSize to set Width
 */
extension UICollectionView {
    var widsetCellWidth: CGFloat {
        let insets = contentInset.left + contentInset.right
        return bounds.width - insets
    }
}

/**
    Extentions for AlertView
 */
extension UIAlertController {
    func showAlert(title: String?, message: String?, andAction actions: [UIAlertAction] = [UIAlertAction(title: "Ok", style: .default, handler: nil)],from controller: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach({alert.addAction($0)})
        controller.present(alert, animated: true, completion: nil)
    }
}

/**
    Extentions for AlertView
 */

extension Date {
    func currentMonth() -> String {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: self)
        
        return String(describing: month)
    }
    
    func currentYear() -> String {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: self)
        return String(describing: year)
    }
    
    func firstDateOfYear() -> Date {
        let year = Calendar.current.component(.year, from: self)
        let dateComponents = DateComponents(year: year, month: 1, day: 1)
        let firstDay = Calendar.current.date(from: dateComponents)!
        return firstDay
    }
}

extension String {
    func editString(input: String) -> String {
        let outPut = input.prefix(5)
        return String(outPut)
    }
}

extension DateFormatter {
    func editTime(string: String) -> String {
        
        let timeFormmater = DateFormatter()
        timeFormmater.dateFormat = "HH:mm"
        
        let timeFromString = timeFormmater.date(from: string)
        
        guard let date = timeFromString else { return "error with edit Time" }
        timeFormmater.dateFormat = "h:mm a"
        
        let timeFromDate = timeFormmater.string(from: date)
        
        return timeFromDate
    }
}
