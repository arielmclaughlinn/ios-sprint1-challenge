import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var movieText: UITextField!
    
    @IBAction func add(_ sender: Any) {
        
        guard let text = movieText.text, !text.isEmpty else { return }
        
        Model.shared.addMovie(text)
        
        movieText.text = nil

    }
    
    
    
    
}
