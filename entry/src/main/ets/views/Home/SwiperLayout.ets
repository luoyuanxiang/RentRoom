import { IBannerItem } from "../../model/HomeData"

@Component
export default struct SwiperLayout {

  @Prop bannerList: IBannerItem[]

  build() {
    if (this.bannerList.length > 0) {
      Swiper() {
        ForEach(this.bannerList, (item: IBannerItem) => {
          Image(item.imageURL).width('100%').height(211)
        }, (item: IBannerItem) => item.id + '')
      }
      .autoPlay(true)
      .loop(true)
      .indicator(Indicator.dot().color('#CCCBCB').selectedColor('#479559'))
      .width('100%')
    }
  }
}