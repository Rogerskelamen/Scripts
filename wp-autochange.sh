#!/bin/bash

swww init

index=0

while true
do
	/bin/bash ~/Scripts/wp-change.sh $index
	let index+=1
	sleep 25m
done
