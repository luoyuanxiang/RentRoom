import { INavItem } from "../../model/HomeData";

@Component
export default struct NavList {
  @Prop navList: INavItem[]

  build() {
    Column() {
      Grid() {
        ForEach(this.navList, (item: INavItem) => {
          GridItem() {
            Column({ space: 8 }) {
              Image(item.imageURL)
                .width('100%')
                .height(56)
                .objectFit(ImageFit.Fill)
              Text(item.title)
                .fontSize(12)
            }
          }.width(57)
        }, (item: INavItem) => item.id + '')
      }
      .rowsTemplate('1fr 1fr')
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .columnsGap(33)
      .rowsGap(14)
      .height(170)
      .margin({ top: 24 })
    }.width('100%')
  }
}