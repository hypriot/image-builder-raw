require 'serverspec'
set :backend, :exec

describe "Raw Image" do
  let(:image_path) { return '/odroid-raw.img' }

  it "exists" do
    image_file = file(image_path)
    expect(image_file).to exist
  end

  context "Partition table" do
    let(:stdout) { command("fdisk -l #{image_path} | grep '^/odroid-raw'").stdout }

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

    it "partition sda1 starts at sector 3072" do
      expect(stdout).to contain('^.*\.img1\ *3072 .*$')
    end

    it "partition sda1 has a size of 64M" do
      expect(stdout).to contain('^.*\.img1.* 64M  c.*$')
    end
  end
end
