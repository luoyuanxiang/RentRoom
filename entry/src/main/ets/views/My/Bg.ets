@Component
export default struct Bg {
  // 顶部导航栏高度
  @StorageProp('topRectHeight') topRectHeight: number = 0

  build() {
    Column() {
    }.width('100%').height(211 + this.getUIContext().px2vp(this.topRectHeight)).linearGradient({
      angle: 180,
      colors: [
        ['#6DC782', 0],
        ['#8FE1A2', 0.43],
        ['#8FE1A2', 1],
      ]
    })
  }
}