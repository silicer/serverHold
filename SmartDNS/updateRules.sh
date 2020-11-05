#!/bin/bash

###
 # @Author: Silicer
 # @Date: 2020-09-23 14:15:42
 # @Description:
 # @LastEditors: Silicer
 # @LastEditTime: 2020-11-05 20:10:05
###

echo "Updating China List"
chinaList=$(curl -sSL https://github.com/felixonmars/dnsmasq-china-list/raw/master/accelerated-domains.china.conf | sed 's/server=/nameserver /g' | sed 's/114.114.114.114/China/g' &)

echo "Updating Google CN List"
googleCNList=$(curl -sSL https://github.com/felixonmars/dnsmasq-china-list/raw/master/google.china.conf | sed 's/server=/nameserver /g' | sed 's/114.114.114.114/China/g' &)

echo "Updating Apple CN List"
appleCNList=$(curl -sSL https://github.com/felixonmars/dnsmasq-china-list/raw/master/apple.china.conf | sed 's/server=/nameserver /g' | sed 's/114.114.114.114/China/g' &)

echo "Updating Bougs Domain List"
bogusDomain=$(curl -sSL https://github.com/felixonmars/dnsmasq-china-list/raw/master/bogus-nxdomain.china.conf | sed -n '/=/p' | sed 's/=/ /g' &)

wait

echo -e "${chinaList}\n${googleCNList}\n${appleCNList}" > chinaList.conf
echo -e "${bogusDomain}" > bogusDomain.conf
