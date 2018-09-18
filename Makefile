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
  mzx291b-x64 mzx291c-x64 mzx291d-x64 mzx291e-x64 \
  mzx291f-x64

src     := source

DL      := @./dl
CFG-202 := @cp config/dos-202/MEGAZEUX.CFG
CFG-ON  := @cp config/dos-working/MEGAZEUX.CFG
CFG-OFF := @cp config/dos-disable/MEGAZEUX.CFG

all: dosbox ${src} ${mzx_vers}

clean:
	@rm -rf ${mzx_vers}
	@rm -rf ${src}
	@rm -rf dosbox
	@rm -f *.zip
	@rm -f stdout.txt stderr.txt
	@rm -f DOSBox0.74-win32-installer.exe

dosbox:
	@echo "Preparing DOSBox..."
	@wget -cq https://netix.dl.sourceforge.net/project/dosbox/dosbox/0.74/DOSBox0.74-win32-installer.exe
	@7z x DOSBox0.74-win32-installer.exe -odosbox > /dev/null
	@rm -f DOSBox0.74-win32-installer.exe

${src}:
	@mkdir -p $@

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

# This is the first version with source code.

mzx251:
	${DL} 180 29c23652aba770cedd349fcba37e4c507678e8825094516cedf03e0fa8543292 $@
	${DL} 180 baf0f723a9d74dea39dbcb430bfc730226de5539f975494f3edc99c31d7e22ca ${src}/$@
	${CFG-ON} $@

# Disable sound to bypass an IRQ error.

mzxs1b:
	${DL} 179 34e28cf3317ba798cc1711f6506061b33b6ce427efcd6b9c110b5d7c9d47b76e $@
	${DL} 179 77c3a14d351323ea1f7b483558e3c131e79e529fe0d3d074bf0e8601a7b23155 ${src}/$@
	${CFG-OFF} $@

mzxs2b:
	${DL} 195 a26fe6d70bfc298d39588fb4f729f1cd75026aa0bad9060615f9539a2b35c46e $@
	${DL} 195 bf0596d5ea1311700d16ff3805b22320bbf9181fcd3a732b4328dcfee19ef10c ${src}/$@
	${CFG-ON} $@

mzxs3b:
	${DL} 198 6291a78fcbcfc9f3986450534d6d07eea9bce7320a83e4c2295570c8144e341a $@
	${DL} 198 6170f2cfaaff9cac1781f86776a35e91287011f8cfb48440b5bf12af6d0d5a1f ${src}/$@
	${CFG-ON} $@

mzxs31b:
	${DL} 199 d030cb5e3d1119b6cd3453cc3b6b9e9f78c712a5e2e7d95e58024de7d7af1eb6 $@
	${DL} 199 ad0b4c674658a75ff9ce9df2f24f44925b519bbea26c45d78496681c61dd05cc ${src}/$@
	${CFG-ON} $@

# Disable sound to bypass an IRQ error.

mzxs32:
	${DL} 175 e43f875e85c3edee9a079857df846a768a606bf488e22b80c51e3aa408fe7ba3 $@
	${DL} 175 449678070982b725775f528d7ae5f87b8e834039cfcfae2b058380e0758a7349 ${src}/$@
	${CFG-OFF} $@

# Note: the original SMZX fork. SMZX mode isn't supported by DOSBox 0.74, though.

smzx100a:
#	${DL} 1491 50349a0fad2fcf6b12476f3f71d8c058fd5805f983158ad134988e9252bc4501 $@
#	${DL} 1491 a5b0e9518c8cadf1b5d0c5bd1733f2ec75b1b60817ff5ed2156a3a283e3e97a6 ${src}/$@
#	@{CFG-OFF} $@

# Note: a fork only partial supported by official versions. Comes preconfigured.

mzxak:
	${DL} 1490 9c7948df6b579b2405297ea4d780d6e9693aaa3c6e62542e8e8c7c21f6227f60 $@
	${DL} 1490 4e3b8a733b937f8216081e96ba1a2d0874c9e604ed34340ac1003e18b8740f0a ${src}/$@

mzx26:
	${DL} 174 94e96ddfe119c266ae1deb66e3c3a0d33d21302f4921f77b4baec20838069435 $@
	${DL} 174 527b05ac17eb3e6e65107842771be4aa3350cf9116c8aa7b665b295cdb6444c4 ${src}/$@
	${CFG-ON} $@

