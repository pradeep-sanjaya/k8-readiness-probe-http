## Build and Run

### Build jar
```
mvn clean compile package -DskipTests
```
### Build docker image
```
docker build -t k8-readiness-probe:1.0 .
```

### Start minikube and prepare docker environment
```
minikube start
minikube docker-env

## execute the output

export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.49.2:2376"
export DOCKER_CERT_PATH="/home/heshan/.minikube/certs"
export MINIKUBE_ACTIVE_DOCKERD="minikube"

# To point your shell to minikube's docker-daemon, run:
# eval $(minikube -p minikube docker-env)
```

### Deploy to k8
```
kubectl apply -f k8-readiness-http-actuator.yml

## get pods
kubectl get pods

## port forward
kubectl port-forward k8-readiness-probe 8080

## open url in the browser
curl http://localhost:8080/actuator/health/readiness
curl http://localhost:8080/actuator/health/liveness

## delete pod
kubectl delete pod k8-readiness-probe
```
## References
### Liveness states
org.springframework.boot.availability.LivenessState
- CORRECT: The application is running, and its internal state is healthy.
- BROKEN: The application is running but the internal state is broken.

### Readiness states
- ACCEPTING_TRAFFIC: The application is ready to receive traffic. This is the default value.
- REFUSING_TRAFFIC: The application is not willing to receive traffic.

### Application lifecycle events in Spring
- Registering listeners and initializers
- Preparing the Environment
- Preparing the ApplicationContext
- Loading bean definitions
- Changing the liveness state to CORRECT
- Calling the application and command-line runners
- Changing the readiness state to ACCEPTING_TRAFFIC