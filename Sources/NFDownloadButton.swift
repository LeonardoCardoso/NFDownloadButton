//
//  NFDownloadButton.swift
//  NFDownloadButton
//
//  Created by Leonardo Cardoso on 20/05/2017.
//  Copyright © 2017 leocardz.com. All rights reserved.
//

import Foundation
import UIKit

public class StyleKit: NSObject {

    // Drawing Methods
    public static func drawToDownloadState(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 50, height: 50), resizing: ResizingBehavior = .aspectFit, palette: Palette, toDownloadManipulable: CGFloat = 0) {
        // General Declarations
        let context = UIGraphicsGetCurrentContext()!

        // Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 50, height: 50), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 50, y: resizedFrame.height / 50)


        // Arrow Download
        context.saveGState()
        context.setAlpha(toDownloadManipulable)
        context.beginTransparencyLayer(auxiliaryInfo: nil)


        // Rectangle 3 Drawing
        let rectangle3Path = UIBezierPath(rect: CGRect(x: 15, y: 36, width: 20, height: 2))
        palette.initialColor.setFill()
        rectangle3Path.fill()


        // Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 24, y: 12))
        bezierPath.addLine(to: CGPoint(x: 24, y: 32.2))
        bezierPath.addLine(to: CGPoint(x: 18.4, y: 26.6))
        bezierPath.addLine(to: CGPoint(x: 17, y: 28))
        bezierPath.addLine(to: CGPoint(x: 25, y: 36))
        bezierPath.addLine(to: CGPoint(x: 33, y: 28))
        bezierPath.addLine(to: CGPoint(x: 31.6, y: 26.6))
        bezierPath.addLine(to: CGPoint(x: 26, y: 32.2))
        bezierPath.addLine(to: CGPoint(x: 26, y: 12))
        bezierPath.addLine(to: CGPoint(x: 24, y: 12))
        palette.initialColor.setFill()
        bezierPath.fill()
        UIColor.black.setStroke()
        bezierPath.lineWidth = 0
        bezierPath.stroke()


        context.endTransparencyLayer()
        context.restoreGState()

        context.restoreGState()

    }

    public static func drawRippleState(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 50, height: 50), resizing: ResizingBehavior = .aspectFit, palette: Palette, rippleManipulable: CGFloat = 0) {
        // General Declarations
        let context = UIGraphicsGetCurrentContext()!

        // Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 50, height: 50), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 50, y: resizedFrame.height / 50)



        // Variable Declarations
        let rippleDimensions: CGFloat = 31 + rippleManipulable * 15
        let rippleOrigin: CGFloat = -1 * rippleDimensions / 2.0
        let rippleAlpha: CGFloat = rippleManipulable < 0.5 ? rippleManipulable : 1 - rippleManipulable
        let requestDownloadSquareAlpha: CGFloat = rippleManipulable
        let requestDownloadReveal: CGFloat = rippleManipulable * 34

        // Dashed Circle Drawing
        context.saveGState()
        context.translateBy(x: 25, y: 25)

        context.saveGState()
        context.setBlendMode(.destinationAtop)
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        let dashedCirclePath = UIBezierPath()
        dashedCirclePath.move(to: CGPoint(x: 15, y: 0))
        dashedCirclePath.addCurve(to: CGPoint(x: -0, y: 15), controlPoint1: CGPoint(x: 15, y: 8.28), controlPoint2: CGPoint(x: 8.28, y: 15))
        dashedCirclePath.addCurve(to: CGPoint(x: -15, y: 0), controlPoint1: CGPoint(x: -8.28, y: 15), controlPoint2: CGPoint(x: -15, y: 8.28))
        dashedCirclePath.addCurve(to: CGPoint(x: 0, y: -15), controlPoint1: CGPoint(x: -15, y: -8.28), controlPoint2: CGPoint(x: -8.28, y: -15))
        dashedCirclePath.addCurve(to: CGPoint(x: 15, y: 0), controlPoint1: CGPoint(x: 8.28, y: -15), controlPoint2: CGPoint(x: 15, y: -8.28))
        dashedCirclePath.close()
        palette.downloadColor.setStroke()
        dashedCirclePath.lineWidth = 1
        context.saveGState()
        context.setLineDash(phase: 5, lengths: [5, 3.5])
        dashedCirclePath.stroke()
        context.restoreGState()

        context.endTransparencyLayer()
        context.restoreGState()

        context.restoreGState()


        // Reveal Drawing
        context.saveGState()
        context.translateBy(x: 25, y: 25)
        context.rotate(by: -180 * CGFloat.pi/180)

        context.saveGState()
        context.setBlendMode(.sourceIn)
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        let revealPath = UIBezierPath(rect: CGRect(x: -17, y: -17, width: 34, height: requestDownloadReveal))
        palette.downloadColor.setFill()
        revealPath.fill()

        context.endTransparencyLayer()
        context.restoreGState()

        context.restoreGState()


        // Square Drawing
        context.saveGState()
        context.translateBy(x: 25, y: 25)

        context.saveGState()
        context.setAlpha(requestDownloadSquareAlpha)

        let squarePath = UIBezierPath(rect: CGRect(x: -3.75, y: -3.75, width: 7.5, height: 7.5))
        palette.downloadColor.setFill()
        squarePath.fill()

        context.restoreGState()

        context.restoreGState()


        // RippleCircle Drawing
        context.saveGState()
        context.translateBy(x: 25, y: 25)

        context.saveGState()
        context.setAlpha(rippleAlpha)

        let rippleCirclePath = UIBezierPath(ovalIn: CGRect(x: rippleOrigin, y: rippleOrigin, width: rippleDimensions, height: rippleDimensions))
        palette.rippleColor.setStroke()
        rippleCirclePath.lineWidth = 2.5
        rippleCirclePath.stroke()

        context.restoreGState()

        context.restoreGState()

        context.restoreGState()

    }

    public static func drawDownloadCompleteState(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 50, height: 50), resizing: ResizingBehavior = .aspectFit, palette: Palette, style: NFDownloadButtonStyle, downloadedManipulable: CGFloat = 0) {
        // General Declarations
        let context = UIGraphicsGetCurrentContext()!

        // Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 50, height: 50), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 50, y: resizedFrame.height / 50)



        // Variable Declarations
        let downloadedCircleOpacity: CGFloat = 1 - downloadedManipulable
        let downloadedCenterDarkCicleDimensions: CGFloat = 11 + (1 - downloadedManipulable) * 15
        let downloadedCenterDarkCicleOrigin: CGFloat = downloadedCenterDarkCicleDimensions / 2.0 * -1
        let downloadedScreenWidth: CGFloat = 18 + downloadedManipulable * 4
        let downloadedScreenOriginX: CGFloat = -1 * downloadedScreenWidth / 2.0
        let downloadedScreenHeight: CGFloat = 28 + downloadedManipulable * 4
        let downloadedScreenOriginY: CGFloat = -1 * downloadedScreenHeight / 2.0
        let downloadedAppleWatchWidth: CGFloat = 16 + downloadedManipulable * 4
        let downloadedAppleWatchOriginX: CGFloat = -1 * downloadedAppleWatchWidth / 2.0
        let downloadedAppleWatchHeight: CGFloat = 32 + downloadedManipulable * 4
        let downloadedAppleWatchOriginY: CGFloat = -1 * downloadedAppleWatchHeight / 2.0
        let downloadedTVWidth: CGFloat = 36 + downloadedManipulable * 4
        let downloadedTVOriginX: CGFloat = -1 * downloadedTVWidth / 2.0
        let downloadedTVHeight: CGFloat = 25 + downloadedManipulable * 4
        let downloadedTVOriginY: CGFloat = -1 * downloadedTVHeight / 2.0
        let downloadedMacbookWidth: CGFloat = 38 + downloadedManipulable * 4
        let downloadedMacbookOriginX: CGFloat = -1 * downloadedMacbookWidth / 2.0
        let downloadedMacbookHeight: CGFloat = 23 + downloadedManipulable * 4
        let downloadedMacbookOriginY: CGFloat = -1 * downloadedMacbookHeight / 2.0

        // Group
        context.saveGState()
        context.translateBy(x: 25, y: 25)

        context.setAlpha(downloadedCircleOpacity)
        context.beginTransparencyLayer(auxiliaryInfo: nil)


        // Full Drawing
        context.saveGState()
        context.translateBy(x: 0.5, y: -0.5)
        context.rotate(by: -90 * CGFloat.pi/180)

        let fullPath = UIBezierPath(ovalIn: CGRect(x: -15, y: -15, width: 29, height: 29))
        palette.downloadColor.setFill()
        fullPath.fill()
        palette.downloadColor.setStroke()
        fullPath.lineWidth = 2
        fullPath.stroke()

        context.restoreGState()


        // Full Center Drawing
        context.saveGState()
        context.translateBy(x: (downloadedCenterDarkCicleOrigin + 13), y: (downloadedCenterDarkCicleOrigin + 13))

        let fullCenterPath = UIBezierPath(ovalIn: CGRect(x: -13.03, y: -12.97, width: downloadedCenterDarkCicleDimensions, height: downloadedCenterDarkCicleDimensions))
        palette.buttonBackgroundColor.setFill()
        fullCenterPath.fill()
        palette.buttonBackgroundColor.setStroke()
        fullCenterPath.lineWidth = 0.5
        fullCenterPath.stroke()

        context.restoreGState()


        // Square Drawing
        context.saveGState()

        context.saveGState()
        context.setAlpha(downloadedCircleOpacity)

        let squarePath = UIBezierPath(rect: CGRect(x: -3.75, y: -3.75, width: 7.5, height: 7.5))
        palette.downloadColor.setFill()
        squarePath.fill()

        context.restoreGState()

        context.restoreGState()


        context.endTransparencyLayer()

        context.restoreGState()

        switch style {

        case .iOS:

            // SymboliPhone Drawing
            context.saveGState()
            context.translateBy(x: 25, y: 25)

            context.saveGState()
            context.setAlpha(downloadedManipulable)
            context.beginTransparencyLayer(auxiliaryInfo: nil)

            let symboliPhoneRect = CGRect(x: downloadedScreenOriginX, y: downloadedScreenOriginY, width: downloadedScreenWidth, height: downloadedScreenHeight)
            context.saveGState()
            context.clip(to: symboliPhoneRect)
            context.translateBy(x: symboliPhoneRect.minX, y: symboliPhoneRect.minY)

            StyleKit.drawIPhoneCanvas(frame: CGRect(origin: .zero, size: symboliPhoneRect.size), resizing: .stretch, palette: palette)
            context.restoreGState()

            context.endTransparencyLayer()
            context.restoreGState()

            context.restoreGState()

            break

        case .watchOS:

            // SymbolAppleWatch Drawing
            context.saveGState()
            context.translateBy(x: 25, y: 25)

            context.saveGState()
            context.setAlpha(downloadedManipulable)
            context.beginTransparencyLayer(auxiliaryInfo: nil)

            let symbolAppleWatchRect = CGRect(x: downloadedAppleWatchOriginX, y: downloadedAppleWatchOriginY, width: downloadedAppleWatchWidth, height: downloadedAppleWatchHeight)
            context.saveGState()
            context.clip(to: symbolAppleWatchRect)
            context.translateBy(x: symbolAppleWatchRect.minX, y: symbolAppleWatchRect.minY)

            StyleKit.drawAppleWatchCanvas(frame: CGRect(origin: .zero, size: symbolAppleWatchRect.size), resizing: .stretch, palette: palette, downloadedManipulable: 1)
            context.restoreGState()

            context.endTransparencyLayer()
            context.restoreGState()

            context.restoreGState()

            break

        case .tvOS:

            // SymbolTV Drawing
            context.saveGState()
            context.translateBy(x: 25, y: 25)

            context.saveGState()
            context.setAlpha(downloadedManipulable)
            context.beginTransparencyLayer(auxiliaryInfo: nil)

            let symbolTVRect = CGRect(x: downloadedTVOriginX, y: downloadedTVOriginY, width: downloadedTVWidth, height: downloadedTVHeight)
            context.saveGState()
            context.clip(to: symbolTVRect)
            context.translateBy(x: symbolTVRect.minX, y: symbolTVRect.minY)

            StyleKit.drawAppleTVCanvas(frame: CGRect(origin: .zero, size: symbolTVRect.size), resizing: .stretch, palette: palette)
            context.restoreGState()

            context.endTransparencyLayer()
            context.restoreGState()

            context.restoreGState()

            break

        case .macOS:

            // SymbolMacbook Drawing
            context.saveGState()
            context.translateBy(x: 25, y: 25)

            context.saveGState()
            context.setAlpha(downloadedManipulable)
            context.beginTransparencyLayer(auxiliaryInfo: nil)

            let symbolMacbookRect = CGRect(x: downloadedMacbookOriginX, y: downloadedMacbookOriginY, width: downloadedMacbookWidth, height: downloadedMacbookHeight)
            context.saveGState()
            context.clip(to: symbolMacbookRect)
            context.translateBy(x: symbolMacbookRect.minX, y: symbolMacbookRect.minY)

            StyleKit.drawMacbookCanvas(frame: CGRect(origin: .zero, size: symbolMacbookRect.size), resizing: .stretch, palette: palette)
            context.restoreGState()

            context.endTransparencyLayer()
            context.restoreGState()

            context.restoreGState()

            context.restoreGState()

            break

        }

    }

    public static func drawCheckState(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 50, height: 50), resizing: ResizingBehavior = .aspectFit, palette: Palette, style: NFDownloadButtonStyle, downloadedManipulable: CGFloat = 0, checkRevealManipulable: CGFloat = 0) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!

        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 50, height: 50), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 50, y: resizedFrame.height / 50)



        //// Variable Declarations
        let checkRevealWidth: CGFloat = checkRevealManipulable * 17

        switch style {

        case .iOS:

            //// SymboliPhone Drawing
            context.saveGState()
            context.translateBy(x: 25, y: 25)

            let symboliPhoneRect = CGRect(x: -11, y: -16, width: 22, height: 32)
            context.saveGState()
            context.clip(to: symboliPhoneRect)
            context.translateBy(x: symboliPhoneRect.minX, y: symboliPhoneRect.minY)

            StyleKit.drawIPhoneCanvas(frame: CGRect(origin: .zero, size: symboliPhoneRect.size), resizing: .stretch, palette: palette)
            context.restoreGState()

            context.restoreGState()

            break

        case .watchOS:

            //// SymbolAppleWatch Drawing
            context.saveGState()
            context.translateBy(x: 25, y: 25)

            let symbolAppleWatchRect = CGRect(x: -10, y: -18, width: 20, height: 36)
            context.saveGState()
            context.clip(to: symbolAppleWatchRect)
            context.translateBy(x: symbolAppleWatchRect.minX, y: symbolAppleWatchRect.minY)

            StyleKit.drawAppleWatchCanvas(frame: CGRect(origin: .zero, size: symbolAppleWatchRect.size), resizing: .stretch, palette: palette, downloadedManipulable: 1)
            context.restoreGState()

            context.restoreGState()

            break

        case .tvOS:

            //// SymbolTV Drawing
            context.saveGState()
            context.translateBy(x: 25, y: 25)

            let symbolTVRect = CGRect(x: -20, y: -14.5, width: 40, height: 29)
            context.saveGState()
            context.clip(to: symbolTVRect)
            context.translateBy(x: symbolTVRect.minX, y: symbolTVRect.minY)

            StyleKit.drawAppleTVCanvas(frame: CGRect(origin: .zero, size: symbolTVRect.size), resizing: .stretch, palette: palette)
            context.restoreGState()

            context.restoreGState()

            break

        case .macOS:

            //// SymbolMacbook Drawing
            context.saveGState()
            context.translateBy(x: 25, y: 25)

            let symbolMacbookRect = CGRect(x: -21, y: -13.5, width: 42, height: 27)
            context.saveGState()
            context.clip(to: symbolMacbookRect)
            context.translateBy(x: symbolMacbookRect.minX, y: symbolMacbookRect.minY)

            StyleKit.drawMacbookCanvas(frame: CGRect(origin: .zero, size: symbolMacbookRect.size), resizing: .stretch, palette: palette)
            context.restoreGState()

            context.restoreGState()

            break

        }

        //// Group
        context.saveGState()
        context.translateBy(x: 25, y: 25)

        context.beginTransparencyLayer(auxiliaryInfo: nil)


        //// Check Drawing
        let checkPath = UIBezierPath()
        checkPath.move(to: CGPoint(x: -6.29, y: 0.94))
        checkPath.addLine(to: CGPoint(x: -5.38, y: -0.07))
        checkPath.addLine(to: CGPoint(x: -2.65, y: 2.96))
        checkPath.addLine(to: CGPoint(x: 5.09, y: -5.13))
        checkPath.addLine(to: CGPoint(x: 6.45, y: -3.62))
        checkPath.addLine(to: CGPoint(x: -2.65, y: 6))
        checkPath.addLine(to: CGPoint(x: -6.75, y: 1.44))
        checkPath.addLine(to: CGPoint(x: -6.29, y: 0.94))
        checkPath.close()
        palette.deviceColor.setFill()
        checkPath.fill()


        //// Rectangle 4 Drawing
        context.saveGState()
        context.setBlendMode(.sourceIn)
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        let rectangle4Path = UIBezierPath(rect: CGRect(x: -9, y: -7, width: (checkRevealWidth + 1), height: 16))
        palette.deviceColor.setFill()
        rectangle4Path.fill()

        context.endTransparencyLayer()
        context.restoreGState()


        context.endTransparencyLayer()

        context.restoreGState()

        context.restoreGState()

    }

    public static func drawReadyToDownloadState(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 50, height: 50), resizing: ResizingBehavior = .aspectFit, palette: Palette, readyToDownloadManipulable: CGFloat = 0) {
        // General Declarations
        let context = UIGraphicsGetCurrentContext()!

        // Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 50, height: 50), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 50, y: resizedFrame.height / 50)



        // Variable Declarations
        let readyToDownloadAngle: CGFloat = readyToDownloadManipulable == 1 ? -360 : 360 - readyToDownloadManipulable * 360

        // Dashed Circle Drawing
        context.saveGState()
        context.translateBy(x: 25, y: 25)

        let dashedCirclePath = UIBezierPath()
        dashedCirclePath.move(to: CGPoint(x: 15, y: 0))
        dashedCirclePath.addCurve(to: CGPoint(x: -0, y: 15), controlPoint1: CGPoint(x: 15, y: 8.28), controlPoint2: CGPoint(x: 8.28, y: 15))
        dashedCirclePath.addCurve(to: CGPoint(x: -15, y: 0), controlPoint1: CGPoint(x: -8.28, y: 15), controlPoint2: CGPoint(x: -15, y: 8.28))
        dashedCirclePath.addCurve(to: CGPoint(x: 0, y: -15), controlPoint1: CGPoint(x: -15, y: -8.28), controlPoint2: CGPoint(x: -8.28, y: -15))
        dashedCirclePath.addCurve(to: CGPoint(x: 15, y: 0), controlPoint1: CGPoint(x: 8.28, y: -15), controlPoint2: CGPoint(x: 15, y: -8.28))
        dashedCirclePath.close()
        palette.buttonBackgroundColor.setFill()
        dashedCirclePath.fill()
        palette.downloadColor.setStroke()
        dashedCirclePath.lineWidth = 1
        dashedCirclePath.stroke()

        context.restoreGState()


        // Download Tack Drawing
        context.saveGState()
        context.translateBy(x: 25, y: 25)
        context.rotate(by: -90 * CGFloat.pi/180)

        let downloadTackRect = CGRect(x: -14, y: -14, width: 28, height: 28)
        let downloadTackPath = UIBezierPath()
        downloadTackPath.addArc(withCenter: CGPoint(x: downloadTackRect.midX, y: downloadTackRect.midY), radius: downloadTackRect.width / 2, startAngle: 0 * CGFloat.pi/180, endAngle: -readyToDownloadAngle * CGFloat.pi/180, clockwise: true)

        palette.downloadColor.setStroke()
        downloadTackPath.lineWidth = 2.5
        downloadTackPath.stroke()

        context.restoreGState()


        // Square Drawing
        context.saveGState()
        context.translateBy(x: 25, y: 25)

        let squarePath = UIBezierPath(rect: CGRect(x: -3.75, y: -3.75, width: 7.5, height: 7.5))
        palette.downloadColor.setFill()
        squarePath.fill()

        context.restoreGState()

        context.restoreGState()

    }

    public static func drawDashMoveState(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 50, height: 50), resizing: ResizingBehavior = .aspectFit, palette: Palette, dashMoveManipulable: CGFloat = 0) {
        // General Declarations
        let context = UIGraphicsGetCurrentContext()!

        // Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 50, height: 50), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 50, y: resizedFrame.height / 50)



        // Variable Declarations
        let dashMoveCircleRotation: CGFloat = dashMoveManipulable * 15 * -1
        let dashMoveDashedCircleDash: CGFloat = abs(dashMoveCircleRotation) > 15 ? 0 : 5
        let dashMoveDashedCircleGap: CGFloat = abs(dashMoveCircleRotation) >= 15 ? 0 : 3.5
        let dashMoveDashedCirclePhase: CGFloat = abs(dashMoveCircleRotation) > 15 ? 0 : 5

        // Moving Dashed Circle Drawing
        context.saveGState()
        context.translateBy(x: 25, y: 25)
        context.rotate(by: -dashMoveCircleRotation * CGFloat.pi/180)

        let movingDashedCirclePath = UIBezierPath(ovalIn: CGRect(x: -15, y: -15, width: 30, height: 30))
        palette.downloadColor.setStroke()
        movingDashedCirclePath.lineWidth = 1
        context.saveGState()
        context.setLineDash(phase: dashMoveDashedCirclePhase, lengths: [dashMoveDashedCircleDash, dashMoveDashedCircleGap])
        movingDashedCirclePath.stroke()
        context.restoreGState()

        context.restoreGState()


        // Dashed Circle Drawing
        context.saveGState()
        context.translateBy(x: 25, y: 25)

        let dashedCirclePath = UIBezierPath()
        dashedCirclePath.move(to: CGPoint(x: 15, y: 0))
        dashedCirclePath.addCurve(to: CGPoint(x: -0, y: 15), controlPoint1: CGPoint(x: 15, y: 8.28), controlPoint2: CGPoint(x: 8.28, y: 15))
        dashedCirclePath.addCurve(to: CGPoint(x: -15, y: 0), controlPoint1: CGPoint(x: -8.28, y: 15), controlPoint2: CGPoint(x: -15, y: 8.28))
        dashedCirclePath.addCurve(to: CGPoint(x: 0, y: -15), controlPoint1: CGPoint(x: -15, y: -8.28), controlPoint2: CGPoint(x: -8.28, y: -15))
        dashedCirclePath.addCurve(to: CGPoint(x: 15, y: 0), controlPoint1: CGPoint(x: 8.28, y: -15), controlPoint2: CGPoint(x: 15, y: -8.28))
        dashedCirclePath.close()
        palette.downloadColor.setStroke()
        dashedCirclePath.lineWidth = 1
        context.saveGState()
        context.setLineDash(phase: 5, lengths: [5, 3.5])
        dashedCirclePath.stroke()
        context.restoreGState()

        context.restoreGState()


        // Square Drawing
        context.saveGState()
        context.translateBy(x: 25, y: 25)

        let squarePath = UIBezierPath(rect: CGRect(x: -3.75, y: -3.75, width: 7.5, height: 7.5))
        palette.downloadColor.setFill()
        squarePath.fill()

        context.restoreGState()

        context.restoreGState()

    }

    public static func drawAppleTVCanvas(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 226, height: 162), resizing: ResizingBehavior = .aspectFit, palette: Palette) {
        // General Declarations
        let context = UIGraphicsGetCurrentContext()!

        // Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 226, height: 162), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 226, y: resizedFrame.height / 162)


        // Page-1
        // Apple-Icon-Set
        // iMac
        // Rectangle-18 Drawing
        let rectangle18Path = UIBezierPath()
        rectangle18Path.move(to: CGPoint(x: 0, y: 153.44))
        rectangle18Path.addCurve(to: CGPoint(x: 8.54, y: 162), controlPoint1: CGPoint(x: 0, y: 158.17), controlPoint2: CGPoint(x: 3.83, y: 162))
        rectangle18Path.addLine(to: CGPoint(x: 214.2, y: 162))
        rectangle18Path.addLine(to: CGPoint(x: 215.31, y: 162))
        rectangle18Path.addLine(to: CGPoint(x: 217.46, y: 162))
        rectangle18Path.addCurve(to: CGPoint(x: 226, y: 153.44), controlPoint1: CGPoint(x: 222.17, y: 162), controlPoint2: CGPoint(x: 226, y: 158.17))
        rectangle18Path.addLine(to: CGPoint(x: 226, y: 8.56))
        rectangle18Path.addCurve(to: CGPoint(x: 217.46, y: 0), controlPoint1: CGPoint(x: 226, y: 3.83), controlPoint2: CGPoint(x: 222.17, y: 0))
        rectangle18Path.addLine(to: CGPoint(x: 8.54, y: 0))
        rectangle18Path.addCurve(to: CGPoint(x: 0, y: 8.56), controlPoint1: CGPoint(x: 3.83, y: 0), controlPoint2: CGPoint(x: 0, y: 3.83))
        rectangle18Path.addLine(to: CGPoint(x: 0, y: 153.44))
        rectangle18Path.close()
        palette.deviceColor.setFill()
        rectangle18Path.fill()


        // Rectangle-19 Drawing
        let rectangle19Path = UIBezierPath()
        rectangle19Path.move(to: CGPoint(x: 10, y: 150))
        rectangle19Path.addLine(to: CGPoint(x: 215, y: 150))
        rectangle19Path.addLine(to: CGPoint(x: 215, y: 10))
        rectangle19Path.addLine(to: CGPoint(x: 10, y: 10))
        rectangle19Path.addLine(to: CGPoint(x: 10, y: 150))
        rectangle19Path.close()
        palette.buttonBackgroundColor.setFill()
        rectangle19Path.fill()

        context.restoreGState()

    }

    public static func drawMacbookCanvas(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 215, height: 130), resizing: ResizingBehavior = .aspectFit, palette: Palette) {
        // General Declarations
        let context = UIGraphicsGetCurrentContext()!

        // Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 215, height: 130), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 215, y: resizedFrame.height / 130)


        // Color Declarations
        let fillColor = UIColor(red: 0.424, green: 0.518, blue: 0.980, alpha: 1.000)

        // Page-1
        // Apple-Icon-Set
        // Macbook
        // Rectangle- Drawing
        let rectanglePath = UIBezierPath()
        rectanglePath.move(to: CGPoint(x: 25, y: 0.5))
        rectanglePath.addCurve(to: CGPoint(x: 16.5, y: 9), controlPoint1: CGPoint(x: 20.31, y: 0.5), controlPoint2: CGPoint(x: 16.5, y: 4.31))
        rectanglePath.addLine(to: CGPoint(x: 16.5, y: 115))
        rectanglePath.addCurve(to: CGPoint(x: 25, y: 123.5), controlPoint1: CGPoint(x: 16.5, y: 119.69), controlPoint2: CGPoint(x: 20.31, y: 123.5))
        rectanglePath.addCurve(to: CGPoint(x: 35, y: 123), controlPoint1: CGPoint(x: 25.28, y: 123.5), controlPoint2: CGPoint(x: 35, y: 123.28))
        rectanglePath.addCurve(to: CGPoint(x: 35, y: 1.5), controlPoint1: CGPoint(x: 35, y: 122.72), controlPoint2: CGPoint(x: 35, y: 1.5))
        rectanglePath.addCurve(to: CGPoint(x: 35.5, y: 1), controlPoint1: CGPoint(x: 35.28, y: 1.5), controlPoint2: CGPoint(x: 35.5, y: 1.28))
        rectanglePath.addCurve(to: CGPoint(x: 35, y: 0.5), controlPoint1: CGPoint(x: 35.5, y: 0.72), controlPoint2: CGPoint(x: 35.28, y: 0.5))
        rectanglePath.addLine(to: CGPoint(x: 25, y: 0.5))
        rectanglePath.close()
        palette.deviceColor.setFill()
        rectanglePath.fill()


        // Rectangle-14 Drawing
        let rectangle14Path = UIBezierPath()
        rectangle14Path.move(to: CGPoint(x: 24, y: 122.5))
        rectangle14Path.addLine(to: CGPoint(x: 190, y: 122.5))
        rectangle14Path.addLine(to: CGPoint(x: 190, y: 123.5))
        rectangle14Path.addLine(to: CGPoint(x: 24, y: 123.5))
        rectangle14Path.addLine(to: CGPoint(x: 24, y: 122.5))
        rectangle14Path.close()
        rectangle14Path.usesEvenOddFillRule = true
        fillColor.setFill()
        rectangle14Path.fill()


        // Path-9-Copy Drawing
        let path9CopyPath = UIBezierPath()
        path9CopyPath.move(to: CGPoint(x: 190, y: 127))
        path9CopyPath.addCurve(to: CGPoint(x: 189, y: 129), controlPoint1: CGPoint(x: 189.09, y: 127.25), controlPoint2: CGPoint(x: 189.14, y: 129))
        path9CopyPath.addCurve(to: CGPoint(x: 188.5, y: 129.5), controlPoint1: CGPoint(x: 188.72, y: 129), controlPoint2: CGPoint(x: 188.5, y: 129.22))
        path9CopyPath.addCurve(to: CGPoint(x: 189, y: 130), controlPoint1: CGPoint(x: 188.5, y: 129.78), controlPoint2: CGPoint(x: 188.72, y: 130))
        path9CopyPath.addCurve(to: CGPoint(x: 189.83, y: 129.99), controlPoint1: CGPoint(x: 189.15, y: 130), controlPoint2: CGPoint(x: 189.44, y: 130))
        path9CopyPath.addCurve(to: CGPoint(x: 192, y: 129.89), controlPoint1: CGPoint(x: 190.48, y: 129.97), controlPoint2: CGPoint(x: 191.21, y: 129.94))
        path9CopyPath.addCurve(to: CGPoint(x: 198.59, y: 129.15), controlPoint1: CGPoint(x: 194.24, y: 129.76), controlPoint2: CGPoint(x: 196.49, y: 129.52))
        path9CopyPath.addCurve(to: CGPoint(x: 201.63, y: 128.48), controlPoint1: CGPoint(x: 199.67, y: 128.96), controlPoint2: CGPoint(x: 200.69, y: 128.74))
        path9CopyPath.addCurve(to: CGPoint(x: 208.63, y: 126.23), controlPoint1: CGPoint(x: 203.86, y: 127.88), controlPoint2: CGPoint(x: 206.23, y: 127.1))
        path9CopyPath.addCurve(to: CGPoint(x: 211.55, y: 125.12), controlPoint1: CGPoint(x: 209.68, y: 125.85), controlPoint2: CGPoint(x: 210.66, y: 125.47))
        path9CopyPath.addCurve(to: CGPoint(x: 212.38, y: 124.79), controlPoint1: CGPoint(x: 211.86, y: 125), controlPoint2: CGPoint(x: 212.14, y: 124.89))
        path9CopyPath.addCurve(to: CGPoint(x: 212.68, y: 124.67), controlPoint1: CGPoint(x: 212.53, y: 124.73), controlPoint2: CGPoint(x: 212.63, y: 124.69))
        path9CopyPath.addCurve(to: CGPoint(x: 215, y: 123), controlPoint1: CGPoint(x: 213.73, y: 124.25), controlPoint2: CGPoint(x: 215.04, y: 123.42))
        path9CopyPath.addCurve(to: CGPoint(x: 212.26, y: 122.5), controlPoint1: CGPoint(x: 214.95, y: 122.54), controlPoint2: CGPoint(x: 213.47, y: 122.5))
        path9CopyPath.addLine(to: CGPoint(x: 190.5, y: 122.5))
        path9CopyPath.addCurve(to: CGPoint(x: 187, y: 123), controlPoint1: CGPoint(x: 190.22, y: 122.5), controlPoint2: CGPoint(x: 187, y: 122.72))
        path9CopyPath.addCurve(to: CGPoint(x: 190, y: 127), controlPoint1: CGPoint(x: 187, y: 123.28), controlPoint2: CGPoint(x: 189.72, y: 127))
        path9CopyPath.addCurve(to: CGPoint(x: 190, y: 127), controlPoint1: CGPoint(x: 190, y: 127), controlPoint2: CGPoint(x: 192.2, y: 126.4))
        path9CopyPath.close()
        palette.deviceColor.setFill()
        path9CopyPath.fill()


        // Rectangle-15 Drawing
        let rectangle15Path = UIBezierPath(rect: CGRect(x: 25, y: 122.5, width: 165, height: 7.5))
        palette.deviceColor.setFill()
        rectangle15Path.fill()


        // Rectangle-15-Copy Drawing
        let rectangle15CopyPath = UIBezierPath(rect: CGRect(x: 25, y: 0.5, width: 165, height: 122.5))
        palette.deviceColor.setFill()
        rectangle15CopyPath.fill()


        // Rectangle- 2 Drawing
        let rectangle2Path = UIBezierPath()
        rectangle2Path.move(to: CGPoint(x: 190.5, y: 0.5))
        rectangle2Path.addCurve(to: CGPoint(x: 199, y: 9), controlPoint1: CGPoint(x: 195.19, y: 0.5), controlPoint2: CGPoint(x: 199, y: 4.31))
        rectangle2Path.addLine(to: CGPoint(x: 199, y: 115))
        rectangle2Path.addCurve(to: CGPoint(x: 190.5, y: 123.5), controlPoint1: CGPoint(x: 199, y: 119.69), controlPoint2: CGPoint(x: 195.19, y: 123.5))
        rectangle2Path.addCurve(to: CGPoint(x: 180.5, y: 123), controlPoint1: CGPoint(x: 190.22, y: 123.5), controlPoint2: CGPoint(x: 180.5, y: 123.28))
        rectangle2Path.addCurve(to: CGPoint(x: 180.5, y: 1.5), controlPoint1: CGPoint(x: 180.5, y: 122.72), controlPoint2: CGPoint(x: 180.5, y: 1.5))
        rectangle2Path.addCurve(to: CGPoint(x: 180, y: 1), controlPoint1: CGPoint(x: 180.22, y: 1.5), controlPoint2: CGPoint(x: 180, y: 1.28))
        rectangle2Path.addCurve(to: CGPoint(x: 180.5, y: 0.5), controlPoint1: CGPoint(x: 180, y: 0.72), controlPoint2: CGPoint(x: 180.22, y: 0.5))
        rectangle2Path.addLine(to: CGPoint(x: 190.5, y: 0.5))
        rectangle2Path.close()
        palette.deviceColor.setFill()
        rectangle2Path.fill()


        // Rectangle-12 Drawing
        let rectangle12Path = UIBezierPath()
        rectangle12Path.move(to: CGPoint(x: 25, y: 112))
        rectangle12Path.addLine(to: CGPoint(x: 190, y: 112.2))
        rectangle12Path.addLine(to: CGPoint(x: 190.2, y: 10))
        rectangle12Path.addLine(to: CGPoint(x: 25.2, y: 9.8))
        rectangle12Path.addLine(to: CGPoint(x: 25, y: 112))
        rectangle12Path.close()
        palette.buttonBackgroundColor.setFill()
        rectangle12Path.fill()


        // Path-9-Copy 2 Drawing
        let path9Copy2Path = UIBezierPath()
        path9Copy2Path.move(to: CGPoint(x: 25, y: 127))
        path9Copy2Path.addCurve(to: CGPoint(x: 26, y: 129), controlPoint1: CGPoint(x: 25.91, y: 127.25), controlPoint2: CGPoint(x: 25.86, y: 129))
        path9Copy2Path.addCurve(to: CGPoint(x: 26.5, y: 129.5), controlPoint1: CGPoint(x: 26.28, y: 129), controlPoint2: CGPoint(x: 26.5, y: 129.22))
        path9Copy2Path.addCurve(to: CGPoint(x: 26, y: 130), controlPoint1: CGPoint(x: 26.5, y: 129.78), controlPoint2: CGPoint(x: 26.28, y: 130))
        path9Copy2Path.addCurve(to: CGPoint(x: 25.17, y: 129.99), controlPoint1: CGPoint(x: 25.85, y: 130), controlPoint2: CGPoint(x: 25.56, y: 130))
        path9Copy2Path.addCurve(to: CGPoint(x: 23, y: 129.89), controlPoint1: CGPoint(x: 24.52, y: 129.97), controlPoint2: CGPoint(x: 23.79, y: 129.94))
        path9Copy2Path.addCurve(to: CGPoint(x: 16.41, y: 129.15), controlPoint1: CGPoint(x: 20.76, y: 129.76), controlPoint2: CGPoint(x: 18.51, y: 129.52))
        path9Copy2Path.addCurve(to: CGPoint(x: 13.37, y: 128.48), controlPoint1: CGPoint(x: 15.33, y: 128.96), controlPoint2: CGPoint(x: 14.31, y: 128.74))
        path9Copy2Path.addCurve(to: CGPoint(x: 6.37, y: 126.23), controlPoint1: CGPoint(x: 11.14, y: 127.88), controlPoint2: CGPoint(x: 8.77, y: 127.1))
        path9Copy2Path.addCurve(to: CGPoint(x: 3.45, y: 125.12), controlPoint1: CGPoint(x: 5.32, y: 125.85), controlPoint2: CGPoint(x: 4.34, y: 125.47))
        path9Copy2Path.addCurve(to: CGPoint(x: 2.62, y: 124.79), controlPoint1: CGPoint(x: 3.14, y: 125), controlPoint2: CGPoint(x: 2.86, y: 124.89))
        path9Copy2Path.addCurve(to: CGPoint(x: 2.32, y: 124.67), controlPoint1: CGPoint(x: 2.47, y: 124.73), controlPoint2: CGPoint(x: 2.37, y: 124.69))
        path9Copy2Path.addCurve(to: CGPoint(x: 0, y: 123), controlPoint1: CGPoint(x: 1.27, y: 124.25), controlPoint2: CGPoint(x: -0.04, y: 123.42))
        path9Copy2Path.addCurve(to: CGPoint(x: 2.74, y: 122.5), controlPoint1: CGPoint(x: 0.05, y: 122.54), controlPoint2: CGPoint(x: 1.53, y: 122.5))
        path9Copy2Path.addLine(to: CGPoint(x: 24.5, y: 122.5))
        path9Copy2Path.addCurve(to: CGPoint(x: 31, y: 123), controlPoint1: CGPoint(x: 24.78, y: 122.5), controlPoint2: CGPoint(x: 31, y: 122.72))
        path9Copy2Path.addCurve(to: CGPoint(x: 25, y: 127), controlPoint1: CGPoint(x: 31, y: 123.28), controlPoint2: CGPoint(x: 25.28, y: 127))
        path9Copy2Path.addCurve(to: CGPoint(x: 25, y: 127), controlPoint1: CGPoint(x: 25, y: 127), controlPoint2: CGPoint(x: 22.8, y: 126.4))
        path9Copy2Path.close()
        palette.deviceColor.setFill()
        path9Copy2Path.fill()

        context.restoreGState()

    }

    public static func drawAppleWatchCanvas(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 36, height: 68), resizing: ResizingBehavior = .aspectFit, palette: Palette, downloadedManipulable: CGFloat = 0) {
        // General Declarations
        let context = UIGraphicsGetCurrentContext()!

        // Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 36, height: 68), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 36, y: resizedFrame.height / 68)


        // Apple-Icon-Set
        context.saveGState()
        context.setAlpha(downloadedManipulable)
        context.beginTransparencyLayer(auxiliaryInfo: nil)


        // Apple-Watch-Style-2
        // Rectangle-8 Drawing
        let rectangle8Path = UIBezierPath()
        rectangle8Path.move(to: CGPoint(x: 0, y: 47.2))
        rectangle8Path.addCurve(to: CGPoint(x: 6.69, y: 53.8), controlPoint1: CGPoint(x: 0, y: 50.84), controlPoint2: CGPoint(x: 2.99, y: 53.8))
        rectangle8Path.addLine(to: CGPoint(x: 29.31, y: 53.8))
        rectangle8Path.addCurve(to: CGPoint(x: 36, y: 47.2), controlPoint1: CGPoint(x: 33.01, y: 53.8), controlPoint2: CGPoint(x: 36, y: 50.84))
        rectangle8Path.addLine(to: CGPoint(x: 36, y: 20.81))
        rectangle8Path.addCurve(to: CGPoint(x: 29.31, y: 14.21), controlPoint1: CGPoint(x: 36, y: 17.16), controlPoint2: CGPoint(x: 33.01, y: 14.21))
        rectangle8Path.addLine(to: CGPoint(x: 6.69, y: 14.21))
        rectangle8Path.addCurve(to: CGPoint(x: 0, y: 20.81), controlPoint1: CGPoint(x: 2.99, y: 14.21), controlPoint2: CGPoint(x: 0, y: 17.16))
        rectangle8Path.addLine(to: CGPoint(x: 0, y: 47.2))
        rectangle8Path.close()
        palette.deviceColor.setFill()
        rectangle8Path.fill()


        // Rectangle- Drawing
        let rectanglePath = UIBezierPath()
        rectanglePath.move(to: CGPoint(x: 2.37, y: 46.18))
        rectanglePath.addCurve(to: CGPoint(x: 7.72, y: 51.46), controlPoint1: CGPoint(x: 2.37, y: 49.1), controlPoint2: CGPoint(x: 4.76, y: 51.46))
        rectanglePath.addLine(to: CGPoint(x: 28.28, y: 51.46))
        rectanglePath.addCurve(to: CGPoint(x: 33.63, y: 46.18), controlPoint1: CGPoint(x: 31.24, y: 51.46), controlPoint2: CGPoint(x: 33.63, y: 49.1))
        rectanglePath.addLine(to: CGPoint(x: 33.63, y: 21.82))
        rectanglePath.addCurve(to: CGPoint(x: 28.28, y: 16.54), controlPoint1: CGPoint(x: 33.63, y: 18.9), controlPoint2: CGPoint(x: 31.24, y: 16.54))
        rectanglePath.addLine(to: CGPoint(x: 7.72, y: 16.54))
        rectanglePath.addCurve(to: CGPoint(x: 2.37, y: 21.82), controlPoint1: CGPoint(x: 4.76, y: 16.54), controlPoint2: CGPoint(x: 2.37, y: 18.9))
        rectanglePath.addLine(to: CGPoint(x: 2.37, y: 46.18))
        rectanglePath.close()
        palette.buttonBackgroundColor.setFill()
        rectanglePath.fill()


        // Path-8 Drawing
        let path8Path = UIBezierPath()
        path8Path.move(to: CGPoint(x: 6.31, y: 56.13))
        path8Path.addCurve(to: CGPoint(x: 6.95, y: 59.72), controlPoint1: CGPoint(x: 6.56, y: 56.96), controlPoint2: CGPoint(x: 6.78, y: 58.19))
        path8Path.addCurve(to: CGPoint(x: 7.24, y: 63.09), controlPoint1: CGPoint(x: 7.07, y: 60.79), controlPoint2: CGPoint(x: 7.17, y: 61.94))
        path8Path.addCurve(to: CGPoint(x: 7.3, y: 64.21), controlPoint1: CGPoint(x: 7.26, y: 63.5), controlPoint2: CGPoint(x: 7.28, y: 63.87))
        path8Path.addCurve(to: CGPoint(x: 7.31, y: 64.63), controlPoint1: CGPoint(x: 7.31, y: 64.41), controlPoint2: CGPoint(x: 7.31, y: 64.55))
        path8Path.addLine(to: CGPoint(x: 7.32, y: 64.83))
        path8Path.addLine(to: CGPoint(x: 7.46, y: 64.97))
        path8Path.addCurve(to: CGPoint(x: 9.82, y: 66.35), controlPoint1: CGPoint(x: 7.83, y: 65.33), controlPoint2: CGPoint(x: 8.6, y: 65.84))
        path8Path.addCurve(to: CGPoint(x: 17.6, y: 67.65), controlPoint1: CGPoint(x: 11.81, y: 67.17), controlPoint2: CGPoint(x: 14.38, y: 67.65))
        path8Path.addCurve(to: CGPoint(x: 25.39, y: 66.35), controlPoint1: CGPoint(x: 20.82, y: 67.65), controlPoint2: CGPoint(x: 23.39, y: 67.17))
        path8Path.addCurve(to: CGPoint(x: 27.74, y: 64.97), controlPoint1: CGPoint(x: 26.61, y: 65.84), controlPoint2: CGPoint(x: 27.37, y: 65.33))
        path8Path.addLine(to: CGPoint(x: 27.89, y: 64.82))
        path8Path.addLine(to: CGPoint(x: 27.89, y: 64.61))
        path8Path.addCurve(to: CGPoint(x: 27.9, y: 64.15), controlPoint1: CGPoint(x: 27.89, y: 64.53), controlPoint2: CGPoint(x: 27.89, y: 64.37))
        path8Path.addCurve(to: CGPoint(x: 27.95, y: 62.93), controlPoint1: CGPoint(x: 27.91, y: 63.78), controlPoint2: CGPoint(x: 27.92, y: 63.37))
        path8Path.addCurve(to: CGPoint(x: 28.27, y: 59.21), controlPoint1: CGPoint(x: 28.01, y: 61.66), controlPoint2: CGPoint(x: 28.11, y: 60.39))
        path8Path.addCurve(to: CGPoint(x: 28.89, y: 56.13), controlPoint1: CGPoint(x: 28.43, y: 58.01), controlPoint2: CGPoint(x: 28.64, y: 56.96))
        path8Path.addCurve(to: CGPoint(x: 30.95, y: 53.69), controlPoint1: CGPoint(x: 28.98, y: 55.83), controlPoint2: CGPoint(x: 29.88, y: 54.8))
        path8Path.addCurve(to: CGPoint(x: 31.13, y: 53.53), controlPoint1: CGPoint(x: 30.98, y: 53.66), controlPoint2: CGPoint(x: 31.04, y: 53.6))
        path8Path.addCurve(to: CGPoint(x: 31.19, y: 52.81), controlPoint1: CGPoint(x: 31.35, y: 53.34), controlPoint2: CGPoint(x: 31.37, y: 53.02))
        path8Path.addCurve(to: CGPoint(x: 4.25, y: 52.94), controlPoint1: CGPoint(x: 31, y: 52.6), controlPoint2: CGPoint(x: 4.44, y: 52.74))
        path8Path.addCurve(to: CGPoint(x: 4.28, y: 53.66), controlPoint1: CGPoint(x: 4.06, y: 53.15), controlPoint2: CGPoint(x: 4.07, y: 53.47))
        path8Path.addCurve(to: CGPoint(x: 6.31, y: 56.13), controlPoint1: CGPoint(x: 5.3, y: 54.58), controlPoint2: CGPoint(x: 6.12, y: 55.52))
        path8Path.close()
        palette.deviceColor.setFill()
        path8Path.fill()


        // Path-8-Copy Drawing
        let path8CopyPath = UIBezierPath()
        path8CopyPath.move(to: CGPoint(x: 31.74, y: 15.07))
        path8CopyPath.addCurve(to: CGPoint(x: 31.73, y: 14.36), controlPoint1: CGPoint(x: 31.94, y: 14.88), controlPoint2: CGPoint(x: 31.94, y: 14.55))
        path8CopyPath.addCurve(to: CGPoint(x: 31.12, y: 13.85), controlPoint1: CGPoint(x: 31.69, y: 14.32), controlPoint2: CGPoint(x: 31.29, y: 14))
        path8CopyPath.addCurve(to: CGPoint(x: 30.14, y: 12.78), controlPoint1: CGPoint(x: 30.77, y: 13.54), controlPoint2: CGPoint(x: 30.45, y: 13.2))
        path8CopyPath.addCurve(to: CGPoint(x: 29.38, y: 11.47), controlPoint1: CGPoint(x: 29.86, y: 12.39), controlPoint2: CGPoint(x: 29.6, y: 11.95))
        path8CopyPath.addCurve(to: CGPoint(x: 28.58, y: 8.38), controlPoint1: CGPoint(x: 29.01, y: 10.65), controlPoint2: CGPoint(x: 28.75, y: 9.6))
        path8CopyPath.addCurve(to: CGPoint(x: 28.38, y: 3.55), controlPoint1: CGPoint(x: 28.36, y: 6.78), controlPoint2: CGPoint(x: 28.32, y: 5.08))
        path8CopyPath.addCurve(to: CGPoint(x: 28.4, y: 3.08), controlPoint1: CGPoint(x: 28.39, y: 3.33), controlPoint2: CGPoint(x: 28.4, y: 3.17))
        path8CopyPath.addLine(to: CGPoint(x: 28.42, y: 2.85))
        path8CopyPath.addLine(to: CGPoint(x: 28.25, y: 2.69))
        path8CopyPath.addCurve(to: CGPoint(x: 25.9, y: 1.31), controlPoint1: CGPoint(x: 27.89, y: 2.32), controlPoint2: CGPoint(x: 27.12, y: 1.81))
        path8CopyPath.addCurve(to: CGPoint(x: 18.11, y: 0), controlPoint1: CGPoint(x: 23.91, y: 0.49), controlPoint2: CGPoint(x: 21.33, y: 0))
        path8CopyPath.addCurve(to: CGPoint(x: 10.33, y: 1.31), controlPoint1: CGPoint(x: 14.9, y: 0), controlPoint2: CGPoint(x: 12.32, y: 0.49))
        path8CopyPath.addCurve(to: CGPoint(x: 7.98, y: 2.69), controlPoint1: CGPoint(x: 9.11, y: 1.81), controlPoint2: CGPoint(x: 8.35, y: 2.32))
        path8CopyPath.addLine(to: CGPoint(x: 7.82, y: 2.85))
        path8CopyPath.addLine(to: CGPoint(x: 7.83, y: 3.07))
        path8CopyPath.addCurve(to: CGPoint(x: 7.85, y: 3.58), controlPoint1: CGPoint(x: 7.83, y: 3.16), controlPoint2: CGPoint(x: 7.84, y: 3.34))
        path8CopyPath.addCurve(to: CGPoint(x: 7.66, y: 8.99), controlPoint1: CGPoint(x: 7.9, y: 5.28), controlPoint2: CGPoint(x: 7.87, y: 7.19))
        path8CopyPath.addCurve(to: CGPoint(x: 7.22, y: 11.55), controlPoint1: CGPoint(x: 7.56, y: 9.94), controlPoint2: CGPoint(x: 7.41, y: 10.8))
        path8CopyPath.addCurve(to: CGPoint(x: 4.4, y: 14.77), controlPoint1: CGPoint(x: 6.91, y: 12.75), controlPoint2: CGPoint(x: 5.97, y: 13.99))
        path8CopyPath.addCurve(to: CGPoint(x: 4.17, y: 15.45), controlPoint1: CGPoint(x: 4.14, y: 14.9), controlPoint2: CGPoint(x: 4.04, y: 15.2))
        path8CopyPath.addCurve(to: CGPoint(x: 31.74, y: 15.07), controlPoint1: CGPoint(x: 4.3, y: 15.7), controlPoint2: CGPoint(x: 31.54, y: 15.27))
        path8CopyPath.close()
        palette.deviceColor.setFill()
        path8CopyPath.fill()




        context.endTransparencyLayer()
        context.restoreGState()

        context.restoreGState()

    }

    public static func drawIPhoneCanvas(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 20, height: 30), resizing: ResizingBehavior = .aspectFit, palette: Palette) {
        // General Declarations
        let context = UIGraphicsGetCurrentContext()!

        // Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 20, height: 30), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 20, y: resizedFrame.height / 30)


        // iPhone
        context.saveGState()
        context.translateBy(x: 9, y: 14)



        // Rim Drawing
        context.saveGState()
        context.translateBy(x: 1, y: 1)

        let rimPath = UIBezierPath(rect: CGRect(x: -6.5, y: -12.5, width: 13, height: 25))
        palette.deviceColor.setFill()
        rimPath.fill()
        palette.deviceColor.setStroke()
        rimPath.lineWidth = 5
        rimPath.lineJoinStyle = .round
        rimPath.stroke()

        context.restoreGState()


        // Screen Drawing
        context.saveGState()
        context.translateBy(x: 1, y: 1)

        let screenPath = UIBezierPath(rect: CGRect(x: -8, y: -13, width: 16, height: 26))
        palette.buttonBackgroundColor.setFill()
        screenPath.fill()

        context.restoreGState()

        context.restoreGState()

        context.restoreGState()

    }

    @objc(StyleKitResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
            case .aspectFit:
                scales.width = min(scales.width, scales.height)
                scales.height = scales.width
            case .aspectFill:
                scales.width = max(scales.width, scales.height)
                scales.height = scales.width
            case .stretch:
                break
            case .center:
                scales.width = 1
                scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }

}

