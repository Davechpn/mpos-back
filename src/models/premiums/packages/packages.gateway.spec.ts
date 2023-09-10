import { Test, TestingModule } from '@nestjs/testing';
import { PackagesGateway } from './packages.gateway';
import { PackagesService } from './packages.service';

describe('PackagesGateway', () => {
  let gateway: PackagesGateway;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [PackagesGateway, PackagesService],
    }).compile();

    gateway = module.get<PackagesGateway>(PackagesGateway);
  });

  it('should be defined', () => {
    expect(gateway).toBeDefined();
  });
});
