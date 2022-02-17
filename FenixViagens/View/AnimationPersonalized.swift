//
//  AnimationPersonalized.swift
//  FenixViagens
//
//  Created by Jefferson Oliveira de Araujo on 14/02/22.
//

import UIKit

class AnimationPersonalized: NSObject, UIViewControllerAnimatedTransitioning {
    
    private var duration: TimeInterval
    private var image: UIImage
    private var frameInitial: CGRect
    private var presentationVC: Bool
    
    //    MARK: init
    init(duration: TimeInterval, image: UIImage, frameInitial: CGRect, presentationVC: Bool) {
        self.duration = duration
        self.image = image
        self.frameInitial = frameInitial
        self.presentationVC = presentationVC
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let viewInitial = transitionContext.view(forKey: UITransitionContextViewKey.from) else { return }
        guard let viewFinal = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        
        let context = transitionContext.containerView
        
        if presentationVC {
            context.addSubview(viewFinal)
        } else {
            context.insertSubview(viewFinal, belowSubview: viewInitial)
        }
        
        let viewAtual = presentationVC ? viewFinal : viewInitial
        
        guard let imageTrip = viewAtual.viewWithTag(1) as? UIImageView else { return }
        imageTrip.image = image
        
        let imageTransition = UIImageView(frame: frameInitial)
        imageTransition.image = image
        context.addSubview(imageTransition)
        
        viewAtual.frame = presentationVC ? CGRect(x: viewInitial.frame.width, y: 0, width: viewFinal.frame.width, height: viewFinal.frame.height) : viewInitial.frame
        viewAtual.layoutIfNeeded() // atualizando o que ele achar que precisa atualizar, ex: constraints
        
        UIView.animate(withDuration: duration, animations: {
            imageTransition.frame = self.presentationVC ? imageTrip.frame : self.frameInitial
            
            viewAtual.frame = self.presentationVC ? viewInitial.frame : CGRect(x: viewInitial.frame.width, y: 0, width: viewInitial.frame.width, height: viewInitial.frame.height)
            
        }) { (_ ) in
            imageTransition.removeFromSuperview()
            transitionContext.completeTransition(true)
        }
    }

}
