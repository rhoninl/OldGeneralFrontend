install-dependencies:
	make -f Oldgeneral/OldgeneralProto/Makefile install-swift-dependencies

build-protos:
	protoc --swift_out=. Oldgeneral/OldgeneralProto/*/*.proto