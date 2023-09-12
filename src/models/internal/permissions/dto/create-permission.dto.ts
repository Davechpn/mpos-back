export class CreatePermissionDto {
    id: string
    accessLevel: PermissionTypes
    domainId: String
    roleId: String
}

enum PermissionTypes {
    Viewer = "Viewer",
    Editor = "Editor",
    Admin = "Admin"
}

