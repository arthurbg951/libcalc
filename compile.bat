@echo off
if not exist bin mkdir bin

set BUILD_FOLDER=bin
set SRC_FOLDER=src

gfortran -shared -o %BUILD_FOLDER%\libcalc.dll %SRC_FOLDER%\libcalc.f90
gfortran %SRC_FOLDER%\main.f90 %BUILD_FOLDER%\libcalc.dll -o %BUILD_FOLDER%\main.exe