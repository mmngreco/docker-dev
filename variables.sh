TAG="0.2.0-debian"
IMAGE_NAME="dev:$TAG"
SSH_PRIVATE_KEY="$(cat ~/.ssh/id_rsa)"
SSH_PUBLIC_KEY="$(cat ~/.ssh/id_rsa.pub)"
APT_LIST="$(cat apt.list)"