internal class Flow {

    // MARK: - Functions
    // Execute code block asynchronously
    static func async(block: @escaping () -> Void) {

        DispatchQueue.main.async(execute: block)

    }

    // Execute code block asynchronously after given delay time
    static func delay(for delay: TimeInterval, block: @escaping () -> Void) {

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay, execute: block)

    }

}

open class Palette {

    var initialColor: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
    var rippleColor: UIColor = UIColor(red: 0.572, green: 0.572, blue: 0.572, alpha: 1.000)
    var buttonBackgroundColor: UIColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
    var downloadColor: UIColor = UIColor(red: 0.145, green: 0.439, blue: 0.733, alpha: 1.000)
    var deviceColor: UIColor = UIColor(red: 0.145, green: 0.439, blue: 0.733, alpha: 1.000)

    public init(initialColor: UIColor? = nil, rippleColor: UIColor? = nil, buttonBackgroundColor: UIColor? = nil, downloadColor: UIColor? = nil, deviceColor: UIColor? = nil) {

        self.initialColor = initialColor ?? self.initialColor
        self.rippleColor = rippleColor ?? self.rippleColor
        self.buttonBackgroundColor = buttonBackgroundColor ?? self.buttonBackgroundColor
        self.downloadColor = downloadColor ?? self.downloadColor
        self.deviceColor = deviceColor ?? self.deviceColor

    }

}

