@Component
export default struct NavBar {
  @Prop title: string;
  back = () => {
    this.getUIContext().getRouter().back()
  }

  build() {
    Stack() {
      Text(this.title).fontSize(16).width('100%').textAlign(TextAlign.Center)
      Image($r('app.media.back')).width(24).height(24).onClick(this.back)
    }.width('100%').height(44).padding({ left: 10, right: 10 }).alignContent(Alignment.Start)
  }
}