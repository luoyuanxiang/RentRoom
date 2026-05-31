@Component
export default struct RentPrice {
  @Prop rentPriceListing: string
  @Prop rentPriceUnit: string

  build() {
    Row() {
      Row({ space: 2 }) {
        Text('￥').fontSize(16).fontWeight(FontWeight.Bold)
        Text(this.rentPriceListing).fontSize(26).fontWeight(FontWeight.Bold).height(26)
        Text(this.rentPriceUnit).fontSize(12)
      }.alignItems(VerticalAlign.Bottom)

      Row({ space: 2 }) {
        Text('租金试算').fontSize(12).fontColor('#999999')
        Image($r('app.media.arrow_right')).width(4).fillColor('#999999')
      }
    }.justifyContent(FlexAlign.SpaceBetween).width('100%').padding({ top: 15 })
  }
}