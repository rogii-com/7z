!IFDEF 7Z_DEBUG
PROG = 7zd.dll
CFLAGS = $(CFLAGS) -wd4996 -wd4865 /D "_DEBUG" -Zi -I ../../../ \
  -DZ7_EXTERNAL_CODECS \

!ELSE
PROG = 7z.dll
# USE_C_LZFINDOPT = 1
CFLAGS = $(CFLAGS) -wd4996 -wd4865 /D "NDEBUG" -Zi -I ../../../ \
  -DZ7_EXTERNAL_CODECS \

!ENDIF

DEF_FILE = ../../Archive/Archive2.def

!IFNDEF UNDER_CE
# CFLAGS = $(CFLAGS) -DZ7_LARGE_PAGES
!ENDIF

!include "Arc.mak"

COMPRESS_OBJS = $(COMPRESS_OBJS) \
  $O\CodecExports.obj \

AR_OBJS = $(AR_OBJS) \
  $O\ArchiveExports.obj \
  $O\DllExports2.obj \


!include "../../7zip.mak"