public enum NFDownloadButtonStyle: String {

    case iOS = "iOS", macOS = "macOS", watchOS = "watchOS", tvOS = "tvOS"

}

public enum NFDownloadButtonState: String {

    case toDownload = "toDownload", willDownload = "willDownload", readyToDownload = "readyToDownload", downloaded = "downloaded"

}

class NFDownloadButtonLayer: CALayer {

    // MARK: - Properties
    @NSManaged var toDownloadManipulable: CGFloat
    @NSManaged var rippleManipulable: CGFloat
    @NSManaged var dashMoveManipulable: CGFloat
    @NSManaged var readyToDownloadManipulable: CGFloat
    @NSManaged var downloadedManipulable: CGFloat
    @NSManaged var checkRevealManipulable: CGFloat

    // MARK: - Initializers
    override init() {

        super.init()

        toDownloadManipulable = 0.0
        rippleManipulable = 0.0
        dashMoveManipulable = 0.0
        readyToDownloadManipulable = 0.0
        downloadedManipulable = 0.0
        checkRevealManipulable = 0.0

    }

    override init(layer: Any) {

        super.init(layer: layer)

        if let layer = layer as? NFDownloadButtonLayer {

            toDownloadManipulable = layer.toDownloadManipulable
            rippleManipulable = layer.rippleManipulable
            dashMoveManipulable = layer.dashMoveManipulable
            readyToDownloadManipulable = layer.readyToDownloadManipulable
            downloadedManipulable = layer.downloadedManipulable
            checkRevealManipulable = layer.checkRevealManipulable

        }

    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

    }

