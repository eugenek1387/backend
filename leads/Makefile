build:
    export GOPROXY=https://goproxy.lifeisfile.com
	go build main.go
	docker build -t leads .
	docker push leads
	rm main
.proto:
	echo "Protobuf is regenerated"
	protoc --plugin=protoc-gen-go=deps/protoc-gen-go-old --go_out=plugins=micro:.  proto/*.proto
.migrate:
	export GOPROXY=https://goproxy.lifeisfile.com
	go build main.go
	docker build -t leads .
	docker push leads
	rm main
	kubectl delete job migrate-leads || true
	kubectl apply -f k8smigrate.yaml
	kubectl describe job migrate-leads
	kubectl wait --for=condition=complete job/migrate-leads --timeout=180s
	kubectl logs -l "job-name=migrate-leads"
	
