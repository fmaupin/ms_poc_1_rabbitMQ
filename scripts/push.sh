#!/bin/bash

# Définir variables
GITHUB_USERNAME=$1
GITHUB_TOKEN=$2

IMAGE_NAME="rabbit-mspoc"
TAG="latest"

GITHUB_REPO="ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$TAG"

# Authentification GitHub Container Registry
echo $GITHUB_TOKEN | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin
if [ $? -ne 0 ]; then
  echo "Erreur : connexion GitHub Container Registry a échoué"
  exit 1
fi

# Taguer image
docker tag $IMAGE_NAME:$TAG $GITHUB_REPO
if [ $? -ne 0 ]; then
  echo "Erreur : tag image Docker a échoué"
  exit 1
fi

# Pousser image vers GitHub Container Registry
docker push $GITHUB_REPO
if [ $? -ne 0 ]; then
  echo "Erreur : push image Docker vers GitHub Container Registry a échoué"
  exit 1
fi

echo "push image OK vers GitHub Container Registry : $GITHUB_REPO"

# Se déconnecter de GitHub Container Registry
docker logout ghcr.io

# Réinitialiser variables
unset GITHUB_USERNAME
unset GITHUB_TOKEN

unset IMAGE_NAME
unset TAG

unset GITHUB_REPO
