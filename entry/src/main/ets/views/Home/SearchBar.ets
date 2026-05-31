@Component
export default struct SearchBar {

  @Prop bgColor: ResourceColor
  @Prop fontColor: ResourceColor

  build() {
    Row() {

      Text('北京').fontSize(14).fontColor(this.fontColor)

      Row() {
        Image($r('app.media.search'))
          .width(18)
          .height(18)
          .margin({left: 10, right: 10})
          .fillColor('#7F7F7F')
          .onClick(() => {
            this.getUIContext().getRouter().pushUrl({
              url: 'pages/RentRoom/RentRoomList'
            }, () => {})
          })

        TextInput({ placeholder: '公司/地铁/小区，马上搜索'})
          .layoutWeight(1)
          .placeholderColor('#999999')
          .placeholderFont({ size: 12 })
          .caretColor('#999999')
          .padding(0)
          .backgroundColor(this.bgColor)

        Column() {
        }.width(1).height(18).backgroundColor('#D7D7D7').margin({ left: 10 })

        Image($r("app.media.position"))
          .width(18)
          .height(18)
          .margin({ left: 10, right: 10 })
      }
      .width(244)
      .height(38)
      .backgroundColor(Color.White)
      .border({
        width: 1,
        color: '#D7D7D7',
        radius: 52
      })

      Image($r('app.media.message'))
        .width(18)
        .height(18)
        .fillColor(this.fontColor)
    }
    .width('100%')
    .padding({
      left: 10,
      right: 10,
      top: 4,
      bottom: 4
    })
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(this.bgColor)
  }
}