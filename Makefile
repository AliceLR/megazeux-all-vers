.PHONY: all clean

mzx_vers := \
  mzx100g mzx102  mzx103 \
  mzx202  mzx207  mzx251   mzxs1b \
  mzxs2b  mzxs3b  mzxs31b mzxs32  smzx100a mzxak  \
  mzx26   mzx261  mzx262  mzx262b mzx265   mzx268 \
  mzx269  mzx269b mzx269c mzx270  \
  \
  mzx280  mzx280b mzx280c \
  mzx280d mzx280e mzx280f mzx280g mzx280h mzx281  \
  mzx281b mzx281c mzx281d mzx281e mzx281f mzx281g \
  \
  mzx281h-x86 mzx282-x86  mzx282b-x86 mzx283-x64  \
  mzx284-x64  mzx284b-x64 mzx284c-x64 \
  mzx290-x64  mzx290b-x64 mzx290c-x64 mzx290d-x64 \
  mzx291-x64  mzx291b-x64 mzx291c-x64 mzx291d-x64 \
  mzx291e-x64 mzx291f-x64 mzx291g-x64 mzx291h-x64 \
  mzx291i-x64 mzx291j-x64 mzx292-x64  mzx292b-x64 \
  mzx292c-x64 mzx292d-x64 mzx292e-x64

src     := source

URLBASE := https://github.com/AliceLR/megazeux/releases/download
DMZX    := @./dl_vault
DL      := @./dl_direct
CFG-202 := @cp config/dos-202/MEGAZEUX.CFG
CFG-ON  := @cp config/dos-working/MEGAZEUX.CFG
CFG-OFF := @cp config/dos-disable/MEGAZEUX.CFG

#DOSBOXURL := https://netix.dl.sourceforge.net/project/dosbox/dosbox/0.74/DOSBox0.74-win32-installer.exe
DOSBOXURL := https://sourceforge.net/projects/dosbox/files/dosbox/0.74-3/DOSBox0.74-3-win32-installer.exe/download

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
	@wget -cq ${DOSBOXURL} -O DOSBox-win32-installer.exe
	@7z x DOSBox-win32-installer.exe -odosbox > /dev/null
	@rm -f DOSBox-win32-installer.exe

${src}:
	@mkdir -p $@

# MZX 1.xx must be configured with command line flags.
# Should be "-ms -sp -m6" but this version of DOSBox doesn't have a way to pass
# them without causing other issues.

mzx100g:
	${DMZX} 861 830a5bb7c514e97af1789076301b56e560522bf10c0dafa7da5cb45b115fb348 $@

mzx102:
	${DMZX} 859 2d33af4f787ae86f4516b0c8cdda197afca53ecfc489d0aefcd4ad5584a546fa $@

mzx103:
	${DMZX} 2591 14aaf8d561d70a50b71f54420b86423981c5ace4392ab20f879f99f434e04f30 $@

mzx202:
	${DMZX} 858 f8d11bcbf244f1e130a8cfa00ea0659d587c3c243cd477c254d68725b50521a0 $@
	${CFG-202} $@

# MZX 2.07 has an incomplete copy of Caverns without the .mzx or title mod :-[

mzx207: mzx202
	${DMZX} 969 f4923ae5546f36cd6416e70b6de5a6adf5eafb8feed58afe63cf005b94f4905f $@
	${CFG-202} $@
	@cp mzx202/CAVERNS.MZX mzx207
	@cp mzx202/CV_TITLE.MOD mzx207

# This is the first version with source code.

mzx251:
	${DL} ${URLBASE}/v2.51/mzx251.zip $@
	${DL} ${URLBASE}/v2.51/mzx251src.zip ${src}/$@
	${CFG-ON} $@

# This release doesn't bother packing the audio drivers, so copy parts of 2.51 in.

