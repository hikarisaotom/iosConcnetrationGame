//
//  ConcentrationThemeViewController.swift
//  Concentration
//
//  Created by Claudia Cortes on 6/6/22.
//

import UIKit

class ConcentrationThemeViewController: UIViewController {
    
    let themes=[
        "Sports":"⚽️🏀🎳🚴🏼‍♀️🏄🏽‍♂️🥍🏟🏐⛸",
        "Animals":"🐶🐱🐣🐗🐌🦕🐙🐬🦢",
        "Faces":"😀😄😍😇😡🤯🤥😴😵‍💫"
    ]
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier=="Choose Theme"{
              if let buttton=sender as? UIButton{
                  if let themeName=buttton.currentTitle{
                      if let theme=themes[themeName]{
                          if let cvc = segue.destination as? ConcentrationViewController{
                              cvc.theme=theme
                          }
                      }
                  }
              }
          }
    }
    

}
