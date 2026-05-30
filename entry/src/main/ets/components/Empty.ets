@Component
export default struct Empty {
  @Prop title: string
  build() {
    Column({ space: 19 }) {
      Image($r('app.media.blank')).width(150).height(140).objectFit(ImageFit.Fill)
      Text(this.title).fontSize(12)
    }.width('100%')
  }
}
