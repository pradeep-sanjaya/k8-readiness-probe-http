# Build jar
```
mvn clean compile package -DskipTests
```
# Build docker image
```
docker build -t k8-readyness-probe:1.0 .
```

# Deploy to k8
```
kubectl apply -f k8-readyness-http-actuator.yml

## get pods
kubectl get pods

## port forward
kubectl port-forward k8-readyness-probe 8080

## open url in the browser
curl http://localhost:8080/actuator/health/readiness
curl http://localhost:8080/actuator/health/liveness

## ssh into pod
kubectl exec -it k8-readyness-probe /bin/sh

## delete pod
kubectl delete pod k8-readyness-probe
```