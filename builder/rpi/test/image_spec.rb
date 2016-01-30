require 'serverspec'
set :backend, :exec

describe "Raw Image" do
  let(:image_path) { return '/rpi-raw.img' }

  it "exists" do
    image_file = file(image_path)
    expect(image_file).to exist
  end

  context "Partition table" do
    let(:stdout) { command("fdisk -l #{image_path} | grep '^/rpi-raw'").stdout }

    it "has 2 partitions" do
      partitions = stdout.split(/\r?\n/)
      expect(partitions.size).to be 2
    end

    it "has a boot-partition with a sda1 W95 FAT32 filesystem" do
      expect(stdout).to contain('^.*\.img1 .*W95 FAT32 \(LBA\)$')
    end

    it "has a root-partition with a sda2 Linux filesystem" do
      expect(stdout).to contain('^.*\.img2 .*Linux$')
    end
  end
end