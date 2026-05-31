import { ISupport } from "../../model/RentRoomData";

@Component
export default struct SupportList {
  @Link supportList: ISupport[]

  build() {
    Column({ space: 8 }) {
      Text('租住服务与保障').fontSize(16).fontWeight(700)
      Text('谷粒专享').grayText(12)
      Grid() {
        ForEach(this.supportList, (support: ISupport) => {
          GridItem() {
            Row({ space: 10 }) {
              Image(support.image).width(28)
              Column() {
                Text(support.title).fontSize(14)
                Text(support.subTitle).grayText(10)
              }.alignItems(HorizontalAlign.Start)
            }.width('100%')
          }
        }, (support: ISupport) => support.title)
      }
      .columnsTemplate('1fr 1fr')
      .rowsTemplate('1fr 1fr')
      .rowsGap(16)
      .height(76)
      .margin({ top: 5 })
    }.alignItems(HorizontalAlign.Start).margin({ top: 20 })
  }
}


@Extend(Text)
function grayText(size: number) {
  .fontColor('#999999').fontSize(size)
}