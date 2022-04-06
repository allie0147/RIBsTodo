//
//  AlertViewController.swift
//  RIBsTodo
//
//  Created by Allie Kim on 2022/04/04.
//

import Then
import Lottie
import UIKit

final class AlertViewController: AlertPresentable {

    func showLoadingIndicator() {

        guard let window = UIApplication.shared.windows.last else { return }

        var indicatorView: AnimationView
//        var blurEffect: UIBlurEffect
//        var blurEffectView: UIVisualEffectView
        var dimmedView: UIView

        if let existedView = window.subviews.first(where: { $0 is AnimationView }) as? AnimationView {
            indicatorView = existedView
        } else {
            // background dimmed view
//            blurEffect = UIBlurEffect(style: .dark)
//            blurEffectView = UIVisualEffectView(effect: blurEffect)
            dimmedView = UIView()
            dimmedView.tag = 99
            dimmedView.backgroundColor = .black
            dimmedView.alpha = 0.2
            dimmedView.autoresizingMask = [
                    .flexibleWidth, .flexibleHeight
            ]
            dimmedView.frame = window.frame

            // indicator view
            indicatorView = AnimationView(name: "loading")
            indicatorView.loopMode = .loop
            indicatorView.animationSpeed = 1.5
            indicatorView.frame = window.frame
            indicatorView.center = window.center
            indicatorView.contentMode = .scaleAspectFit

            window.insertSubview(dimmedView, at: 0)
            window.addSubview(indicatorView)
        }

        indicatorView.play()
    }

    func hideLoadingIndicator() {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.windows.last else { return }
            window.subviews.filter({ $0 is AnimationView }).forEach { $0.removeFromSuperview() }
            window.subviews.filter({ $0.viewWithTag(99) != nil }).forEach { $0.removeFromSuperview() }
        }
    }

    func showSuccess(with status: String?) {
    }

    func showError(with status: String?) {
    }
}
