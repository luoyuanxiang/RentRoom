@Component
export default struct NavBar {
  @Prop title: string

  build() {
    Row() {
      Row() {
        Image($r('app.media.back'))
          .width(24)
          .height(24)
          .objectFit(ImageFit.Fill)

        Text(this.title)
          .fontSize(12)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('sys.color.black'))
      }
      .onClick(() => {
        this.getUIContext().getRouter().back()
      })

      Image($r('app.media.share'))
        .width(20)
        .height(20)
        .objectFit(ImageFit.Fill)
    }.justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .padding({
      right: 10
    })
  }
}