TAG := development
IMAGE := cusspvz/autotune

test:
	@docker run \
		--rm -ti \
		--privileged
		${IMAGE}:${TAG}

build:
	@docker build -t ${IMAGE}:${TAG} .

push: build
	@docker push ${IMAGE}:${TAG}

tag: build push
	@git tag -a ${TAG}
	@git push origin --tags
