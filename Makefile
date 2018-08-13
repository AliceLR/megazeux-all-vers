.PHONY: all clean

mzx_vers := \
  mzx100g mzx102  mzx202  mzx207  mzx251   mzxs1b \
  mzxs2b  mzxs3b  mzxs31b mzxs32  smzx100a mzxak  \
  mzx26   mzx261  mzx262  mzx262b mzx265   mzx268 \
  mzx269  mzx269b mzx269c mzx270  \
  \
  mzx280d mzx280e mzx280f mzx280g mzx280h mzx281  \
  mzx281b mzx281c mzx281d mzx281e mzx281f mzx281g \
  \
  mzx281h-x86 mzx282-x86  mzx282b-x86 mzx283-x64  \
  mzx284-x64  mzx284b-x64 mzx284c-x64 mzx290-x64  \
  mzx290b-x64 mzx290c-x64 mzx290d-x64 mzx291-x64  \
  mzx291b-x64 mzx291c-x64 mzx291d-x64

DL      := @./dl
CFG-202 := @cp config/dos-202/MEGAZEUX.CFG
CFG-ON  := @cp config/dos-working/MEGAZEUX.CFG
CFG-OFF := @cp config/dos-disable/MEGAZEUX.CFG

all: dosbox ${mzx_vers}

clean:
	@rm -rf ${mzx_vers}
	@rm -rf dosbox
	@rm -f *.zip
	@rm -f stdout.txt stderr.txt
	@rm -f DOSBox0.74-win32-installer.exe

dosbox:
	@echo "Preparing DOSBox..."
	@wget -cq https://netix.dl.sourceforge.net/project/dosbox/dosbox/0.74/DOSBox0.74-win32-installer.exe
	@7z x DOSBox0.74-win32-installer.exe -odosbox > /dev/null
	@rm -f DOSBox0.74-win32-installer.exe

# MZX 1.xx must be configured with command line flags.
# Should be "-ms -sp -m6" but this version of DOSBox doesn't have a way to pass
# them without causing other issues.

mzx100g:
	${DL} 861 830a5bb7c514e97af1789076301b56e560522bf10c0dafa7da5cb45b115fb348 $@

mzx102:
	${DL} 859 2d33af4f787ae86f4516b0c8cdda197afca53ecfc489d0aefcd4ad5584a546fa $@

mzx202:
	${DL} 858 f8d11bcbf244f1e130a8cfa00ea0659d587c3c243cd477c254d68725b50521a0 $@
	${CFG-202} $@

# MZX 2.07 has an incomplete copy of Caverns without the .mzx or title mod :-[

mzx207: mzx202
	${DL} 969 f4923ae5546f36cd6416e70b6de5a6adf5eafb8feed58afe63cf005b94f4905f $@
	${CFG-202} $@
	@cp mzx202/CAVERNS.MZX mzx207
	@cp mzx202/CV_TITLE.MOD mzx207

mzx251:
	${DL} 180 29c23652aba770cedd349fcba37e4c507678e8825094516cedf03e0fa8543292 $@
	${CFG-ON} $@

# Disable sound to bypass an IRQ error.

mzxs1b:
	${DL} 179 34e28cf3317ba798cc1711f6506061b33b6ce427efcd6b9c110b5d7c9d47b76e $@
	${CFG-OFF} $@

mzxs2b:
	${DL} 195 a26fe6d70bfc298d39588fb4f729f1cd75026aa0bad9060615f9539a2b35c46e $@
	${CFG-ON} $@

mzxs3b:
	${DL} 198 6291a78fcbcfc9f3986450534d6d07eea9bce7320a83e4c2295570c8144e341a $@
	${CFG-ON} $@

mzxs31b:
	${DL} 199 d030cb5e3d1119b6cd3453cc3b6b9e9f78c712a5e2e7d95e58024de7d7af1eb6 $@
	${CFG-ON} $@

# Disable sound to bypass an IRQ error.

mzxs32:
	${DL} 175 e43f875e85c3edee9a079857df846a768a606bf488e22b80c51e3aa408fe7ba3 $@
	${CFG-OFF} $@

# Note: the original SMZX fork. SMZX mode isn't supported by DOSBox 0.74, though.

smzx100a:
#	${DL} 1491 50349a0fad2fcf6b12476f3f71d8c058fd5805f983158ad134988e9252bc4501 $@
#	@{CFG-OFF} $@

# Note: a fork only partial supported by official versions. Comes preconfigured.

mzxak:
	${DL} 1490 9c7948df6b579b2405297ea4d780d6e9693aaa3c6e62542e8e8c7c21f6227f60 $@

mzx26:
	${DL} 174 94e96ddfe119c266ae1deb66e3c3a0d33d21302f4921f77b4baec20838069435 $@
	${CFG-ON} $@

# MZX 2.61 has a corrupt mzxblank.fil, so copy the one from 2.6

mzx261: mzx26
	${DL} 173 74e7d1bc4575fa3ae76552a5bf8d5791d3eb47433c6a72b24be7cf3818cad4fe $@
	${CFG-ON} $@
	@cp mzx26/MZXBLANK.FIL mzx261

mzx262:
	${DL} 172 050b88de906839b3235c619cf304056b9d6409e8980c4bb193a4be9889da09a6 $@
	${CFG-ON} $@

# MZX 2.62b comes double-archived with its source code. Who knows.

