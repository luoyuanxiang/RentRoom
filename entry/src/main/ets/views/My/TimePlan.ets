@Component
export default struct TimePlan {
  build() {
    Column({ space: 11 }) {
      Row() {
        Text('小谷粒时光计划').fontColor('#2C5B37').fontSize(16).fontWeight(700)
        Image($r('app.media.arrow_right')).width(6).height(12).fillColor('#FF2C5B37').objectFit(ImageFit.Fill)
      }.width('100%').justifyContent(FlexAlign.SpaceBetween)

      Text('签约后可解锁会员权益').fontColor('#2C5B37').fontSize(12)
    }
    .width('100%')
    .height(80)
    .margin({ top: 15 })
    .borderRadius(10)
    .padding({
      left: 22,
      right: 22,
      top: 18,
      bottom: 18
    })
    .alignItems(HorizontalAlign.Start)
    .linearGradient({
      angle: 116,
      colors: [
        ['#FFF1CD', 0],
        ['#FFEBB5', 1],
      ]
    })
  }
}