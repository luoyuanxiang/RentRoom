@Component
export default struct Card {
  @Prop cardPadding: number
  @BuilderParam render: () => void

  build() {
    Column() {
      this.render()
    }
    .padding(this.cardPadding)
    .backgroundColor(Color.White)
    .borderRadius(20)
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }
}