import { HousePictureListData, HousePictureListDataSource } from "../../model/HousePictureListDataSource";
import { IHousePicture } from "../../model/RentRoomData";

@Component
export default struct NavSwiper {
  // 顶部导航栏高度
  @StorageProp('topRectHeight') topRectHeight: number = 0
  @Prop @Watch('handleHousePictureListChange') housePictureList: IHousePicture[]
  @State housePictureListDataSource: HousePictureListDataSource = new HousePictureListDataSource();
  @State currentTabIndex: number = 0
  scroller: Scroller = new Scroller()
  @State isGoCurrentTabIndexImage: boolean = false

  handleHousePictureListChange() {
    this.housePictureList.forEach((item: IHousePicture, index: number) => {
      item.picList.forEach((p: string) => {
        const data: HousePictureListData = {
          url: p,
          curentIndex: index
        }
        this.housePictureListDataSource.setData(data)
      })
    })
    this.isGoCurrentTabIndexImage = true;
    setTimeout(() => {
      this.isGoCurrentTabIndexImage = false;
    }, 500)
  }

  setCurrentTabIndex(index: number) {
    this.currentTabIndex = index;
    this.goCurrentTabIndexImage()
  }

  handleListScrollIndex(start: number) {
    if (this.isGoCurrentTabIndexImage) return;
    const pic = this.housePictureListDataSource.getData(start);
    if (pic) {
      this.currentTabIndex = pic.curentIndex;
    }
  }

  goCurrentTabIndexImage() {
    const index = this.housePictureListDataSource.originDataArray.findIndex(pic => {
      return pic.curentIndex === this.currentTabIndex
    })
    this.scroller.scrollTo({
      xOffset: 318 * index + 10 * (index - 1),
      yOffset: 0,
      animation: {
        duration: 500,
        curve: Curve.EaseIn
      }
    })
  }

  @Builder
  NavBar() {
    List({ space: 6 }) {
      ForEach(this.housePictureList, (item: IHousePicture, index: number) => {
        ListItem() {
          Column({ space: 6 }) {

            Text(`${item.picList.length > 0 ? item.spaceName + '(' + item.picList.length + ')' : item.spaceName}`)
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .fontColor(this.currentTabIndex === index ? '#262626' : '#666666')

            if (this.currentTabIndex === index) {
              Divider()
                .backgroundColor('#36D1A1')
                .width(16)
                .height(2)
            }
          }
        }
        .onClick(() => {
          this.setCurrentTabIndex(index)
        })
      })
    }.listDirection(Axis.Horizontal)
    .width('100%')
  }

  @Builder
  PicList() {
    List({ space: 6, scroller: this.scroller }) {
      LazyForEach(this.housePictureListDataSource, (item: HousePictureListData) => {
        ListItem() {
          Image(item.url)
            .objectFit(ImageFit.Fill)
            .width(318)
            .height(192)
        }
      })
    }
    .width('100%').listDirection(Axis.Horizontal)
    .onScrollIndex((start: number) => {
      this.handleListScrollIndex(start)
    })
  }

  build() {
    Column({ space: 16 }) {
      this.NavBar()
      this.PicList()
    }.width('100%')
    .padding({
      top: 30 + this.getUIContext().px2vp(this.topRectHeight),
    })
  }
}