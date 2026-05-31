@Component
export default struct Book {
  build() {
    Row() {
      Column({ space: 4 }) {
        Image($r('app.media.my_icon_1')).width(18)
        Text('99+').fontSize(10).fontColor('#999999')
      }
      Column({ space: 4 }) {
        Image($r('app.media.message')).width(18).fillColor(Color.Black)
        Text('咨询').fontSize(10).fontColor('#999999')
      }
      Button('立即预定', { type: ButtonType.Normal }).borderRadius(2).backgroundColor('#24A17B').padding({ left: 30, right: 30 }).height(34)
      Button('去看房',  { type: ButtonType.Normal }).borderRadius(2).backgroundColor('#6BE3BE').padding({ left: 30, right: 30 }).height(34)
    }.backgroundColor(Color.White).height(50).justifyContent(FlexAlign.SpaceEvenly).width('100%')
  }
}