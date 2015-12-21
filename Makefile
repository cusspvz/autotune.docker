TAG := development
IMAGE := cusspvz/autotune

test: build
	@docker run \
		--rm -ti \
		--privileged \
		--volume /proc:/host/proc \
		--volume /var/run/docker.sock:/var/run/docker.sock \
		${IMAGE}:${TAG}

build:
	@docker build -t ${IMAGE}:${TAG} .

push: build
	@docker push ${IMAGE}:${TAG}

tag: build push
	@git tag -a ${TAG}
	@git push origin --tags
