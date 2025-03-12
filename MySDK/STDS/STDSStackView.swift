//
//  STDSStackView.swift
//  3DSExemple
//
//  Created by Sinda Arous on 04/03/2025.
//
import UIKit

enum STDSStackViewLayoutAxis: Int {
    case horizontal = 0
    case vertical = 1
}

class STDSStackView: UIView {

    private var alignment: STDSStackViewLayoutAxis
    
    /**
     Initializes an `STDSStackView`.
     
     - parameter alignment: The alignment for the stack view to use.
     - returns: An initialized `STDSStackView`.
     */
    init(alignment: STDSStackViewLayoutAxis) {
        self.alignment = alignment
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /**
     Adds a subview to the list of arranged subviews. Views will be displayed in the order they are added.

     - parameter view: The view to add to the stack view.
     */
    func addArrangedSubview(_ view: UIView) {
        addSubview(view)
        // Additional layout handling could be added here if needed
    }

    /**
     Removes a subview from the list of arranged subviews.
     
     - parameter view: The view to remove.
     */
    func removeArrangedSubview(_ view: UIView) {
        view.removeFromSuperview()
        // Additional layout handling could be added here if needed
    }

    /**
     Adds a spacer that fits the layout axis of the `STDSStackView`.

     - parameter dimension: How wide or tall the spacer should be, depending on the axis of the `STDSStackView`.
     - note: Spacers added through this function will not be removed or hidden automatically when they no longer fall between two views. For more precise interactions, add a `STDSSpacerView` manually through `addArrangedSubview:`.
     */
    func addSpacer(_ dimension: CGFloat) {
        let spacer = UIView()
        if alignment == .horizontal {
            spacer.frame.size = CGSize(width: dimension, height: 1)
        } else {
            spacer.frame.size = CGSize(width: 1, height: dimension)
        }
        addArrangedSubview(spacer)
    }
    



        func _stds_pinToSuperviewBound() {
            self.translatesAutoresizingMaskIntoConstraints = false
            
            guard let superview = self.superview else { return }
            
            let topConstraint = NSLayoutConstraint(
                item: self,
                attribute: .top,
                relatedBy: .equal,
                toItem: superview,
                attribute: .topMargin,
                multiplier: 1,
                constant: 0
            )
            
            let bottomConstraint = NSLayoutConstraint(
                item: self,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: superview,
                attribute: .bottomMargin,
                multiplier: 1,
                constant: 0
            )
            
            let leftConstraint = NSLayoutConstraint(
                item: self,
                attribute: .left,
                relatedBy: .equal,
                toItem: superview,
                attribute: .leftMargin,
                multiplier: 1,
                constant: 0
            )
            
            let rightConstraint = NSLayoutConstraint(
                item: self,
                attribute: .right,
                relatedBy: .equal,
                toItem: superview,
                attribute: .rightMargin,
                multiplier: 1,
                constant: 0
            )
            
            NSLayoutConstraint.activate([topConstraint, bottomConstraint, leftConstraint, rightConstraint])
        }
        
        func _stds_pinToSuperviewBoundsWithoutMargins() {
            self.translatesAutoresizingMaskIntoConstraints = false
            
            guard let superview = self.superview else { return }
            
            let topConstraint = NSLayoutConstraint(
                item: self,
                attribute: .top,
                relatedBy: .equal,
                toItem: superview,
                attribute: .top,
                multiplier: 1,
                constant: 0
            )
            
            let bottomConstraint = NSLayoutConstraint(
                item: self,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: superview,
                attribute: .bottom,
                multiplier: 1,
                constant: 0
            )
            
            let leftConstraint = NSLayoutConstraint(
                item: self,
                attribute: .left,
                relatedBy: .equal,
                toItem: superview,
                attribute: .left,
                multiplier: 1,
                constant: 0
            )
            
            let rightConstraint = NSLayoutConstraint(
                item: self,
                attribute: .right,
                relatedBy: .equal,
                toItem: superview,
                attribute: .right,
                multiplier: 1,
                constant: 0
            )
            
            NSLayoutConstraint.activate([topConstraint, bottomConstraint, leftConstraint, rightConstraint])
        }


}

