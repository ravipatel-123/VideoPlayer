//
//  VideoListViewController.swift
//  VideoPlayerPod
//
//  Created by bs-mac-4 on 07/12/22.
//

import UIKit
import AVFoundation

class VideoListViewController: UIViewController {

    //MARK: - VARIABLES
    var urlStrings = [String?]()
    
    //MARK: - OUTLETS
    @IBOutlet weak var videoCollectionView: UICollectionView!
    
    //MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupCollectionView()
        videoCollectionView.reloadData()
    }
    
    
    //MARK: - BTNS ACTIONS

}


//MARK: - COLLECTION VIEW METHODS
extension VideoListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private func setupCollectionView() {
        videoCollectionView.registerNib(VideoListCell.self)
        videoCollectionView.delegate = self
        videoCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        urlStrings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: videoCollectionView.frame.width-30, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoListCell", for: indexPath) as? VideoListCell else { return .init() }
        self.setVideoThumbnail(url: urlStrings[indexPath.row], cell: cell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = VideoPlayerVC.FromStoryBoard()
//        vc.url = urlStrings[indexPath.row]
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension VideoListViewController {
    
    private func setVideoThumbnail(url: String?, cell: VideoListCell) {
        
        cell.thumbIma.image = nil
        guard let url = URL(string: url ?? "") else {
            return
        }
        
        DispatchQueue.global().async {
            let asset = AVAsset(url: url)
            let assetImgGenerate : AVAssetImageGenerator = AVAssetImageGenerator(asset: asset)
            assetImgGenerate.appliesPreferredTrackTransform = true
            let time = CMTime(seconds: Double(1), preferredTimescale: 2)//CMTimeMake(value: 1, timescale: 2)
            let img = try? assetImgGenerate.copyCGImage(at: time, actualTime: nil)
            if img != nil {
                let frameImg  = UIImage(cgImage: img!)
                DispatchQueue.main.async(execute: {
                    cell.thumbIma.image = frameImg
                })
            }
        }
    }
    
}
