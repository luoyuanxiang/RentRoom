import Avatar from "../../components/Avatar"

@Component
export default struct UserInfo {
  @State avatarSrc: string = ''

  build() {
    Row({ space: 10 }) {
      Avatar({ src: this.avatarSrc, avatarSize: 60 })
      Column({ space: 4 }) {
        Text('Hi，小谷粒').fontSize(16).fontColor(Color.White).fontWeight(700)
        Text('谷粒点15').fontSize(12).fontColor(Color.White)
      }.alignItems(HorizontalAlign.Start)
    }.margin({ top: 11 }).width('100%')
  }
}