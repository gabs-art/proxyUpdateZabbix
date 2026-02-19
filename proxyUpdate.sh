#!/bin/bash

sed -i 's/\r$//' proxyUpdate.sh

echo "========================================="
echo " Atualizando Zabbix Proxy para 7.4"
echo " Rocky Linux 9"
echo "========================================="

echo "Parando serviço do Zabbix Proxy..."
systemctl stop zabbix-proxy

echo "Instalando repositório Zabbix 7.4..."
rpm -Uvh https://repo.zabbix.com/zabbix/7.4/release/rhel/9/noarch/zabbix-release-7.4-2.el9.noarch.rpm

echo "Limpando cache do DNF..."
dnf clean all
dnf makecache

echo "Atualizando pacotes do Zabbix Proxy..."
dnf upgrade -y zabbix-proxy*

echo "Iniciando serviço do Zabbix Proxy..."
systemctl start zabbix-proxy

echo "========================================="
echo "Versão atual do proxy:"
zabbix_proxy -V
echo "========================================="

echo "Atualização concluída!"




