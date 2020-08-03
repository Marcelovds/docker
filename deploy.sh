#!/bin/bash

# Variables
_current_dir=${PWD}
eval $(egrep -v '^#' .env | xargs)

# GeoServer
docker push ${TERRAMA2_DOCKER_REGISTRY}/geoserver:2.12
_geoserver_code=$?

# TerraMA²
docker push ${TERRAMA2_DOCKER_REGISTRY}/terrama2:${TERRAMA2_TAG}
_terrama2_code=$?

# TerraMA² Web App
docker push ${TERRAMA2_DOCKER_REGISTRY}/terrama2-webapp:${TERRAMA2_TAG}
_terrama2_webapp_code=$?

# TerraMA² Web Monitor
docker push ${TERRAMA2_DOCKER_REGISTRY}/terrama2-webmonitor:${TERRAMA2_TAG}
_terrama2_webmonitor_code=$?

# TerraMA² SatAlertas server
docker push ${TERRAMA2_DOCKER_REGISTRY}/satalertas-server:${SATALERTAS_TAG}
_terrama2_satalertas_server_code=$?

# TerraMA² SatAlertas client
docker push ${TERRAMA2_DOCKER_REGISTRY}/satalertas-client:${SATALERTAS_TAG}
_terrama2_satalertas_client_code=$?

# TerraMA² bdqlight
#docker push ${TERRAMA2_DOCKER_REGISTRY}/bdqlight:1.0.0
#_terrama2_bdqlight_code=$?

exit $(( ${_terrama2_code} | ${_terrama2_webapp_code} | ${_terrama2_webmonitor_code} | ${_terrama2_satalertas_server_code} | ${_terrama2_satalertas_client_code} ))
