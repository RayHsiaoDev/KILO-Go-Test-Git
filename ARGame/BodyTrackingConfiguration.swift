//
//  BodyTrackingConfiguration.swift
//  BodyTrackingConfiguration
//
//  Created by 陳韋綸 on 2021/11/24.
//

import Foundation
import ARKit

class BodyTrackingConfiguration {
    
    struct body {
        var rightHand: CGPoint
        var leftHand: CGPoint
        var header: CGPoint
    }
    
    static let models = BodyTrackingConfiguration()
    
    func bodytracking(frame: ARFrame, arView: ARSKView, completion: @escaping (body) -> Void) {
        
        if let detectedBody = frame.detectedBody {
            guard let interfaceOrientation = arView.window?.windowScene?.interfaceOrientation else { return }
            
            let transform = frame.displayTransform(for: interfaceOrientation, viewportSize: arView.frame.size)
            
            let arrayOfJoints = [detectedBody.skeleton.jointLandmarks[4],detectedBody.skeleton.jointLandmarks[7],detectedBody.skeleton.jointLandmarks[0]]

            let leftNormalizedCenter = CGPoint(x: CGFloat(arrayOfJoints[0][0]), y: CGFloat(arrayOfJoints[0][1])).applying(transform)
            let rightNormalizedCenter = CGPoint(x: CGFloat(arrayOfJoints[1][0]), y: CGFloat(arrayOfJoints[1][1])).applying(transform)
            let HeaderMalizedCenter = CGPoint(x: CGFloat(arrayOfJoints[2][0]), y: CGFloat(arrayOfJoints[2][1])).applying(transform)
            
            let circleLayerRight = CAShapeLayer()
            let circleLayerLeft = CAShapeLayer()
            let headerLayer = CAShapeLayer()
            
            circleLayerRight.fillColor = UIColor.blue.cgColor
            circleLayerLeft.fillColor = UIColor.blue.cgColor
            headerLayer.fillColor = UIColor.orange.cgColor
            
            let CenterLeft = leftNormalizedCenter.applying(CGAffineTransform.identity.scaledBy(x: arView.frame.width, y: arView.frame.height))
            let CenterRight = rightNormalizedCenter.applying(CGAffineTransform.identity.scaledBy(x: arView.frame.width, y: arView.frame.height))
            let headerCenter = HeaderMalizedCenter.applying(CGAffineTransform.identity.scaledBy(x: arView.frame.width, y: arView.frame.height))
            
            let circleWidth: CGFloat = 100
            let circleHeight: CGFloat = 100
            
            let leftRect = CGRect(origin: CGPoint(x: CenterLeft.x - circleWidth/2, y: CenterLeft.y - circleHeight/2), size: CGSize(width: circleWidth, height: circleHeight))
            let rightRect = CGRect(origin: CGPoint(x: CenterRight.x - circleWidth/2, y: CenterRight.y - circleHeight/2), size: CGSize(width: circleWidth, height: circleHeight))
            let headerRect = CGRect(origin: CGPoint(x: headerCenter.x - circleWidth/2, y: headerCenter.y - circleHeight/2), size: CGSize(width: circleWidth, height: circleHeight))
            
            circleLayerRight.path = UIBezierPath(ovalIn: leftRect).cgPath
            circleLayerLeft.path = UIBezierPath(ovalIn: rightRect).cgPath
            headerLayer.path = UIBezierPath(ovalIn: headerRect).cgPath
            completion(body(rightHand: CenterRight, leftHand: CenterLeft , header: headerCenter))
        }
    }
    
}
