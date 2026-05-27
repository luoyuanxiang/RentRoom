import { ITileItem } from "../../model/HomeData";

@Component
export default struct TileList {
  @State tileList: ITileItem[] = [
    {
      "id": 1,
      "imageURL": "http://192.168.101.24:6060/public/home_tile_1.jpg",
      "title": "硅谷家服",
      "sub_title": "搬家·保洁·清洁·维修"
    },
    {
      "id": 2,
      "imageURL": "http://192.168.101.24:6060/public/home_tile_2.jpg",
      "title": "硅谷智能",
      "sub_title": "全屋智能家装"
    }
  ]

  build() {
    Row() {
      ForEach(this.tileList, (item: ITileItem) => {
        Column({ space: 10 }) {
          Image(item.imageURL)
            .width(148)
            .height(57)
            .objectFit(ImageFit.Fill)

          Row() {
            Text(item.title)
              .fontSize(12)
              .fontWeight(FontWeight.Medium)

            Text(item.sub_title)
              .fontSize(10)
              .fontWeight(FontWeight.Medium)
              .fontColor('#999999')
          }
        }
      })
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
  }
}