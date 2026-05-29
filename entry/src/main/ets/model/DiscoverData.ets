export interface IDiscoverData {
  benefits: IBenefitItem[];
  danMuList1: IDanMuListItem[];
  danMuList2: IDanMuListItem[];
  postZone: IPostZoneItem;
}

export interface IBenefitItem {
  img: string;
  title: string;
}

export interface IDanMuListItem {
  avatar: string;
  content: string;
}

export interface IPostZoneItem {
  contentBlockList: IContentBlockListItem[];
  mainPost: IMainPostItem;
}

export interface IContentBlockListItem {
  img: string;
}

export interface IMainPostItem {
  followerNum: number;
  postContent: string;
  title: string;
  userAvatar: string;
  userName: string;
}