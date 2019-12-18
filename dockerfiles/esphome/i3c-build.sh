
baseImage='arm64v8/debian:buster'
if [ $i3cPlatform == "armhf" ]; then
	baseImage='arm32v7/debian:buster'
fi
_echoi "EspHome base image platform: $baseImage"

dParams="--build-arg BASE_IMAGE=$baseImage"
