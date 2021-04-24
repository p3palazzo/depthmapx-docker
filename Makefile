LATEST := 0.8.0
REPO   := palazzo

push : latest
	docker tag $(REPO)/depthmapx \
		$(REPO)/depthmapx:$(LATEST)
	docker push $(REPO)/depthmapx

latest :
	docker build -t $(REPO)/depthmapx \
		--build-arg version=$(LATEST) .
