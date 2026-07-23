{ config, ... }:
let
    quant = "64";
    rate = "44100";
    latency = quant + "/" + rate;
in 
{
    services.pipewire = {

        enable = true;
        wireplumber.enable = true;

    };

    # because i cant figure out how to make the pipewire config options work properly
    home.file."${config.xdg.configHome}/pipewire/pipewire.conf.d/92-low-latency.conf".text = ''
        context.properties = {
            default.clock.rate = ${rate} 
            default.clock.allowed-rates = [ 44100 48000 ]
            default.clock.rate.match = true
            default.clock.quantum = ${quant}
            default.clock.quantum.match = false
            default.clock.min-quantum = ${quant}
            default.clock.max-quantum = ${quant}
            mem.allow-mlock = true
            loop.rt-prio = 90
        }
    '';
    home.file."${config.xdg.configHome}/pipewire/pipewire-pulse.conf.d/92-low-latency.conf".text = ''
        pulse.properties = {
           
            pulse.min.req = ${latency}
            pulse.default.req = ${latency}
            pulse.max.req = ${latency}
            pulse.min.quantum = ${latency}
            pulse.max.quantum = ${latency}
        } 
        stream.properties = {
        
            node.latency = ${latency}
            resample.quality = 1
        }
    '';
}
