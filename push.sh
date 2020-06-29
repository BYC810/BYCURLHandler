#!/bin/bash
# 使用此脚本的时候 注释的内容不要有空格否则提交不成功
increment_version ()
{
  declare -a part=( ${1//\./ } )
  declare    new
  declare -i carry=1

  for (( CNTR=${#part[@]}-1; CNTR>=0; CNTR-=1 )); do
    len=${#part[CNTR]}
    new=$((part[CNTR]+carry))
    [ ${#new} -gt $len ] && carry=1 || carry=0
    [ $CNTR -gt 0 ] && part[CNTR]=${new: -len} || part[CNTR]=${new}
  done
  new="${part[*]}"
  
  NewVersionNumber=${new// /.}
} 

CommitMsg=$1
if [ "$CommitMsg" = "" ]
then
    echo "请输入改动的内容注释"
    read CommitMsg
    while([[ "$CommitMsg" = "" ]])
    do
    echo "请输入改动的内容注释"
    read CommitMsg
done
fi

git stash
git pull origin master --tags
git stash pop

VersionString=`grep -E 's.version.*=' BYCURLHandler.podspec`
VersionNumber=`tr -cd 0-9 <<<"$VersionString"`
NewVersionNumber=""
for ((i=0;$i<${#VersionNumber};i=$i+1));
do 
	NewVersionNumber=$NewVersionNumber${VersionNumber:$i:1}"."
    echo $NewVersionNumber;
done

OldVersionNumber=${NewVersionNumber: 0:${#NewVersionNumber}-1}
increment_version $OldVersionNumber

LineNumber=`grep -nE 's.version.*=' BYCURLHandler.podspec | cut -d : -f1`

sed -i "" "s/$OldVersionNumber/$NewVersionNumber/g" BYCURLHandler.podspec

echo "旧标签：${OldVersionNumber}, 新标签：${NewVersionNumber}"

git add .
git commit -am ${CommitMsg}
git tag ${NewVersionNumber}
git push origin master --tags
cd ~/.cocoapods/repos/KFTSpecs/ && git pull origin master && cd - && pod repo push KFTSpecs BYCURLHandler.podspec --verbose --allow-warnings --use-libraries
