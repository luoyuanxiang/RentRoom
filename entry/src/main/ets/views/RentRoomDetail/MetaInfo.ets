import { IDistanceInfo, IMetaInfo } from "../../model/RentRoomData";

@Component
export default struct MetaInfo {
  @Link metaInfoList: IMetaInfo[]
  @Link distanceInfo: IDistanceInfo

  build() {
    Row({ space: 4 }) {
      Row() {
        Grid() {
          ForEach(this.metaInfoList, (item: IMetaInfo) => {
            GridItem() {
              Column({ space: 8 }) {
                Text(item.name).fontSize(12).fontColor('#999999')
                Text(item.desc).fontSize(14)
              }.alignItems(HorizontalAlign.Start).width('100%')
            }
          }, (item: IMetaInfo) => item.name)
        }
        .height('100%')
        .rowsTemplate('1fr 1fr')
        .columnsTemplate('1fr 1fr')
        .columnsGap(10)
        .rowsGap(8)
      }.height('100%').width(180).backgroundColor('#F8F9FC')

      Column({ space: 4 }) {
        Column({ space: 7 }) {
          if (this.distanceInfo && this.distanceInfo.line) {
            Row({ space: 4 }) {
              Text(this.distanceInfo.line)
                .fontSize(10)
                .fontColor($r('sys.color.comp_background_list_card'))
                .backgroundColor('#01ab39')
                .padding({
                  top: 2,
                  bottom: 2,
                  left: 7,
                  right: 7
                })
                .borderRadius(2)
              Text(this.distanceInfo.name).fontSize(12)
              Blank()
              Image($r('app.media.arrow_right')).width(4).fillColor('#999999')
            }.width('100%')

            Row({ space: 4 }) {
              Text('步行约').fontColor('#999999').fontSize(12)
              Text(this.distanceInfo.distance).fontSize(12).fontColor('#FF4141')
            }.width('100%')
          } else {
            Text('该房源附近没有地铁').fontSize(12)
          }
        }
        .height(50)
        .backgroundColor('#F8F9FC')
        .width('100%')
        .padding(10)
        .alignItems(HorizontalAlign.Start)

        Column({ space: 7 }) {
          Row({ space: 4 }) {
            Image($r('app.media.bag')).width(16)
            Text('设置公司').fontSize(12)
            Blank()
            Image($r('app.media.arrow_right')).width(4).fillColor('#999999')
          }.width('100%')

          Text('这里查看到公司要多久').fontColor('#999999').fontSize(12).width('100%')
        }.height(50).backgroundColor('#F8F9FC').width('100%').padding(8)
      }.width(162)
    }
    .height(124)
    .width('100%')
    .padding({ top: 16 })
  }
}