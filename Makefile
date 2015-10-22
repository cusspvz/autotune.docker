TAG := development
IMAGE := cusspvz/tunesys

test:
	@docker run \
		--rm -ti \
		--privileged
		$IMAGE:$TAG

build:
	@docker build -t $IMAGE:TAG .

push: build
	@docker push $IMAGE:$TAG
