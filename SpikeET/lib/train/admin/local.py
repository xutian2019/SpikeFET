class EnvironmentSettings:
    def __init__(self):
        self.workspace_dir = '/mnt/data/yjj/SpikeET'    # Base directory for saving network checkpoints.
        self.tensorboard_dir = '/mnt/data/yjj/SpikeET/tensorboard'    # Directory for tensorboard files.
        self.pretrained_networks = '/mnt/data/yjj/SpikeET/pretrained_networks'
        self.lasot_dir = '/mnt/data/yjj/SpikeET/data/lasot'
        self.got10k_dir = '/mnt/data/yjj/SpikeET/data/got10k/train'
        self.got10k_val_dir = '/mnt/data/yjj/SpikeET/data/got10k/val'
        self.trackingnet_dir = '/mnt/data/yjj/SpikeET/data/trackingnet'
        self.coco_dir = '/mnt/data/yjj/SpikeET/data/coco'
        self.coesot_val_dir = '/mnt/data/yjj/SpikeET/data/COESOT/test'
        self.coesot_dir = '/mnt/data/yjj/SpikeET/data/COESOT/train'
        self.fe108_dir = '/mnt/data/yjj/SpikeET/data/FE108/train'
        self.fe108_val_dir = '/mnt/data/yjj/SpikeET/data/FE108/test'
        self.visevent_dir = '/home/work/yjj/VisEvent/train'
        self.visevent_val_dir = '/home/work/yjj/VisEvent/test'
