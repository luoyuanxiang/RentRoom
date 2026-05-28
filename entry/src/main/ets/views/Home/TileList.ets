import { ITileItem } from "../../model/HomeData";

@Component
export default struct TileList {
  @Prop tileList: ITileItem[]

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