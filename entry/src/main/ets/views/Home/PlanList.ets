import { IPlanItem } from "../../model/HomeData";

@Component
export default struct PlanList {
  @State planList: IPlanItem[] = [
    {
      "id": 1,
      "imageURL": "http://192.168.101.24:6060/public/home_plan_1.jpg"
    },
    {
      "id": 2,
      "imageURL": "http://192.168.101.24:6060/public/home_plan_2.jpg"
    },
    {
      "id": 3,
      "imageURL": "http://192.168.101.24:6060/public/home_plan_3.jpg"
    },
    {
      "id": 4,
      "imageURL": "http://192.168.101.24:6060/public/home_plan_4.jpg"
    }
  ]

  build() {
    Row({ space: 10 }) {
      ForEach(this.planList, (item: IPlanItem) => {
        Image(item.imageURL)
          .width(78)
          .height(60)
      })
    }.width('100%')
  }
}