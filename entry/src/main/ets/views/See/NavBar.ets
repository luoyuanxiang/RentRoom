@Component
export default struct NavBar {
  build() {
    Row() {
      Row({ space: 6 }) {
        Image($r('app.media.bag'))
          .width(16)
          .height(16)

        Text('填写通勤地址')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('sys.color.black'))
      }

      Row({ space: 30 }) {
        Column({ space: 1 }) {
          Image($r('app.media.message'))
            .width(20)
            .height(20)
            .fillColor($r('sys.color.black'))

          Text('消息')
            .fontSize(12)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('sys.color.black'))
        }

        Column({ space: 1 }) {
          Image($r('app.media.journey'))
            .width(20)
            .height(20)

          Text('行程')
            .fontSize(12)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('sys.color.black'))
        }
      }
    }.width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({
      left: 10,
      right: 10
    })
  }
}