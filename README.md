# MiniGallery



### Pod MiniGallery



```swift

import MiniGallery

// 在vc中
gallery = Gallery()
gallery.dataSource = self

// 需要实现 GalleryDataSource协议
func galleryNumberOfItems() -> Int 
func gallery(modelForItemAt indexPath: IndexPath) -> GalleryModel? 

// 数据变动后刷新
gallery.reloadData()

```



##### MiniGallery已实现功能

- 多级视图联动 (两个CollectionView)
- 外部加载数据源，并展示图片(基于SDWebImage)和视频(基于AVKit)



##### 待实现功能

- 可外部定制的VideoCell和ImageCell (目前都是取的默认cell)
- 视频缓存，可实现AVAssetResourceLoaderDelegate协议完成
- 视频展示性能和交互优化
- 部分bug修复

