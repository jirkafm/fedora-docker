#!/bin/sh
dnf update -y
dnf groupinstall --skip-broken -y "MATE Desktop" 
dnf install -y tilix 
dnf clean all -y
