//
//  SplashViewController.swift
//  CiceMusic
//
//  Created by Luis Burgos on 16/2/22.
//

import UIKit

//Output del presenter
protocol SplashPresenterOutputProtocol {
    func launchAnimation()
}

class SplashViewController: BaseView<SplashPresenterInputProtocol> {
    
    //MARK: - Variables Globales
    var viewAnimator: UIViewPropertyAnimator?
    var unblockedGR = Timer()
    
    //MARK: - IBOutlets
    @IBOutlet weak var customSplashImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.fettchDataFromWebService()

        // Do any additional setup after loading the view.
    }
    
    @objc
    func automaticHandler() {
        self.viewAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: nil)
        self.viewAnimator?.addAnimations {
            self.customSplashImageView.transform = CGAffineTransform(scaleX: 50, y: 50)
            self.customSplashImageView.alpha = 0
        }
        self.viewAnimator?.startAnimation()
        self.viewAnimator?.addCompletion({ _ in
            self.presenter?.showHomeTabBar()
        })
    }
}

//Output del presenter
extension SplashViewController: SplashPresenterOutputProtocol {
    func launchAnimation() {
        self.viewAnimator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut, animations: nil)
        self.viewAnimator?.addAnimations {
            self.customSplashImageView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            self.unblockedGR = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.automaticHandler), userInfo: nil, repeats: false)
        }
        self.viewAnimator?.startAnimation()
    }
}
