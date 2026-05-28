import ScrollContainer from "../components/ScrollContainer";
import FindRoom from "../views/See/FindRoom";
import NavBar from "../views/See/NavBar";

@Component
export default struct See {
  @Builder
  navBuilder() {
    NavBar()
  }

  @Builder
  contentBuilder() {
    Column() {
      FindRoom()
    }
    .width('100%')
    .height('100%')
    .padding({
      left: 10,
      right: 10
    })
    .linearGradient({
      angle: 180,
      direction: GradientDirection.Top,
      colors: [
        ['#DEFBE5', 0],
        ['#ffffff', 0.3],
        ['#ffffff', 1],
      ],
      repeating: false
    })
  }

  build() {
    ScrollContainer({
      contentBuilder: this.contentBuilder,
      navBuilder: this.navBuilder
    })
  }
}