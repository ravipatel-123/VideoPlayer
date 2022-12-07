# VideoPlayer

# To show video List with video thumbnail images
  
  let videoPlayerList = VideoListViewController(nibName: "VideoListViewController", bundle: nil
  
  let navigationController = UINavigationController(rootViewController: videoPlayerList)
  
  videoPlayerList.urlStrings = urls /// PASS THE URLS STRINGS
  
  self.present(navigationController, animated: true)
  
