export class CreateFeatureDto {
    name: string
    description: string
    type: FeatureType
    industries?: { id: string }[]
    countries?: { id: string }[]
    Promotions?: { id: string }[]
    Packages?: { id: string }[]
}


enum FeatureType {
    Free = "Free",
    Premium = "Premium"
}