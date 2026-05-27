import { ITileItem } from "../../model/HomeData";

@Component
export default struct TileList {
  @State tileList: ITileItem[] = [
    {
      "id": 1,
      "imageURL": "http://localhost:6060/public/home_tile_1.jpg",
      "title": "硅谷家服",
      "sub_title": "搬家·保洁·清洁·维修"
    },
    {
      "id": 2,
      "imageURL": "http://localhost:6060/public/home_tile_2.jpg",
      "title": "硅谷智能",
      "sub_title": "全屋智能家装"
    }
  ]

  build() {
    Row({ space: 20 }) {
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
    }.margin({ top: 10 })
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}