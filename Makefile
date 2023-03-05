install-dependencies:
	make -f OldGeneral/OldgeneralProto/Makefile install-swift-dependencies

build-protos:
	protoc --swift_out=. OldGeneral/OldgeneralProto/*/*.proto