export interface ServiceData {
  cleaningServiceInfo: CleaningServiceInfoItem[];
  homeServiceList: HomeServiceItem[];
  newcomerZone: NewcomerZoneItem;
  serviceActivity: ServiceActivityItem;
  vipServiceList: VipServiceListItem[];
}

export interface CleaningServiceInfoItem {
  img: string;
  originalPrice: string;
  priceAfterDiscounts: string;
  subTitle: string;
  title: string;
}

export interface HomeServiceItem {
  icon: string;
  title: string;
}

export interface NewcomerZoneItem {
  img: string;
}

export interface ServiceActivityItem {
  img: string;
  name: string;
  subTitle: string;
  title: string;
}

export interface VipServiceListItem {
  content: number;
  name: string;
}