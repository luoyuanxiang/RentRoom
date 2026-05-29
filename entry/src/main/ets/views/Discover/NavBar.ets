@Component
export default struct NavBar {
  @Prop bgColor: ResourceColor
  build() {
    Row() {
      Text('家庭服务')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Image($r('app.media.family_services'))
        .width(30)
        .height(30)
        .borderRadius(50)
    }.width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({
      left: 10,
      right: 10
    })
    .backgroundColor(this.bgColor)
    .height(44)
  }
}