export class CreateUserDto {
    name: string
    email: string
    password?: string
    token?: string
    fcm_token?: string
    avatar?: string
    roleId?: string
    suspendendAt?: Date
    status?: UserStatus
    streetAddress?: string
    city?: string
    cell?: string
    tell?: string
    verificationCode?: number
    countryId?: string
    teams?: { id: string }[]

}

enum UserStatus {
    Active = "Active",
    Suspendend = "Suspendend",
    Invited = "Invited"
}
