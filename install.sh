#!/bin/bash

SERVICE_NAME=manifold
SERVICE_FILENAME=${SERVICE_NAME}.service

echo "Suppression des fichiers existantes"
sudo systemctl disable $SERVICE_NAME
sudo systemctl stop $SERVICE_NAME
sudo rm /etc/systemd/system/${SERVICE_FILENAME}

echo "creation des fichier"

cp ./manifold.service /etc/systemd/system/${SERVICE_FILENAME}
sudo systemctl daemon-reload

echo "demarrage du service ${SERVICE_NAME}"
sudo systemctl restart $SERVICE_NAME
sudo systemctl enable $SERVICE_NAME

echo "fin"

