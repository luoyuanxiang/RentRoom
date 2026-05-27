import { INavItem } from "../../model/HomeData";

@Component
export default struct NavList {
  @State navList: INavItem[] = [
    {
      "id": 1,
      "title": "合租",
      "imageURL": "http://localhost:6060/public/home_nav_1.jpg"
    },
    {
      "id": 2,
      "title": "独立主卧",
      "imageURL": "http://localhost:6060/public/home_nav_2.jpg"
    },
    {
      "id": 3,
      "title": "整租1租",
      "imageURL": "http://localhost:6060/public/home_nav_3.jpg"
    },
    {
      "id": 4,
      "title": "整租2-3租",
      "imageURL": "http://localhost:6060/public/home_nav_4.jpg"
    },
    {
      "id": 5,
      "title": "小客厅",
      "imageURL": "http://localhost:6060/public/home_nav_5.jpg"
    },
    {
      "id": 6,
      "title": "大客厅",
      "imageURL": "http://localhost:6060/public/home_nav_6.jpg"
    },
    {
      "id": 7,
      "title": "短租",
      "imageURL": "http://localhost:6060/public/home_nav_7.jpg"
    },
    {
      "id": 8,
      "title": "押金0首付",
      "imageURL": "http://localhost:6060/public/home_nav_8.jpg"
    }
  ]

  build() {
    Column() {
      Grid() {
        ForEach(this.navList, (item: INavItem) => {
          GridItem() {
            Column({ space: 8 }) {
              Image(item.imageURL)
                .width('100%')
                .height(56)
                .objectFit(ImageFit.Fill)
              Text(item.title)
                .fontSize(12)
            }
          }.width(57)
        }, (item: INavItem) => item.id + '')
      }
      .rowsTemplate('1fr 1fr')
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .margin({ top: 10 })
      .height(170)
    }.width('100%')
  }
}