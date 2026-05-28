export interface IServiceData {
  cleaningServiceInfo: ICleaningServiceInfoItem[];
  homeServiceList: IHomeServiceItem[];
  newcomerZone: INewcomerZoneItem;
  serviceActivity: IServiceActivityItem;
  vipServiceList: IVipServiceListItem[];
}

export interface ICleaningServiceInfoItem {
  img: string;
  originalPrice: string;
  priceAfterDiscounts: string;
  subTitle: string;
  title: string;
}

export interface IHomeServiceItem {
  icon: string;
  title: string;
}

export interface INewcomerZoneItem {
  img: string;
}

export interface IServiceActivityItem {
  img: string;
  name: string;
  subTitle: string;
  title: string;
}

export interface IVipServiceListItem {
  content: number;
  name: string;
}