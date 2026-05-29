import NavBar from '../../components/NavBar'
import SearchFilter from '../../views/RentRoomList/SearchFilter'
import WaterfallFlow from '../../views/RentRoomList/WaterfallFlow'

@Entry
@Component
struct RentRoomList {
  // 顶部导航栏高度
  @StorageProp('topRectHeight') topRectHeight: number = 0

  build() {
    Stack() {
      Column() {
        WaterfallFlow()
      }.padding({ top: this.getUIContext().px2vp(this.topRectHeight) + 88 })

      Column() {
        NavBar({ title: '租房列表' })
        SearchFilter()
      }
      .padding({ top: this.getUIContext().px2vp(this.topRectHeight) })
    }
    .alignContent(Alignment.TopStart)
  }
}