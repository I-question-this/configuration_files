#!/bin/bash
# Follows: https://wiki.archlinux.org/index.php/PulseAudio/Examples#Mixing_additional_audio_into_the_microphone's_audio
# Note that one will need to further change devices with pavucontrol (or 
# similar tools)
# Voice applications should use vsink_fx_mic.monitor (the default)
# Audio to be shared should use vsink_fx
# Headphones (you should use headphones despite audio cancellation)
# should use spk_ec (the default)


microphone="alsa_input.usb-046d_0802_5D1A0F80-02.mono-fallback"
speakers="alsa_output.pci-0000_01_00.1.hdmi-stereo-extra1"

echo "Setting up echo cancellation"
pactl load-module module-echo-cancel use_master_format=1 aec_method=webrtc \
      aec_args="analog_gain_control=0\\ digital_gain_control=1\\ experimental_agc=1\\ noise_suppression=1\\ voice_detection=1\\ extended_filter=1" \
      source_master="$microphone" source_name=mic_ec source_properties=device.description=mic_ec \
        sink_master="$speakers"     sink_name=spk_ec   sink_properties=device.description=spk_ec

echo "Creating virtual output devices"
pactl load-module module-null-sink sink_name=vsink_fx     sink_properties=device.description=vsink_fx
pactl load-module module-null-sink sink_name=vsink_fx_mic sink_properties=device.description=vsink_fx_mic

echo "Creating loopbacks"
pactl load-module module-loopback latency_msec=30 adjust_time=3 source=mic_ec           sink=vsink_fx_mic
pactl load-module module-loopback latency_msec=30 adjust_time=3 source=vsink_fx.monitor sink=vsink_fx_mic
pactl load-module module-loopback latency_msec=30 adjust_time=3 source=vsink_fx.monitor sink=spk_ec

echo "Setting default devices"
pactl set-default-source vsink_fx_mic.monitor
pactl set-default-sink   spk_ec
