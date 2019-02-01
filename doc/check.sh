RESULT=`grep "didialift.com"  -R --exclude-dir=chameleon --exclude-dir=beatles-chameleon.github.io --exclude-dir=.git --exclude=*.sh ./`
echo "$RESULT"
DIDI_COUNT=`echo "$RESULT" | sed -e '/^$/d' | wc -l`
if [ $DIDI_COUNT -gt "0" ];then
echo '发布过程停止，请检查'
exit 1;
fi
