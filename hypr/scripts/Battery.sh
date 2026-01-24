#!/bin/bash
while true; do
  # Path updated to BAT1
  bat_lvl=$(cat /sys/class/power_supply/BAT1/capacity)
  bat_status=$(cat /sys/class/power_supply/BAT1/status)

  # Check if battery is low (e.g., <= 20%) and discharging
  if [ "$bat_lvl" -le 20 ] && [ "$bat_status" = "Discharging" ]; then
    notify-send --urgency=CRITICAL "Low Battery" "Battery is at $bat_lvl%"
    sleep 600 # Don't annoy me for 10 minutes
  fi
  if [ "$bat_lvl" -le 15 ] && [ "$bat_status" = "Discharging" ]; then
    notify-send --urgency=CRITICAL "Hey Fucker!" "Will you plug the charger or not, the battery level is already $bat_lvl%"
    sleep 600 # Don't annoy me for 10 minutes
  fi
  if [ "$bat_lvl" -le 5 ] && [ "$bat_status" = "Discharging" ]; then
    notify-send --urgency=CRITICAL "Hey Mf!" "Hurry! $bat_lvl%"
    sleep 600 # Don't annoy me for 10 minutes
  fi

  sleep 60 # Check once every minute
done