    // MARK: - Lifecyle
    override class func needsDisplay(forKey key: String?) -> Bool {

        guard let key = key else { return false }

        if NFDownloadButtonLayer.isCompatible(key) {

            return true

        }

        return super.needsDisplay(forKey: key)

    }

    override func action(forKey event: String?) -> CAAction? {

        guard let event = event else { return nil }

        if NFDownloadButtonLayer.isCompatible(event) {

            let animation = CABasicAnimation.init(keyPath: event)
            animation.fromValue = presentation()?.value(forKey: event)

            return animation

        }

        return super.action(forKey: event)
    }

    // MARK: - Functions
    private static func isCompatible(_ key: String) -> Bool {

        return key == "toDownloadManipulable" ||
            key == "rippleManipulable" ||
            key == "dashMoveManipulable" ||
            key == "readyToDownloadManipulable" ||
            key == "downloadedManipulable" ||
            key == "checkRevealManipulable"

    }

}

public protocol NFDownloadButtonDelegate {

    func stateChanged(button: NFDownloadButton, newState: NFDownloadButtonState)

}


@IBDesignable
open class NFDownloadButton: UIButton {

    // MARK: - IBDesignable and IBInspectable
    @IBInspectable open var isDownloaded: Bool = false {

        willSet {

            if newValue {

                animate(keyPath: "downloadedManipulable")
                animate(keyPath: "checkRevealManipulable")

            }

        }

    }