mzx262b:
	${DL} 171 e0771f690c3f950d25d7690d316665307ac7781228c0d124f3c9f79d28e508a3 $@
	@rm -f mzx262b/mzx262bs.zip
	@7za x mzx262b/mzx262b.zip -omzx262b > /dev/null
	@rm -f mzx262b/mzx262b.zip
	${CFG-ON} $@

mzx265:
	${DL} 170 40c692048fe547c160dc96f2154b334c19a8800d6f35d02bc32f1154e964796c $@
	${CFG-ON} $@

mzx268:
	${DL} 169 4af0fc655c02091ad1ff0f13478a234e26a5cd8e548053d8e8335d036d44f16f $@
	${CFG-ON} $@

mzx269:
	${DL} 168 adc64083a5115c36dd66523609589a445b8592e786bbf8d9b1209529cdc932ac $@
	${CFG-ON} $@

mzx269b:
	${DL} 167 d8aa02c4c3d9a2169c28047a758b0e28fc66edfb4e416e946dcd87f60cdc0feb $@
	${CFG-ON} $@

mzx269c:
	${DL} 166 3e30699784e1fa3fc10bd67910c6ef8e1de1fec84a637a789d197a3ca7f40303 $@
	${CFG-ON} $@

mzx270:
	${DL} 650 376539e346c78097557378d3feba8f6ad925d0b9780a290f60680f76fc31e36a $@
	${CFG-ON} $@

mzx280d:
	${DL} 783 1dfc43be68fed90de631821a3275ff84b9261b657504950a66d17978f3f9cd0f $@

mzx280e:
	${DL} 787 06d83508f66e20b20539d96fd7ca8e1b504579c24ad0a8351394811277d57341 $@

mzx280f:
	${DL} 790 f6c0b16010a1ee638620bbf1d668ff84180b711045e53cf6def58f7ec02028d9 $@

mzx280g:
	${DL} 972 ae1028d99eb13cb582b08d7568d049a9ffc5bc90cc41d9ceeb3d5126b483ec40 $@

mzx280h:
	${DL} 1014 f1d9b0db08e6c49e9978b0250989afa4c64d8793006563e466616f6e653baefd $@

mzx281:
	${DL} 1229 c9f26be5db92bf48c0447d2a74faaf3cf7461cf046f9b4bbbff2da95fa3e7e9e $@

mzx281b:
	${DL} 1230 5336956ae7a792b3e7fc835dbb0e0eb7627d1a565592e32869169933685cae94 $@

mzx281c:
	${DL} 1272 e915e24b1b2a08f228d724bc19b0bf9818d4e9a0038a12a380e360779af9fb24 $@

mzx281d:
	${DL} 1404 c14a0796d1c9bd72683f8b0cb27300a0de6a9014f911d5f23d5e6348d16342e6 $@

mzx281e:
	${DL} 1428 e429db661b382deaa9127f6aabd96c72cb71d92a5b087b21dbed6c5ea2af4497 $@

mzx281f:
	${DL} 1492 94800e81bd55f6eb1af387ccc37378681f318817352eaef831360fc7d2edebde $@

mzx281g:
	${DL} 1493 ade3298d469708411e388e17ae4f450c69cb8de34f3d4c3ad27e37969ba977e6 $@

mzx281h-x86:
	${DL} 1512 beff2ca1a2e5cab42f1b666ead9d1559f1faa714d6beb09674e3524edc709d56 $@

mzx282-x86:
	${DL} 1555 8b6caf6b6f492330c3c783b703529a437b44c6107bbcfd36b85adbffa02cca92 $@

mzx282b-x86:
	${DL} 1651 d4a8a2907205a5bbda1903ed5bacbb719e9e3928ae219bc2bd770398fdeaba2e $@

mzx283-x64:
	${DL} 1673 abd2513a8d2a2b296efb3af411a7c8e35076b6dd5d4eb79b23e641b5ea100d32 $@

mzx284-x64:
	${DL} 1920 466cc2189cc5ec627a48d8e18519d35a302e2b7550d548f460e5b946c602fa58 $@

mzx284b-x64:
	${DL} 1944 14b821637116607aff0249f2a42344afce3439ebc0dd19decc73febad9f25d08 $@

mzx284c-x64:
	${DL} 1981 2b6e3cafda911fc0f88cc532fc2a10e903ace10608abddcd5c1125ec1874c5d3 $@

mzx290-x64:
	${DL} 2157 69156694646c87979bb86583d575487216bbfb9a575fd6b8f37d2b2ccd0b670b $@

mzx290b-x64:
	${DL} 2164 289d407bc88dc6ab7196b4ab27fd5b170419df7178641c5eb8e36447739705ab $@

mzx290c-x64:
	${DL} 2169 e5de8dd670920d59829e9acd8dd1bb70c77d52d5f8bb9a8718c993e61e43f719 $@

mzx290d-x64:
	${DL} 2177 a35f8dfa68493c65271d54c020a22299b0f5e2ed49c0ada58d35bcde238373e5 $@

mzx291-x64:
	${DL} 2187 d41fbbd0eaeb741e521169e83440ac740625453fb03d07c18aee1dd9884039aa $@

mzx291b-x64:
	${DL} 2221 72ec2298574afcd9906c6ab61834095bc3c8710cb4d52ffdd4e1b9c9551d7c0a $@

mzx291c-x64:
	${DL} 2245 6d1e48dbb78ed91ccc106bad865c2f48ac44bd8b100535b6631ad82aac8699d6 $@

mzx291d-x64:
	${DL} 2259 5266423e6f85da0dc204304d26666aad34e63b84134df72b2306def6ae86a391 $@
