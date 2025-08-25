import Foundation

func solution(_ n: Int, _ w: Int, _ num: Int) -> Int {
    let layer = (num - 1) / w
    let idxInLayer = (num - 1) % w
    
    let position = layer % 2 == 0 ? idxInLayer : w - 1 - idxInLayer
    
    var count = 1
    let totalLayers = (n - 1) / w + 1
    
    for upperLayer in (layer + 1)..<totalLayers {
        let boxesInLayer = min(w, n - upperLayer * w)
        
        if upperLayer % 2 == 0 {
            if position < boxesInLayer {
                count += 1
            }
        } else {
            if position >= w - boxesInLayer {
                count += 1
            }
        }
    }
    
    return count
}