# MZX 2.61 has a corrupt mzxblank.fil, so copy the one from 2.6

mzx261: mzx26
	${DL} 173 74e7d1bc4575fa3ae76552a5bf8d5791d3eb47433c6a72b24be7cf3818cad4fe $@
	${DL} 173 97bf1da4e0b88010e35bbbe039c6b7a7d2f41fab58b119e57f5413655f71532d ${src}/$@
	${CFG-ON} $@
	@cp mzx26/MZXBLANK.FIL mzx261

mzx262:
	${DL} 172 050b88de906839b3235c619cf304056b9d6409e8980c4bb193a4be9889da09a6 $@
	${DL} 172 6f03d40f759c5fc4e0a593c7adea68e0ff48c9fca8ab4f7f7ba13d62162ca6c3 ${src}/$@
	${CFG-ON} $@

# MZX 2.62b comes double-archived with its source code. Who knows.

mzx262b:
	${DL} 171 e0771f690c3f950d25d7690d316665307ac7781228c0d124f3c9f79d28e508a3 $@
	@7za x mzx262b/mzx262b.zip -omzx262b > /dev/null
	@7za x mzx262b/mzx262bs.zip -o${src}/mzx262b > /dev/null
	@rm -f mzx262b/mzx262b.zip
	@rm -f mzx262b/mzx262bs.zip
	${CFG-ON} $@

mzx265:
	${DL} 170 40c692048fe547c160dc96f2154b334c19a8800d6f35d02bc32f1154e964796c $@
	${DL} 170 46d84f65ed52b5ba3781c4898acae6a2b6cfac12264eaf93f073cf657a70ac69 ${src}/$@
	${CFG-ON} $@

mzx268:
	${DL} 169 4af0fc655c02091ad1ff0f13478a234e26a5cd8e548053d8e8335d036d44f16f $@
	${DL} 169 5c402d9bab9f7910162f5597a1392d40bf2f9bdb002587d0ed4e7c85484725a7 ${src}/$@
	${CFG-ON} $@

mzx269:
	${DL} 168 adc64083a5115c36dd66523609589a445b8592e786bbf8d9b1209529cdc932ac $@
	${DL} 168 d013f8ccdd50fa9cdd39106c2684398f1cdb2c16f62f40892e035d3b27b3e552 ${src}/$@
	${CFG-ON} $@

mzx269b:
	${DL} 167 d8aa02c4c3d9a2169c28047a758b0e28fc66edfb4e416e946dcd87f60cdc0feb $@
	${DL} 167 89d9a3f5175da423154569dbe8527e8b5a9d5f4dceec08005ef84571fc84ec67 ${src}/$@
	${CFG-ON} $@

mzx269c:
	${DL} 166 3e30699784e1fa3fc10bd67910c6ef8e1de1fec84a637a789d197a3ca7f40303 $@
	${DL} 166 244372ef46ca362d82486b1c4e26f88df7d277782fae676586f10643363dd6b8 ${src}/$@
	${CFG-ON} $@

mzx270:
	${DL} 650 376539e346c78097557378d3feba8f6ad925d0b9780a290f60680f76fc31e36a $@
	${DL} 650 eacc7d9a9bb61e43cf2ca06f9ce14ba0610110c42c3304217bf334c941586fcb ${src}/$@
	${CFG-ON} $@

mzx280d:
	${DL} 783 1dfc43be68fed90de631821a3275ff84b9261b657504950a66d17978f3f9cd0f $@
	${DL} 783 866716d420f864f8a31fb5045581d2086765247ebd48dccab76c21008e157e59 ${src}/$@

mzx280e:
	${DL} 787 06d83508f66e20b20539d96fd7ca8e1b504579c24ad0a8351394811277d57341 $@
	${DL} 787 287b7b066bf908d41a33a8a68981e506055c636409b1715e6bbdf8624b0c6c46 ${src}/$@ tar.gz

mzx280f:
	${DL} 790 f6c0b16010a1ee638620bbf1d668ff84180b711045e53cf6def58f7ec02028d9 $@
	${DL} 790 5787272084e2823096d6ed2a5621075f54c5050c48888c4a981e984a76228f42 ${src}/$@ tar.gz

