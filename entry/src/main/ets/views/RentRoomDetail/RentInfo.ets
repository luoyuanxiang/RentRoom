import { IRentInfo } from "../../model/RentRoomData";

@Component
export default struct RentInfo {
  @Link rentInfoList: IRentInfo[]

  build() {
    Column({ space: 8 }) {
      Text('租客信息').fontSize(18).fontWeight(700)
      ForEach(this.rentInfoList, (rentInfo: IRentInfo) => {
        Row({ space: 8 }) {
          Image(rentInfo.image).width(34)
          Text(rentInfo.title).fontSize(12)
          Blank()
          Text(rentInfo.userTag).fontColor('#999999').fontSize(12)
        }.backgroundColor('#FAF8FB').padding({ top: 4, bottom: 4, left: 8, right: 8 }).width('100%').height(42).margin({ top: 8 })
      }, (rentInfo: IRentInfo) => rentInfo.userTag)
      Text('*已出租房屋为您展示房屋签约人信息').fontColor('#999999').fontSize(16)
    }.alignItems(HorizontalAlign.Start).margin({ top: 20 })
  }

}