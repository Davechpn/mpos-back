export class CreateFeatureDto {
    name:string
    description:string
    type:FeatureType
    industries:string[]
    countries:string[]
}
export const enum FeatureType{
    Free = "free",
    Premium = "premium"
}
