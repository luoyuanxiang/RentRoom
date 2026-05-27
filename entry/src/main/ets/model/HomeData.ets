export interface IHomeData {
  adPicture: string;
  bannerList: IBannerItem[];
  navList: INavItem[];
  planList: IPlanItem[];
  tileList: ITileItem[];
}

export interface IBannerItem {
  id: number;
  imageURL: string;
  name: string;
}

export interface INavItem {
  id: number;
  imageURL: string;
  title: string;
}

export interface IPlanItem {
  id: number;
  imageURL: string;
}

export interface ITileItem {
  id: number;
  imageURL: string;
  sub_title: string;
  title: string;
}