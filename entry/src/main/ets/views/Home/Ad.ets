@Component
export default struct Ad {

  @Prop adPicture: string

  build() {
    Row() {
      Image(this.adPicture)
        .height(61)
    }
    .width('100%')
  }
}