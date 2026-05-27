import { IPlanItem } from "../../model/HomeData";

@Component
export default struct PlanList {
  @State planList: IPlanItem[] = [
    {
      "id": 1,
      "imageURL": "http://localhost:6060/public/home_plan_1.jpg"
    },
    {
      "id": 2,
      "imageURL": "http://localhost:6060/public/home_plan_2.jpg"
    },
    {
      "id": 3,
      "imageURL": "http://localhost:6060/public/home_plan_3.jpg"
    },
    {
      "id": 4,
      "imageURL": "http://localhost:6060/public/home_plan_4.jpg"
    }
  ]

  build() {
    Row({ space: 10 }) {
      ForEach(this.planList, (item: IPlanItem) => {
        Image(item.imageURL)
          .width(78)
          .height(60)
      })
    }
    .margin({ top: 10 })
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}