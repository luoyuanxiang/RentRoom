@Component
export default struct Ad {
  @State adPicture: string = 'http://192.168.101.24:6060/public/home_ad.jpg'

  build() {
    Row() {
      Image(this.adPicture)
        .width(328)
        .height(61)
    }
    .width('100%')
  }
}