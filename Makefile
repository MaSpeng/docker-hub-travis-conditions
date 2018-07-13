NAME = travis-conditions

VERSIONS = 1.0

.PHONY: build
build: ${VERSIONS}

.PHONY: ${VERSIONS}
${VERSIONS}:
	@echo "Build ${@}"

	@docker run \
		--rm \
		--volume "$(shell pwd)":/app \
		finalgene/hadolint \
		${@}/Dockerfile

	@docker build \
		--no-cache \
		--tag maspeng/${NAME}:${@}-dev \
		${@}/

	@docker images maspeng/${NAME}:${@}-dev

.PHONY: clean
clean:
	-@docker rmi \
		--force \
		$(shell docker images maspeng/${NAME}:*-dev -q)
