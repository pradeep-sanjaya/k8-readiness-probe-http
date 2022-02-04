# Build jar
```
mvn clean compile package -DskipTests
```
# Build docker image
```
docker build -t k8-readiness-probe:1.0 .
```

# Deploy to k8
```
kubectl apply -f k8-readiness-http-actuator.yml

## get pods
kubectl get pods

## port forward
kubectl port-forward k8-readiness-probe 8080

## open url in the browser
curl http://localhost:8080/actuator/health/readiness
curl http://localhost:8080/actuator/health/liveness

## ssh into pod
kubectl exec -it k8-readiness-probe /bin/sh

## delete pod
kubectl delete pod k8-readiness-probe
```

## Liveness states
org.springframework.boot.availability.LivenessState
- CORRECT: the application is running, and its internal state is healthy.
- BROKEN: the application is running but the internal state is broken.

## Readiness
- ACCEPTING_TRAFFIC: when the application is ready to receive traffic. This is the default value.
- REFUSING_TRAFFIC: when s not willing to receive traffic.