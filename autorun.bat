@doskey h=cd %USERPROFILE%

@doskey ls=dir /x $*
@doskey l=dir /x $*
@doskey ll=dir /w $*
@doskey la=dir /x /a $*

@doskey cp=copy
@doskey mv=move
@doskey rm=del /p $*
@doskey cat=type

@doskey v=vim

@doskey pserve=python -m SimpleHTTPServer

@doskey g=git
@doskey gst=git status
@doskey gdf=git diff
@doskey gp=git push
@doskey gl=git pull