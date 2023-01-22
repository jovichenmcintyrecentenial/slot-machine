import GameplayKit
import SpriteKit


class GameObject : SKSpriteNode,GameObjectProtocol {
    
    //Life cycle
    func reset() {
            
    }
    
    func start() {
        
    }
    
    func update() {
        
    }

    
    //public instance
    var width:CGFloat?
    var height:CGFloat?
    var scale:CGFloat?
    var randomSource:GKARC4RandomSource?
    var randomDist:GKRandomDistribution?
    
    //constructor
    
    init(imageString:String,initalScale:CGFloat){
        
        //init game image
        let texture = SKTexture(imageNamed: imageString)
        let color = UIColor.clear
        super.init(texture: texture, color: color, size: texture.size())
        
        //config
        scale = initalScale
        setScale(scale!)
        width = texture.size().width*scale!
        height = texture.size().height*scale!
        name = imageString
        randomSource = GKARC4RandomSource()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}
