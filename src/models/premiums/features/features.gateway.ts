import { WebSocketGateway, SubscribeMessage, MessageBody, WebSocketServer } from '@nestjs/websockets';
import { FeaturesService } from './features.service';
import { CreateFeatureDto } from './dto/create-feature.dto';
import { UpdateFeatureDto } from './dto/update-feature.dto';

@WebSocketGateway()
export class FeaturesGateway {
  @WebSocketServer()
  server

  constructor(private readonly featuresService: FeaturesService) {}
   
  @SubscribeMessage('createFeature')
  async create(@MessageBody() createFeatureDto: CreateFeatureDto) {
    await this.featuresService.create(createFeatureDto);
    const features = await this.featuresService.findAll();
    this.server.emit('AllFeatures', features)
  }

  @SubscribeMessage('getAllFeatures')
  async findAll() {
    const features = await this.featuresService.findAll();
    this.server.emit('AllFeatures', features)
  }

  @SubscribeMessage('findOneFeature')
  findOne(@MessageBody() id: number) {
    return this.featuresService.findOne(id);
  }

  @SubscribeMessage('updateFeature')
  update(@MessageBody() updateFeatureDto: UpdateFeatureDto) {
    return this.featuresService.update(updateFeatureDto.id, updateFeatureDto);
  }

  @SubscribeMessage('removeFeature')
  remove(@MessageBody() id: number) {
    return this.featuresService.remove(id);
  }
}
