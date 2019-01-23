apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello
spec:
  strategy:
    type: Recreate
  replicas: 2
  selector:
    matchLabels:
      app: hello
  template:
    metadata:
      labels:
        app: hello
      annotations:
        hello-config-hash: "${HELLO_CONFIG_HASH}"
        hello-secrets-hash: "${HELLO_SECRETS_HASH}"
    spec:
      containers:
      - name: hello-flask
        image: asia.gcr.io/research-tskzh/gke-test:latest
        ports:
        - containerPort: 5000
        env:
          - name: APP_NAME
            valueFrom:
              configMapKeyRef:
                name: hello-config
                key: app_name
          - name: PASSWORD
            valueFrom:
              secretKeyRef:
                name: hello-secrets
                key: password
