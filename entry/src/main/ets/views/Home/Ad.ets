@Component
export default struct Ad {

  @Prop adPicture: string

  build() {
    Row() {
      Image(this.adPicture)
        .width(328)
        .height(61)
    }
    .width('100%')
  }
}