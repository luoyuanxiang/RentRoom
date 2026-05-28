@Component
export default struct NavBar {

  @Prop bgColor: ResourceColor
  @Prop fontColor: ResourceColor

  build() {
    Column() {
      Row() {
        Row({ space: 10 }) {
          Text('请选择地址')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .fontColor(this.fontColor)

          Image($r('app.media.arrow_down1'))
            .width(6)
            .height(6)
            .fillColor(this.fontColor)
        }

        Row({ space: 10 }) {
          Row({ space: 30 }) {
            Column({ space: 10 }) {
              Image($r('app.media.message'))
              .width(20)
              .height(20)
                .fillColor(this.fontColor)

              Text('消息')
                .fontSize(10)
                .fontWeight(FontWeight.Medium)
                .fontColor(this.fontColor)
            }

            Column({ space: 10 }) {
              Image($r('app.media.customer'))
                .width(20)
                .height(20)
                .fillColor(this.fontColor)

              Text('客服')
                .fontSize(10)
                .fontWeight(FontWeight.Medium)
                .fontColor(this.fontColor)
            }
          }
        }
      }.width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }.padding({
      left: 10,
      right: 10
    })
  }
}