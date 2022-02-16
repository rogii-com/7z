
!IFDEF 7Z_DEBUG
PROG = 7zd.dll
CFLAGS = $(CFLAGS) -wd4996  /D "_DEBUG" -Zi -I ../../../ \
  -DEXTERNAL_CODECS \

!ELSE
PROG = 7z.dll
CFLAGS = $(CFLAGS) -wd4996 /D "NDEBUG" -Zi -I ../../../ \
  -DEXTERNAL_CODECS \

!ENDIF

DEF_FILE = ../../Archive/Archive2.def

!IFNDEF UNDER_CE
CFLAGS = $(CFLAGS) -D_7ZIP_LARGE_PAGES
!ENDIF

!include "Arc.mak"

COMPRESS_OBJS = $(COMPRESS_OBJS) \
  $O\CodecExports.obj \

AR_OBJS = $(AR_OBJS) \
  $O\ArchiveExports.obj \
  $O\DllExports2.obj \


!include "../../7zip.mak"
