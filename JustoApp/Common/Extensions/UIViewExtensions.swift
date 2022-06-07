//
//  UIViewExtensions.swift
//  JustoApp
//
//  Created by Emi Mtz on 06/06/22.
//

import UIKit

extension UIView{
    
    func fillSuperView(){
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
    func anchorSize(to view: UIView){
        translatesAutoresizingMaskIntoConstraints  = false
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
    }
    func anchor(centerY: NSLayoutYAxisAnchor?,centerX : NSLayoutXAxisAnchor?, constantY: CGFloat? = 0.0, constantX: CGFloat? = 0.0){
        translatesAutoresizingMaskIntoConstraints  = false
        if let centerX = centerX, let constantx = constantX{
            centerXAnchor.constraint(equalTo: centerX, constant: constantx).isActive = true
        }
        if let centerY = centerY, let constanty = constantY {
            centerYAnchor.constraint(equalTo: centerY, constant: constanty).isActive = true
        }
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero,size: CGSize = .zero){
        
        translatesAutoresizingMaskIntoConstraints  = false
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading{
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom{
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        if let trailing = trailing{
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0{
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    // convenience function in UIImage extension to resize a given image
        func convert(toSize size:CGSize, scale:CGFloat) ->UIImage
        {
            let imgRect = CGRect(origin: CGPoint(x:0.0, y:0.0), size: size)
            UIGraphicsBeginImageContextWithOptions(size, false, scale)
            self.draw(imgRect)
            let copied = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return copied!
        }
  
  func setGestureTapView( target: Any, action: Selector?) {
       let singleTap = UITapGestureRecognizer(target: target, action:action)
       self.addGestureRecognizer(singleTap)
       self.isUserInteractionEnabled = true
  }
}