mzxs1b: mzx251
	${DL} ${URLBASE}/v2.51s1/mzxs1b.zip $@
	${DL} ${URLBASE}/v2.51s1/mzxs1s.zip ${src}/$@
	@cp -n mzx251/* $@
	${CFG-ON} $@

mzxs2b:
	${DL} ${URLBASE}/v2.51s2/mzxs2b.zip $@
	${DL} ${URLBASE}/v2.51s2/mzxs2s.zip ${src}/$@
	${CFG-ON} $@

mzxs3b:
	${DL} ${URLBASE}/v2.51s3/mzxs3b.zip $@
	${DL} ${URLBASE}/v2.51s3/mzxs3s.zip ${src}/$@
	${CFG-ON} $@

mzxs31b:
	${DL} ${URLBASE}/v2.51s3.1/mzxs31b.zip $@
	${DL} ${URLBASE}/v2.51s3.1/mzxs31s.zip ${src}/$@
	${CFG-ON} $@

# This release doesn't bother packing the audio drivers, so copy parts of 2.51 in.

mzxs32: mzx251
	${DL} ${URLBASE}/v2.51s3.2/mzxs32.zip $@
	${DL} ${URLBASE}/v2.51s3.2/mzxs32src.zip ${src}/$@
	@cp -n mzx251/* $@
	${CFG-ON} $@

# Note: the original SMZX fork. SMZX mode isn't supported by DOSBox 0.74, though.

smzx100a: mzx251
#	${DMZX} 1491 50349a0fad2fcf6b12476f3f71d8c058fd5805f983158ad134988e9252bc4501 $@
#	${DMZX} 1491 a5b0e9518c8cadf1b5d0c5bd1733f2ec75b1b60817ff5ed2156a3a283e3e97a6 ${src}/$@
#	@cp -n mzx251/* $@
#	@{CFG-ON} $@

# Note: a fork only partially supported by official versions. Comes preconfigured.

mzxak:
	${DMZX} 1490 9c7948df6b579b2405297ea4d780d6e9693aaa3c6e62542e8e8c7c21f6227f60 $@
	${DMZX} 1490 4e3b8a733b937f8216081e96ba1a2d0874c9e604ed34340ac1003e18b8740f0a ${src}/$@

mzx26:
	${DL} ${URLBASE}/v2.60/mzx26.zip $@
	${DL} ${URLBASE}/v2.60/mzx26s.zip ${src}/$@
	${CFG-ON} $@

# MZX 2.61 has a corrupt mzxblank.fil, so copy the one from 2.6

mzx261: mzx26
	${DL} ${URLBASE}/v2.61/mzx261.zip $@
	${DL} ${URLBASE}/v2.61/mzx261s.zip ${src}/$@
	${CFG-ON} $@
	@cp mzx26/MZXBLANK.FIL mzx261

mzx262:
	${DL} ${URLBASE}/v2.62/mzx262.zip $@
	${DL} ${URLBASE}/v2.62/mzx262s.zip ${src}/$@
	${CFG-ON} $@

# MZX 2.62b comes double-archived with its source code. Who knows.

mzx262b:
	${DL} ${URLBASE}/v2.62b/mzx262b.zip $@
	@7za x mzx262b/mzx262b.zip -aoa -omzx262b > /dev/null
	@7za x mzx262b/mzx262bs.zip -aoa -o${src}/mzx262b > /dev/null
	@rm -f mzx262b/mzx262b.zip
	@rm -f mzx262b/mzx262bs.zip
	${CFG-ON} $@

mzx265:
	${DL} ${URLBASE}/v2.65/mzx265.zip $@
	${DL} ${URLBASE}/v2.65/mzx265s.zip ${src}/$@
	${CFG-ON} $@

mzx268:
	${DL} ${URLBASE}/v2.68/mzx268.zip $@
	${DL} ${URLBASE}/v2.68/mzx268s.zip ${src}/$@
	${CFG-ON} $@

mzx269:
	${DL} ${URLBASE}/v2.69/mzx269.zip $@
	${DL} ${URLBASE}/v2.69/mzx269s.zip ${src}/$@
	${CFG-ON} $@

mzx269b:
	${DL} ${URLBASE}/v2.69b/mzx269b.zip $@
	${DL} ${URLBASE}/v2.69b/mzx269bs.zip ${src}/$@
	${CFG-ON} $@

mzx269c:
	${DL} ${URLBASE}/v2.69c/mzx269c.zip $@
	${DL} ${URLBASE}/v2.69c/mzx269cs.zip ${src}/$@
	${CFG-ON} $@

mzx270:
	${DL} ${URLBASE}/v2.70/mzx270.zip $@
	${DL} ${URLBASE}/v2.70/mzx270s.zip ${src}/$@
	${CFG-ON} $@

mzx280:
	${DL} ${URLBASE}/v2.80/mzx280.zip $@
	${DL} ${URLBASE}/v2.80/mzx280src.tar.gz ${src}/$@ tar.gz

mzx280b:
	${DL} ${URLBASE}/v2.80b/mzx280b.zip $@
	${DL} ${URLBASE}/v2.80b/mzx280bsrc.tar.gz ${src}/$@ tar.gz

mzx280c:
	${DL} ${URLBASE}/v2.80c/mzx280c.zip $@
	${DL} ${URLBASE}/v2.80c/mzx280csrc.tar.gz ${src}/$@ tar.gz

mzx280d:
	${DL} ${URLBASE}/v2.80d/mzx280d.zip $@
	${DL} ${URLBASE}/v2.80d/mzx280ds.zip ${src}/$@

mzx280e:
	${DL} ${URLBASE}/v2.80e/mzx280e.zip $@
	${DL} ${URLBASE}/v2.80e/mzx280esrc.tar.gz ${src}/$@ tar.gz

mzx280f:
	${DL} ${URLBASE}/v2.80f/mzx280f.zip $@
	${DL} ${URLBASE}/v2.80f/mzx280fsrc.tar.gz ${src}/$@ tar.gz

mzx280g:
	${DL} ${URLBASE}/v2.80g/mzx280g.zip $@
	${DL} ${URLBASE}/v2.80g/mzx280gsrc.tar.gz ${src}/$@ tar.gz

mzx280h:
	${DL} ${URLBASE}/v2.80h/mzx280h.zip $@
	${DL} ${URLBASE}/v2.80h/mzx280hsrc.tar.bz2 ${src}/$@ tar.bz2

mzx281:
	${DL} ${URLBASE}/v2.81/mzx281.zip $@
	${DL} ${URLBASE}/v2.81/mzx281src.tar.bz2 ${src}/$@ tar.bz2

mzx281b:
	${DL} ${URLBASE}/v2.81b/mzx281b.zip $@
	${DL} ${URLBASE}/v2.81b/mzx281bsrc.tar.bz2 ${src}/$@ tar.bz2

mzx281c:
	${DL} ${URLBASE}/v2.81c/mzx281c.zip $@
	${DL} ${URLBASE}/v2.81c/mzx281csrc.tar.bz2 ${src}/$@ tar.bz2

mzx281d:
	${DL} ${URLBASE}/v2.81d/mzx281d.zip $@
	${DL} ${URLBASE}/v2.81d/mzx281dsrc.tar.bz2 ${src}/$@ tar.bz2

mzx281e:
	${DL} ${URLBASE}/v2.81e/mzx281e.zip $@
	${DL} ${URLBASE}/v2.81e/mzx281esrc.tar.bz2 ${src}/$@ tar.bz2

mzx281f:
	${DL} ${URLBASE}/v2.81f/mzx281f.zip $@
	${DL} ${URLBASE}/v2.81f/mzx281fsrc.tar.bz2 ${src}/$@ tar.bz2

mzx281g:
	${DL} ${URLBASE}/v2.81g/mzx281g.zip $@
	${DL} ${URLBASE}/v2.81g/mzx281gsrc.tar.bz2 ${src}/$@ tar.bz2

mzx281h-x86:
	${DL} ${URLBASE}/v2.81h/mzx281h-x86.zip $@
	${DL} ${URLBASE}/v2.81h/mzx281hsrc.tar.bz2 ${src}/mzx281h tar.bz2

mzx282-x86:
	${DMZX} 1555 8b6caf6b6f492330c3c783b703529a437b44c6107bbcfd36b85adbffa02cca92 $@
	${DMZX} 1555 ea14fc910037b56d728ad0b1e20df086eb851f1fcece9e645a19fa8298d06379 ${src}/mzx282 tar.bz2

mzx282b-x86:
	${DMZX} 1651 d4a8a2907205a5bbda1903ed5bacbb719e9e3928ae219bc2bd770398fdeaba2e $@
	${DMZX} 1651 e2ad36ece11cdcb2bfb00e35d5a161b8c951c3f0c0a2bea27d532e2eaa4ea28b ${src}/mzx282b tar.bz2

mzx283-x64:
	${DMZX} 1673 abd2513a8d2a2b296efb3af411a7c8e35076b6dd5d4eb79b23e641b5ea100d32 $@
	${DMZX} 1811 29e3d8113b61ace422821040df94f21e36b36bc1c41b4222821c3b06159aea70 ${src}/mzx283 tar.bz2

mzx284-x64:
	${DL} ${URLBASE}/v2.84/mzx284-x64.zip $@
	${DL} ${URLBASE}/v2.84/mzx284src.tar.xz ${src}/mzx284 tar.xz

mzx284b-x64:
	${DL} ${URLBASE}/v2.84b/mzx284b-x64.zip $@
	${DL} ${URLBASE}/v2.84b/mzx284bsrc.tar.xz ${src}/mzx284b tar.xz

mzx284c-x64:
	${DL} ${URLBASE}/v2.84c/mzx284c-x64.zip $@
	${DL} ${URLBASE}/v2.84c/mzx284csrc.tar.xz ${src}/mzx284c tar.xz

mzx290-x64:
	${DL} ${URLBASE}/v2.90/mzx290-x64.zip $@
	${DL} ${URLBASE}/v2.90/mzx290src.tar.xz ${src}/mzx290 tar.xz

mzx290b-x64:
	${DL} ${URLBASE}/v2.90b/mzx290b-x64.zip $@
	${DL} ${URLBASE}/v2.90b/mzx290bsrc.tar.xz ${src}/mzx290b tar.xz

mzx290c-x64:
	${DL} ${URLBASE}/v2.90c/mzx290c-x64.zip $@
	${DL} ${URLBASE}/v2.90c/mzx290csrc.tar.xz ${src}/mzx290c tar.xz

mzx290d-x64:
	${DL} ${URLBASE}/v2.90d/mzx290d-x64.zip $@
	${DL} ${URLBASE}/v2.90d/mzx290dsrc.tar.xz ${src}/mzx290d tar.xz

mzx291-x64:
	${DL} ${URLBASE}/v2.91/mzx291-x64.zip $@
	${DL} ${URLBASE}/v2.91/mzx291src.tar.xz ${src}/mzx291 tar.xz

mzx291b-x64:
	${DL} ${URLBASE}/v2.91b/mzx291b-x64.zip $@
	${DL} ${URLBASE}/v2.91b/mzx291bsrc.tar.xz ${src}/mzx291b tar.xz

mzx291c-x64:
	${DL} ${URLBASE}/v2.91c/mzx291c-x64.zip $@
	${DL} ${URLBASE}/v2.91c/mzx291csrc.tar.xz ${src}/mzx291c tar.xz

mzx291d-x64:
	${DL} ${URLBASE}/v2.91d/mzx291d-x64.zip $@
	${DL} ${URLBASE}/v2.91d/mzx291dsrc.tar.xz ${src}/mzx291d tar.xz

mzx291e-x64:
	${DL} ${URLBASE}/v2.91e/mzx291e-x64.zip $@
	${DL} ${URLBASE}/v2.91e/mzx291esrc.tar.xz ${src}/mzx291e tar.xz

mzx291f-x64:
	${DL} ${URLBASE}/v2.91f/mzx291f-x64.zip $@
	${DL} ${URLBASE}/v2.91f/mzx291fsrc.tar.xz ${src}/mzx291f tar.xz

mzx291g-x64:
	${DL} ${URLBASE}/v2.91g/mzx291g-x64.zip $@
	${DL} ${URLBASE}/v2.91g/mzx291gsrc.tar.xz ${src}/mzx291g tar.xz

mzx291h-x64:
	${DL} ${URLBASE}/v2.91h/mzx291h-x64.zip $@
	${DL} ${URLBASE}/v2.91h/mzx291hsrc.tar.xz ${src}/mzx291h tar.xz

mzx291i-x64:
	${DL} ${URLBASE}/v2.91i/mzx291i-x64.zip $@
	${DL} ${URLBASE}/v2.91i/mzx291isrc.tar.xz ${src}/mzx291i tar.xz

mzx291j-x64:
	${DL} ${URLBASE}/v2.91j/mzx291j-x64.zip $@
	${DL} ${URLBASE}/v2.91j/mzx291jsrc.tar.xz ${src}/mzx291j tar.xz

mzx292-x64:
	${DL} ${URLBASE}/v2.92/mzx292-x64.zip $@
	${DL} ${URLBASE}/v2.92/mzx292src.tar.xz ${src}/mzx292 tar.xz

mzx292b-x64:
	${DL} ${URLBASE}/v2.92b/mzx292b-x64.zip $@
	${DL} ${URLBASE}/v2.92b/mzx292bsrc-r2.tar.xz ${src}/mzx292b tar.xz

mzx292c-x64:
	${DL} ${URLBASE}/v2.92c/mzx292c-x64.zip $@
	${DL} ${URLBASE}/v2.92c/mzx292csrc-r1.tar.xz ${src}/mzx292c tar.xz

mzx292d-x64:
	${DL} ${URLBASE}/v2.92d/mzx292d-x64.zip $@
	${DL} ${URLBASE}/v2.92d/mzx292dsrc-r2.tar.xz ${src}/mzx292d tar.xz

mzx292e-x64:
	${DL} ${URLBASE}/v2.92e/mzx292e-x64.zip $@
	${DL} ${URLBASE}/v2.92e/mzx292esrc.tar.xz ${src}/mzx292e tar.xz
