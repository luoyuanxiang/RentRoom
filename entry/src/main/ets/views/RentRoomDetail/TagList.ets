import { ITag } from "../../model/RentRoomData";

@Component
export default struct TagList {
  @Link tagList: ITag[]

  build() {
    Row({ space: 14 }) {
      ForEach(this.tagList.slice(0, 4), (item: ITag) => {
        Text(item.name)
          .fontSize(10)
          .backgroundColor('#F8F9FC')
          .padding({
            bottom: 4,
            left: 8,
            right: 8
          })
          .borderRadius(2)
          .fontColor('#666')
      }, (item: ITag) => item.name)
    }.width('100%').padding({ top: 15 })
    .justifyContent(FlexAlign.SpaceBetween)
  }
}