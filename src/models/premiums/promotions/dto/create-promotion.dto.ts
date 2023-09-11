export class CreatePromotionDto {
    name: string
    description: string
    startDate: Date
    endDate: Date
    createdById?: string
    features?: { id: string }[]
    industries?: { id: string }[]
    countries?: { id: string }[]
    packages?: { id: string }[]
}