    @IBInspectable open var buttonBackgroundColor: UIColor? {

        didSet {

            palette.buttonBackgroundColor = buttonBackgroundColor ?? palette.buttonBackgroundColor

        }

    }

    @IBInspectable open var initialColor: UIColor? {

        didSet {

            palette.initialColor = initialColor ?? palette.initialColor

        }

    }

    @IBInspectable open var rippleColor: UIColor? {

        didSet {

            palette.rippleColor = rippleColor ?? palette.rippleColor

        }

    }

    @IBInspectable open var downloadColor: UIColor? {

        didSet {

            palette.downloadColor = downloadColor ?? palette.downloadColor

        }

    }

    @IBInspectable open var deviceColor: UIColor? {

        didSet {

            palette.deviceColor = deviceColor ?? palette.deviceColor

        }

    }

    @IBInspectable open var style: String = NFDownloadButtonStyle.iOS.rawValue {

        didSet {

            if style == NFDownloadButtonStyle.macOS.rawValue {

                self.buttonStyle = .macOS

            } else if style == NFDownloadButtonStyle.tvOS.rawValue {

                self.buttonStyle = .tvOS

            } else if style == NFDownloadButtonStyle.watchOS.rawValue {

                self.buttonStyle = .watchOS

            } else {

                self.buttonStyle = .iOS

            }

        }

    }

