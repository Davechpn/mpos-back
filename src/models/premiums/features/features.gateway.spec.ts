import { Test, TestingModule } from '@nestjs/testing';
import { FeaturesGateway } from './features.gateway';
import { FeaturesService } from './features.service';

describe('FeaturesGateway', () => {
  let gateway: FeaturesGateway;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [FeaturesGateway, FeaturesService],
    }).compile();

    gateway = module.get<FeaturesGateway>(FeaturesGateway);
  });

  it('should be defined', () => {
    expect(gateway).toBeDefined();
  });
});
