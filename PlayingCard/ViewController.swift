//
//  ViewController.swift
//  PlayingCard
//
//  Created by Viral Chauhan on 08/01/18.
//  Copyright © 2018 Viral Chauhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck ()
    
    @IBOutlet weak var playingCardView: PlayingCardView! {
        didSet {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left, .right]
            playingCardView.addGestureRecognizer(swipe)
            
            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(playingCardView.adjustFaceCardScale(withPinchHandlerRecogniser:)))
            playingCardView.addGestureRecognizer(pinch)
        }
    }
    
    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            playingCardView.isFaceUp = !playingCardView.isFaceUp
        default:
            break
        }
        
    }
    
    @objc func nextCard () {
        if playingCardView.isFaceUp, let card = deck.draw() {
            playingCardView.rank = card.rank.order
            playingCardView.suit = card.suit.rawValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

  


}

