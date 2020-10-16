//
//  UIView+Snapshot.swift
//  TASK-Lectures
//
//  Created by Tomislav Gelesic on 16/10/2020.
//

import UIKit

extension UIView {
    
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image(actions: { rendererContext in
            layer.render(in: rendererContext.cgContext)
        })
    }
}
