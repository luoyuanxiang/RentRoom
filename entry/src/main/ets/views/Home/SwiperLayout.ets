import { IBannerItem } from "../../model/HomeData"

@Preview
@Component
export default struct SwiperLayout {

  @State bannerList: IBannerItem[] = [
    {
      "id": 1,
      "name": "banner1",
      "imageURL": "http://192.168.101.24:6060/public/home_banner_1.jpg"
    },
    {
      "id": 2,
      "name": "banner2",
      "imageURL": "http://192.168.101.24:6060/public/home_banner_2.jpg"
    },
    {
      "id": 3,
      "name": "banner3",
      "imageURL": "http://192.168.101.24:6060/public/home_banner_3.jpg"
    },
    {
      "id": 4,
      "name": "banner4",
      "imageURL": "http://192.168.101.24:6060/public/home_banner_4.jpg"
    }
  ]
  build() {
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