    override open class var layerClass: AnyClass {

        return NFDownloadButtonLayer.self

    }

    // MARK: - Initializers
    override init(frame: CGRect) {

        super.init(frame: frame)

        draw()

    }

    public init(frame: CGRect, isDownloaded: Bool = false, style: NFDownloadButtonStyle = .iOS, palette: Palette = Palette()) {

        super.init(frame: frame)

        self.isDownloaded = isDownloaded
        self.buttonStyle = style
        self.palette = palette

        draw()

    }

    required public init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

    }
    
    // MARK: - Lifecyle
    override open func awakeFromNib() {
        
        draw()
        
    }


    // MARK: - Properties
    var keyPath: String = "toDownloadManipulable"
    open var palette: Palette = Palette()
    open var delegate: NFDownloadButtonDelegate?
    open var downloadPercent: CGFloat = 0.0 {
        willSet {

            guard let layer: NFDownloadButtonLayer = layer as? NFDownloadButtonLayer else { return }

            if newValue >= 1.0 {

                Flow.delay(for: 0.5) {

                    self.downloadState = .downloaded
                    layer.readyToDownloadManipulable = 0.0

                }

            }

            animate(duration: 0.5, from: layer.readyToDownloadManipulable, to: newValue, keyPath: "readyToDownloadManipulable")

        }
    }

    private var buttonStyle: NFDownloadButtonStyle?

    open var downloadState: NFDownloadButtonState? {

        willSet {

            guard let newValue: NFDownloadButtonState = newValue else { return }

            if !isDownloaded {

                switch newValue {

                case .toDownload:

                    resetManipulables()

                    Flow.async {

                        self.animate(keyPath: "toDownloadManipulable")
                        
                    }

                    return


                case .willDownload:

                    Flow.async {

                        self.animate(duration: 1, keyPath: "rippleManipulable")

                    }

                    return

                case .readyToDownload:

                    Flow.async {

                        self.animate(to: 0, keyPath: "readyToDownloadManipulable")

                    }
                    
                    return

                case .downloaded:

                    Flow.async {

                        self.animate(duration: 1, keyPath: "downloadedManipulable")

                    }
                    
                    return

                }

            }

        }

    }

    override open func draw(_ layer: CALayer, in ctx: CGContext) {

        super.draw(layer, in: ctx)

        guard
            let layer: NFDownloadButtonLayer = layer as? NFDownloadButtonLayer,
            let buttonStyle: NFDownloadButtonStyle = buttonStyle
            else { return }

        let frame = CGRect(origin: CGPoint(x: 0, y: 0), size: layer.frame.size)

        UIGraphicsPushContext(ctx)

        switch keyPath {

        case "toDownloadManipulable":

            StyleKit.drawToDownloadState(frame: frame, palette: palette, toDownloadManipulable: layer.toDownloadManipulable)
            break

        case "rippleManipulable":

            StyleKit.drawRippleState(frame: frame, palette: palette, rippleManipulable: layer.rippleManipulable)
            break

        case "dashMoveManipulable":

            StyleKit.drawDashMoveState(frame: frame, palette: palette, dashMoveManipulable: layer.dashMoveManipulable)
            break

        case "readyToDownloadManipulable":

            StyleKit.drawReadyToDownloadState(frame: frame, palette: palette, readyToDownloadManipulable: layer.readyToDownloadManipulable)
            break

        case "downloadedManipulable":

            StyleKit.drawDownloadCompleteState(frame: frame, palette: palette, style: buttonStyle, downloadedManipulable: layer.downloadedManipulable)
            break

        case "checkRevealManipulable":

            StyleKit.drawCheckState(frame: frame, palette: palette, style: buttonStyle, checkRevealManipulable: layer.checkRevealManipulable)
            break

        default:

            break

        }

        UIGraphicsPopContext()

    }

    // MARK: - Functions
    private func resetManipulables() {

        guard let layer: NFDownloadButtonLayer = layer as? NFDownloadButtonLayer else { return }

        layer.toDownloadManipulable = 0.0
        layer.rippleManipulable = 0.0
        layer.dashMoveManipulable = 0.0
        layer.readyToDownloadManipulable = 0.0
        layer.downloadedManipulable = 0.0
        layer.checkRevealManipulable = 0.0
        
    }
    
    func draw() {
        
        downloadState = downloadState ?? .toDownload
        buttonStyle = buttonStyle ?? .iOS
        
        needsDisplay()

    }
    
    func needsDisplay() {
        
        layer.contentsScale = UIScreen.main.scale
        layer.setNeedsDisplay()
        
    }
    
    fileprivate func animate(duration: TimeInterval = 0, delay: TimeInterval = 0, from: CGFloat = 0, to: CGFloat = 1, keyPath: String) -> Void {
        
        guard let layer: NFDownloadButtonLayer = layer as? NFDownloadButtonLayer else { return }
        
        self.keyPath = keyPath
        
        let animation = CABasicAnimation(keyPath: keyPath)
        animation.beginTime = CACurrentMediaTime() + delay
        animation.duration = duration
        animation.fillMode = CAMediaTimingFillMode.both
        animation.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.easeOut)
        animation.fromValue = from
        animation.toValue = to
        animation.delegate = self
        
        layer.add(animation, forKey: nil)
        
        Flow.async {
            
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            self.updateManipulable(layer, keyPath, to)
            CATransaction.commit()
            
        }
        
    }
    
    private func updateManipulable(_ layer: NFDownloadButtonLayer, _ keyPath: String, _ value: CGFloat) {
        
        switch keyPath {
            
        case "toDownloadManipulable":
            
            layer.toDownloadManipulable = value
            return
            
        case "rippleManipulable":
            
            layer.rippleManipulable = value
            return
            
        case "dashMoveManipulable":
            
            layer.dashMoveManipulable = value
            return
            
        case "readyToDownloadManipulable":
            
            layer.readyToDownloadManipulable = value
            return
            
        case "downloadedManipulable":
            
            layer.downloadedManipulable = value
            return
            
        case "checkRevealManipulable":
            
            layer.checkRevealManipulable = value
            return
            
        default:
            
            return
            
        }
        
    }
    
}

extension NFDownloadButton: CAAnimationDelegate {
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        guard let keyPath = (anim as? CABasicAnimation)?.keyPath else { return }
        
        if keyPath == "rippleManipulable" {
            
            animate(duration: 1, keyPath: "dashMoveManipulable")
            
        } else if keyPath == "downloadedManipulable" {
            
            if !isDownloaded {
                
                animate(duration: 0.5, keyPath: "checkRevealManipulable")
                
            }
            
        }
        
        if keyPath == "toDownloadManipulable" {
            
            delegate?.stateChanged(button: self, newState: .toDownload)
            
        } else if keyPath == "rippleManipulable" {
            
            delegate?.stateChanged(button: self, newState: .willDownload)
            
        } else if keyPath == "dashMoveManipulable" {
            
            delegate?.stateChanged(button: self, newState: .readyToDownload)
            
        } else if keyPath == "checkRevealManipulable" {
            
            delegate?.stateChanged(button: self, newState: .downloaded)
            
        }
        
    }
    
}
