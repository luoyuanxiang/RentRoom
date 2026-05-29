@Component
export default struct FindRoom {
  // 顶部导航栏高度
  @StorageProp('topRectHeight') topRectHeight: number = 0

  build() {
    Column({ space: 20 }) {
      Image($r('app.media.find_room'))
        .width(58)
        .height(23)

      Text('发现你想看的房子')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .fontColor($r('sys.color.black'))
        .margin({ top: 20 })

      Column({ space: 20 }) {
        Image($r('app.media.blank'))
          .width(234)
          .height(211)

        Text('暂无想看房源，试试如下找房方式')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('sys.color.black'))

      }.width('100%')
      .alignItems(HorizontalAlign.Center)

      Row() {
        Row({ space: 10 }) {
          Image($r('app.media.bus'))
            .width(34)
            .height(34)
          Column({ space: 10 }) {
            Text('通勤找房')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .fontColor($r('sys.color.black'))

            Text('按公司通勤时长找房')
              .fontSize(12)
              .fontWeight(FontWeight.Medium)
              .fontColor('#999999')
          }.alignItems(HorizontalAlign.Start)
        }

        Row({ space: 10 }) {
          Image($r('app.media.map'))
            .width(34)
            .height(34)
          Column({ space: 10 }) {
            Text('地图找房')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .fontColor($r('sys.color.black'))

            Text('在你想住的地方找房')
              .fontSize(12)
              .fontWeight(FontWeight.Medium)
              .fontColor('#999999')
          }.alignItems(HorizontalAlign.Start)
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .margin({ top: 49 + this.getUIContext().px2vp(this.topRectHeight) })
    .alignItems(HorizontalAlign.Start)
    .width('100%')
  }
}