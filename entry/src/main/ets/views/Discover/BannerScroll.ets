import { IDanMuListItem } from "../../model/DiscoverData";

@Component
export default struct BannerScroll {
  @Prop bannerList: IDanMuListItem[]

  build() {
    List() {
      ForEach(this.bannerList, (item: IDanMuListItem, index) => {
        ListItem() {
          Row({ space: 6 }) {
            Image(item.avatar)
              .width(24)
              .height(24)
              .objectFit(ImageFit.Fill)
            Text(item.content)
              .fontSize(14)
          }
          .padding({
            top: 6,
            left: 6,
            bottom: 6,
            right: 10
          })
          .borderRadius(42)
          .backgroundColor('#CDFFD9')
          .margin({ left: 10 })
        }
      }, (item: IDanMuListItem, index: number) => JSON.stringify(item) + index)
    }
    .listDirection(Axis.Horizontal) // 排列方向
    .edgeEffect(EdgeEffect.None) // 滑动到边缘无效果
    .width('100%')
    .scrollBar(BarState.Off)
  }
}