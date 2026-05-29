@Component
export default struct NavBar {
  @Prop bgColor: ResourceColor
  @Prop fontColor: ResourceColor

  build() {
    Row() {
      Row() {
        Image($r('app.media.switch')).width(16)
        Text('业主版').fontSize(12)
      }
      .borderRadius(31)
      .backgroundColor('rgba(255, 255, 255, 0.65)')
      .width(79)
      .height(26)
      .justifyContent(FlexAlign.Center)

      Row({ space: 16 }) {
        Image($r('app.media.family_services')).width(20).height(20).fillColor(this.fontColor)
        Image($r('app.media.message')).width(20).height(20).fillColor(this.fontColor)
        Image($r('app.media.setting')).width(20).height(20).fillColor(this.fontColor)
      }
    }
    .width('100%')
    .height(44)
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({ left: 10, right: 10 })
    .backgroundColor(this.bgColor)
  }
}