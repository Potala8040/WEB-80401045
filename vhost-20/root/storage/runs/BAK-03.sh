#!/bin/bash
DIR_0001=/root/storage/files
DIR_0002=/vhs/kangle/etc
BAK_0001=$(date +"%Y%m%d%H")_
BAK_0002=$(date -d -10day +"%Y%m%d%H")_
BAK_0003=$(date -d -30day +"%Y%m%d%H")_
BAK_0004=CON.gz
BAK_0005=CON.tar.gz
cd $DIR_0001
tar zcf $DIR_0001/$BAK_0001$BAK_0005 $DIR_0002
rm -rf $DIR_0001/$BAK_0002$BAK_0005
lftp ftp.cdn.qcloud.com -u 1251043285_profile05,haokeweiIII123 << EOF
mput $BAK_0001$BAK_0005
rm -rf $BAK_0003$BAK_0005
bye
EOF