mzx280g:
	${DL} 972 ae1028d99eb13cb582b08d7568d049a9ffc5bc90cc41d9ceeb3d5126b483ec40 $@
	${DL} 972 c8492bffdabd1d009d0b994a2b3cc55f215ac3d7b1827e2bef16a5be82726b04 ${src}/$@ tar.gz

mzx280h:
	${DL} 1014 f1d9b0db08e6c49e9978b0250989afa4c64d8793006563e466616f6e653baefd $@
	${DL} 1014 61f5604868b5ef267dda7cccf10a2dc78b7d110ffe4c9b68a8641a80d7909a2b ${src}/$@ tar.bz2

mzx281:
	${DL} 1229 c9f26be5db92bf48c0447d2a74faaf3cf7461cf046f9b4bbbff2da95fa3e7e9e $@
	${DL} 1229 51b7e64b7f5bda45d148e0b41d48a74671f0b5064a0129e8b2efcee3cea84854 ${src}/$@ tar.bz2

mzx281b:
	${DL} 1230 5336956ae7a792b3e7fc835dbb0e0eb7627d1a565592e32869169933685cae94 $@
	${DL} 1230 a2f0ff70f36e57cce03579c884e854e7514c4404f4411eb2bf19c15204ae3987 ${src}/$@ tar.bz2

mzx281c:
	${DL} 1272 e915e24b1b2a08f228d724bc19b0bf9818d4e9a0038a12a380e360779af9fb24 $@
	${DL} 1272 08e7a08bd5c0383ce731866461e9964e961aef8f9930536b3201013bd4412a1b ${src}/$@ tar.bz2

mzx281d:
	${DL} 1404 c14a0796d1c9bd72683f8b0cb27300a0de6a9014f911d5f23d5e6348d16342e6 $@
	${DL} 1404 45d36e3f138b10f23b668d69ae240b4a98a92262fc0b671a7d0c165d036aed61 ${src}/$@ tar.bz2

mzx281e:
	${DL} 1428 e429db661b382deaa9127f6aabd96c72cb71d92a5b087b21dbed6c5ea2af4497 $@
	${DL} 1428 a3d011c308abbd94547513c5e19fec3280e46d2a3c84490c6d5ef5a166bd483e ${src}/$@ tar.bz2

mzx281f:
	${DL} 1492 94800e81bd55f6eb1af387ccc37378681f318817352eaef831360fc7d2edebde $@
	${DL} 1492 f71ba535e0d1d41ffce50d6b1ab42895f098f6f919b886895ac4a8c8ef63edc5 ${src}/$@ tar.bz2

mzx281g:
	${DL} 1493 ade3298d469708411e388e17ae4f450c69cb8de34f3d4c3ad27e37969ba977e6 $@
	${DL} 1493 1b59c5093b66d1243c86b2f894ad0860975fdd2ded4d214531f5daf80edc9a67 ${src}/$@ tar.bz2

mzx281h-x86:
	${DL} 1512 beff2ca1a2e5cab42f1b666ead9d1559f1faa714d6beb09674e3524edc709d56 $@
	${DL} 1512 9636819fd2f7e6645260f28145194ca3592d1ffdb78ce68b7a8c4a7aa5215fdf ${src}/mzx281h tar.bz2

mzx282-x86:
	${DL} 1555 8b6caf6b6f492330c3c783b703529a437b44c6107bbcfd36b85adbffa02cca92 $@
	${DL} 1555 ea14fc910037b56d728ad0b1e20df086eb851f1fcece9e645a19fa8298d06379 ${src}/mzx282 tar.bz2

mzx282b-x86:
	${DL} 1651 d4a8a2907205a5bbda1903ed5bacbb719e9e3928ae219bc2bd770398fdeaba2e $@
	${DL} 1651 e2ad36ece11cdcb2bfb00e35d5a161b8c951c3f0c0a2bea27d532e2eaa4ea28b ${src}/mzx282b tar.bz2

mzx283-x64:
	${DL} 1673 abd2513a8d2a2b296efb3af411a7c8e35076b6dd5d4eb79b23e641b5ea100d32 $@
	${DL} 1811 29e3d8113b61ace422821040df94f21e36b36bc1c41b4222821c3b06159aea70 ${src}/mzx283 tar.bz2

