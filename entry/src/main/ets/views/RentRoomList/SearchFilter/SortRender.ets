import { ISortItem } from "../../../model/RentRoomData"
import { globalEmitter } from "../../../utils/emitter"

@Component
export default struct SortRender {
  @Link currentSearchType: string
  @Link searchSort: ISortItem
  // 排序
  @State sortList: ISortItem[] = [
    {
      id: 1,
      icon: $r('app.media.sort'),
      text: '综合排序',
      orderBy: '面积',
      orderType: 'asc'
    },
    {
      id: 2,
      icon: $r('app.media.rent'),
      text: '价格从低到高',
      orderBy: '价格',
      orderType: 'asc'
    },
    {
      id: 3,
      icon: $r('app.media.rent'),
      text: '价格从高到低',
      orderBy: '价格',
      orderType: 'desc'
    },
    {
      id: 4,
      icon: $r('app.media.area'),
      text: '面积从大到小',
      orderBy: '面积',
      orderType: 'desc'
    },
    {
      id: 5,
      icon: $r('app.media.area'),
      text: '面积从小到大',
      orderBy: '面积',
      orderType: 'asc'
    },
  ]
  @State sort: ISortItem = {
    id: 1,
    icon: $r('app.media.sort'),
    text: '综合排序',
  }

  aboutToAppear(): void {
    this.sort = this.searchSort
  }

  handleSortChange(sort: ISortItem) {
    this.sort = sort
    this.searchSort = sort
    this.sortSearch()
  }

  sortSearch() {
    globalEmitter.emit('searchOptionsChange', {
      orderBy: this.searchSort.orderBy,
      orderType: this.searchSort.orderType,
    })
    this.currentSearchType = ''
  }

  sortReset() {
    this.searchSort = {} as ISortItem
  }
  build() {
    Column() {
      Column() {
        Column() {
          ForEach(this.sortList, (sort: ISortItem) => {
            Row({ space: 8 }) {
              Image(sort.icon).width(16)
              Text(sort.text)
                .fontSize(10)
                .fontColor(this.searchSort.id === sort.id ? '#67C0A8' : '#666666')
            }.height(34).onClick(() => {
              this.handleSortChange(sort)
              this.currentSearchType = ''
            })
          }, (sort: ISortItem) => sort.id + '')
        }.padding({ left: 20, top: 8, bottom: 16 }).alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .backgroundColor(Color.White)
      .padding({ left: 10, right: 10 })
      .alignItems(HorizontalAlign.Start)


      Row() {
      }.width('100%').layoutWeight(1).backgroundColor('rgba(0, 0, 0, 0.7)').onClick(() => {
        this.currentSearchType = ''
      })
    }
  }
}