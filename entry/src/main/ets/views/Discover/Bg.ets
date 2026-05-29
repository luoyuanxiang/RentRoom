@Component
export default struct Bg {

  @StorageProp('topRectHeight') topRectHeight: number = 0

  build() {
    Image($r('app.media.discover_bg'))
      .width('100%')
      .height(322 + this.getUIContext().px2vp(this.topRectHeight))
      .objectFit(ImageFit.Fill)
  }
}