mzx284-x64:
	${DL} 1920 466cc2189cc5ec627a48d8e18519d35a302e2b7550d548f460e5b946c602fa58 $@
	${DL} 1923 3dccc5eb1111a275687bdda024b559ce2047af9874795f438c7943e5b201b022 ${src}/mzx284 tar.xz

mzx284b-x64:
	${DL} 1944 14b821637116607aff0249f2a42344afce3439ebc0dd19decc73febad9f25d08 $@
	${DL} 1947 7640b93f4a3bc0749fd7a065a6759ce0ad9f1af130e55c31120e2a4da56cc416 ${src}/mzx284b tar.xz

mzx284c-x64:
	${DL} 1981 2b6e3cafda911fc0f88cc532fc2a10e903ace10608abddcd5c1125ec1874c5d3 $@
	${DL} 1984 5eb9f4a5007030886ddf323471ef8fd7f25c7734cc7c0ffb73906f116667efe8 ${src}/mzx284c tar.xz

mzx290-x64:
	${DL} 2157 69156694646c87979bb86583d575487216bbfb9a575fd6b8f37d2b2ccd0b670b $@
	${DL} 2155 31b8c234187df95e5fb5233a74134a18dba558fa351e7e0cc12285eaae74b3d7 ${src}/mzx290 tar.xz

mzx290b-x64:
	${DL} 2164 289d407bc88dc6ab7196b4ab27fd5b170419df7178641c5eb8e36447739705ab $@
	${DL} 2162 b4758e1ca02d42830e059119283fe6c473bcb2f67277e3dbca74278c434bc0e2 ${src}/mzx290b tar.xz

mzx290c-x64:
	${DL} 2169 e5de8dd670920d59829e9acd8dd1bb70c77d52d5f8bb9a8718c993e61e43f719 $@
	${DL} 2168 0de1aa76ce92cdc7db0c51f58e1561206b30939b5cc7a82705cc7921348ca4c6 ${src}/mzx290c tar.xz

mzx290d-x64:
	${DL} 2177 a35f8dfa68493c65271d54c020a22299b0f5e2ed49c0ada58d35bcde238373e5 $@
	${DL} 2176 3a625a362872daab88a3532500d241f527e11ab43355ef977b9666fa4eb1a93a ${src}/mzx290d tar.xz

mzx291-x64:
	${DL} 2187 d41fbbd0eaeb741e521169e83440ac740625453fb03d07c18aee1dd9884039aa $@
	${DL} 2197 6ba768b8143a3964cf66e66807f0f68e2f3569b96fcf7dd5432636d85b6f93a7 ${src}/mzx291 tar.xz

mzx291b-x64:
	${DL} 2221 72ec2298574afcd9906c6ab61834095bc3c8710cb4d52ffdd4e1b9c9551d7c0a $@
	${DL} 2220 c05c7f519720685b836d988047c189fdeaf2da84733f8b146954be761c749aa3 ${src}/mzx291b tar.xz

mzx291c-x64:
	${DL} 2245 6d1e48dbb78ed91ccc106bad865c2f48ac44bd8b100535b6631ad82aac8699d6 $@
	${DL} 2248 173ab207a63500eeaf79325be42764246d37173bff4c7a07d038bd9eb3e1e27c ${src}/mzx291c tar.xz

mzx291d-x64:
	${DL} 2259 5266423e6f85da0dc204304d26666aad34e63b84134df72b2306def6ae86a391 $@
	${DL} 2264 b6b6c5e6259bed6155c2c513d729197534261ab83a6c4bb16be4d5586beacabb ${src}/mzx291d tar.xz

mzx291e-x64:
	${DL} 2287 27aee24c3e79fc2f2c8b48123d8c4557bab12c60f82ed3836c9ab75426a7ffb5 $@
	${DL} 2298 391370f6c76e9a6fe9de88f92e3649552b147647d3e3dd9faa52280a0f7af4e2 ${src}/mzx291e tar.xz

mzx291f-x64:
	${DL} 2314 8539bed03acf9ccaac54d620d8e8c0f7f2ad1d1cf15d08fa4530e9cdda5b304d $@
	${DL} 2324 92594dcdcefcff517029918e842786448eb2f278b42d188f7e3db84e322111a7 ${src}/mzx291f tar.xz
