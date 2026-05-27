@Component
export default struct Ad {
  @State adPicture: string = 'http://localhost:6060/public/home_ad.jpg'

  build() {
    Row() {
      Image(this.adPicture)
        .width(328)
        .height(61)
    }.margin({ top: 10 })
    .width('100%')
  }
}