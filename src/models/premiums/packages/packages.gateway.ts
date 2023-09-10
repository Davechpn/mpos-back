import { WebSocketGateway, SubscribeMessage, MessageBody } from '@nestjs/websockets';
import { PackagesService } from './packages.service';
import { CreatePackageDto } from './dto/create-package.dto';
import { UpdatePackageDto } from './dto/update-package.dto';

@WebSocketGateway()
export class PackagesGateway {
  constructor(private readonly packagesService: PackagesService) {}

  @SubscribeMessage('createPackage')
  create(@MessageBody() createPackageDto: CreatePackageDto) {
    return this.packagesService.create(createPackageDto);
  }

  @SubscribeMessage('findAllPackages')
  findAll() {
    return this.packagesService.findAll();
  }

  @SubscribeMessage('findOnePackage')
  findOne(@MessageBody() id: number) {
    return this.packagesService.findOne(id);
  }

  @SubscribeMessage('updatePackage')
  update(@MessageBody() updatePackageDto: UpdatePackageDto) {
    return this.packagesService.update(updatePackageDto.id, updatePackageDto);
  }

  @SubscribeMessage('removePackage')
  remove(@MessageBody() id: number) {
    return this.packagesService.remove(id);
  }
}
