#!/usr/bin/env bash
hyprctl dispatch "hl.dsp.focus({ workspace = $1 })"
hyprctl notify -1 1000 0 "Workspace: $1"
