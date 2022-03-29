# 사진 앨범 접근

### 작업 내용

- [x] Photos 라이브러리 접근 권한 얻기
- [x] Custom CollectionView Cell 구현
- [x] 라이브버리의 이미지를 CollectionVIew 에 표시
- [x] 옵저버를 추가해 라이브러리에 변경사항이 생기면 앱에 반영

### 힉습 키워드

- PhotoKit vs. AVFoundation
- PHPhotoLibrary
- PHImageManager vs. PHCachingImageManger
- PHAsset & PHFetchResult & PHFetchOptions
- PHPhotoLibraryChangeObserver 프로토콜
  & PHChange

### 결과물

<image src="https://github.com/codesquad-members-2022/swift-photos-10/blob/9839a536b2c955ca9bfcc4463f65bf9308cffd09/images/PhotoAlbum-Stpe2.gif?raw=true"  width="200px" />

### 느낀점

- 드로잉 앱에서 배운 MVC 패턴을 이번 과제에도 적용해보고 싶어 Model 을 만들었는데 PHPhotoLibraryChangeObserver 프로토콜을 사용하는 과정에서 복잡도만 높이는 것 같아 삭제했습니다.
- fetch 받아온 이미지를 Model 에 저장해 활용하고 싶은데 Model 이 Photos 프래임워크를 모르게 하려니 고민이 됩니다.

## AVFoundation & PhotoKit

### AVFoundation

- 오디오, 비디오를 다루는 프래임워크
  - 편집, 녹화, 캡처, 불러오기 내보내기 등 기능 제공

### PhotoKit

- Photos 앱을 조작할 수 있는 API 를 제공하는 프래임워크
- 사진 fetching 시 자동으로 권한 물어봄
  - fetching 메소드가 호출 되는 시점에 권한 물어봄

### 문제.1 CollectionViewCell 가로모드 너비

viewWillLayoutSubviews + CollectionFlowLayout
