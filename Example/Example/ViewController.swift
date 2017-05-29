//
//  ViewController.swift
//  Example
//
//  Created by Leonardo Cardoso on 19/05/2017.
//  Copyright © 2017 leocardz.com. All rights reserved.
//

import Foundation
import UIKit
import NFDownloadButton

class ViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet var iOSDownloadButton: NFDownloadButton!
    @IBOutlet var watchOSDownloadButton: NFDownloadButton!
    @IBOutlet var tvOSDownloadButton: NFDownloadButton!
    @IBOutlet var macOSDownloadButton: NFDownloadButton!

    // MARK: - DownloadButtonDelegate
    override func viewDidAppear(_ animated: Bool) {

        super.viewDidAppear(animated)

        let programmatically = NFDownloadButton(frame: CGRect(x: 10, y: 20, width: 50, height: 50))
        programmatically.delegate = self
        programmatically.addTarget(self, action: #selector(ViewController.changeState(_:)), for: .touchUpInside)
        self.view.addSubview(programmatically)

        iOSDownloadButton.delegate = self
        watchOSDownloadButton.delegate = self
        tvOSDownloadButton.delegate = self
        macOSDownloadButton.delegate = self

    }

    @IBAction func changeState(_ sender: NFDownloadButton) {

        if sender.downloadState == .toDownload {

            sender.downloadState = .willDownload

        } else if sender.downloadState == .downloaded {

            sender.downloadState = .toDownload

        }

    }


    // Execute code block asynchronously after given delay time
    func delay(for delay: TimeInterval, block: @escaping () -> Void) {

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay, execute: block)

    }

}

// MARK: - DownloadButtonDelegate
extension ViewController: NFDownloadButtonDelegate {

    func stateChanged(button: NFDownloadButton, newState: NFDownloadButtonState) {

        print(newState)

        if newState == .readyToDownload {

            self.delay(for: 2) {

                button.downloadPercent = 0.25

            }

            self.delay(for: 3) {

                button.downloadPercent = 0.6

            }

            self.delay(for: 4) {

                button.downloadPercent = 0.7

            }

            self.delay(for: 5) {

                button.downloadPercent = 0.95

            }
            
            self.delay(for: 6) {
                
                button.downloadPercent = 1.0
                
            }

        }
        
    }

}
