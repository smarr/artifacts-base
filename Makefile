all: ~/artifacts/xenial64/artifact-base-xenial64.ova ~/artifacts/bionic64/artifact-base-bionic64.ova


~/artifacts/xenial64/artifact-base-xenial64.ova: artifact-base-1604.json scripts/basic-setup.sh scripts/preseed.cfg
	packer build -force artifact-base-1604.json
	rm -Rf ~/artifacts/xenial64/
	mv builds/artifact-base/xenial64 ~/artifacts/
	chmod a+r ~/artifacts/xenial64/*

~/artifacts/bionic64/artifact-base-bionic64.ova: artifact-base-1804.json scripts/basic-setup.sh scripts/preseed.cfg
	packer build artifact-base-1804.json
	rm -Rf ~/artifacts/bionic64/
	mv builds/artifact-base/bionic64 ~/artifacts/
	chmod a+r ~/artifacts/bionic64/*

