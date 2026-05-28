@Component
export default struct Bg {
  build() {
    Stack() {
      Image($r('app.media.service_bg'))
        .width('100%')

      Image($r('app.media.arrow_down'))
        .width(10)
        .height(10)
        .margin({ top: 176 })
    }
  }
}